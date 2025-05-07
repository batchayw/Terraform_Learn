# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

# Create a storage account
resource "azurerm_storage_account" "st" {
  name                     = local.storageaccount_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = local.sku
  account_replication_type = "GRS"

  tags = {
    environment = local.env
  }
  depends_on = [azurerm_resource_group.rg]
}

# Create a file share
resource "azurerm_storage_share" "share" {
  name                 = local.share_name
  storage_account_name = azurerm_storage_account.st.name
  quota                = var.quota

  depends_on = [azurerm_storage_account.st]
}

# Create a container group with a volume
resource "azurerm_container_group" "aci" {
  name                = local.aci_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"

  container {
    name   = "example-container"
    image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }

    volume {
      name       = "filesharevolume"
      mount_path = "/mnt/fileshare"
      share_name = azurerm_storage_share.share.name
      storage_account_name = azurerm_storage_account.st.name
      storage_account_key  = azurerm_storage_account.st.primary_access_key
    }
  }

  tags = {
    environment = local.env
  }
  depends_on = [azurerm_storage_share.share]
}