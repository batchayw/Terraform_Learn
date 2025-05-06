# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

resource "azurerm_storage_account" "st" {
  name                     = local.storageaccount_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = local.sku
  account_replication_type = "GRS"
  
  tags = {
    environment = local.env
  }
  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_storage_share" "sh" {
  name                 = local.share_name
  storage_account_name = azurerm_storage_account.st.name
  quota                = var.quota
}