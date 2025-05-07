# Ces variables sont placer pour effectuer une surcharge du module "storage_account et autres". 
# Dans le cas contraire il va prendre les valeurs par defaut définie dans les fichiers 'variables.tf' de chaque module

variable "resource_group_name" {
  type        = string
  default     = "william"
  description = "Resource group name"
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Resource location"
}

variable "storage_account_name" {
  type        = string
  default     = "william001"
  description = "Storage account name"
}

variable "pg_name" {
  type        = string
  default     = "william"
  description = "PostgreSQL server name"
}

variable "db_name" {
  type        = string
  default     = "mydb"
  description = "Database name"
}

variable "admin_login" {
  type        = string
  default     = "pgadmin"
  description = "PostgreSQL admin login"
}

variable "admin_password" {
  type        = string
  default     = "P@ssw0rd1234!"
  description = "PostgreSQL admin password"
  sensitive   = true
}

variable "service_plan_name" {
  type        = string
  default     = "william"
  description = "Service plan name"
}

variable "webapp_name" {
  type        = string
  default     = "william"
  description = "Web app name"
}