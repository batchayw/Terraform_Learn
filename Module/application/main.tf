# Create a Service Plan
resource "azurerm_service_plan" "asp" {
  name                = local.service_plan_name
  location            = var.location
  resource_group_name = var.rgname
  os_type             = "Linux"
  sku_name            = "S1"

  tags = {
    environment = local.env
  }
}

# Create a Web App with a container
resource "azurerm_linux_web_app" "webapp" {
  name                = local.webapp_name
  location            = var.location
  resource_group_name = var.rgname
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