variable "rgname" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Resource location"
}

variable "pg_name" {
  type        = string
  description = "PostgreSQL server name"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "admin_login" {
  type        = string
  description = "PostgreSQL admin login"
}

variable "admin_password" {
  type        = string
  description = "PostgreSQL admin password"
  sensitive   = true
}

locals {
  env     = "prod"
  pg_name = lower("pg-${var.pg_name}-we-001")
}