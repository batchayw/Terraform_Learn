# Resource group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

# Container Registry
resource "azurerm_container_registry" "acr" {
  name                = local.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true

  tags = {
    environment = local.env
  }
  depends_on = [azurerm_resource_group.rg]
}

# Container Group
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
  }

  tags = {
    environment = local.env
  }
  depends_on = [azurerm_container_registry.acr]
}