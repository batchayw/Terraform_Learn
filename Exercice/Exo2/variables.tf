# Azure Variables
variable "rgname" {
  type        = string
  default     = "app-resources"
  description = "Resource group name"
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Resource location"
}

variable "service_plan_name" {
  type        = string
  default     = "serviceplan"
  description = "Service plan name"
}

variable "webapp_name" {
  type        = string
  default     = "webapp"
  description = "Web app name"
}

locals {
  env                = "prod"
  rg_name           = upper("RG-${var.rgname}")
  service_plan_name = upper("SP-${var.service_plan_name}-001")
  webapp_name       = lower("app-${var.webapp_name}-we")
}