# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

# Create a Service Plan
resource "azurerm_service_plan" "asp" {
  name                = local.service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "S1"

  tags = {
    environment = local.env
  }
  depends_on = [azurerm_resource_group.rg]
}

# Create a Web App with a container
resource "azurerm_linux_web_app" "webapp" {
  name                = local.webapp_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on = true
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = "https://index.docker.io"
    "WEBSITES_CONTAINER_IMAGE_NAME"       = "nginx:latest"
  }

  tags = {
    environment = local.env
  }
  depends_on = [azurerm_service_plan.asp]
}