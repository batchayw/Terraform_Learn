# Create a PostgreSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "pg" {
  name                   = local.pg_name
  resource_group_name    = var.rgname
  location               = var.location
  version                = "13"
  administrator_login    = var.admin_login
  administrator_password = var.admin_password
  sku_name               = "GP_Standard_D2s_v3"
  storage_mb             = 32768

  tags = {
    environment = local.env
  }
}

# Create a PostgreSQL Database
resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = var.db_name
  server_id = azurerm_postgresql_flexible_server.pg.id
  collation = "en_US.utf8"
  charset   = "UTF8"

  depends_on = [azurerm_postgresql_flexible_server.pg]
}