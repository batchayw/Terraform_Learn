# Call basic_app module  (Exemple)
module "M_st" {
  source = "./Module/storage_account"
  rgname = var.resource_group_name
  location = var.location
  storageaccount_name = var.storage_account_name
}

# Call basic_app module (Resource Group + Storage Account)
module "basic_app" {
  source              = "./Module/basic_app"
  rgname              = var.resource_group_name
  location            = var.location
  storageaccount_name = var.storage_account_name
}

# Call dbpg module (PostgreSQL Server + Database)
module "dbpg" {
  source          = "./Module/dbpg"
  rgname          = module.basic_app.rg_name
  location        = var.location
  pg_name         = var.pg_name
  db_name         = var.db_name
  admin_login     = var.admin_login
  admin_password  = var.admin_password
}

# Call application module (Service Plan + Web App)
module "application" {
  source             = "./Module/application"
  rgname             = module.basic_app.rg_name
  location           = var.location
  service_plan_name  = var.service_plan_name
  webapp_name        = var.webapp_name
}