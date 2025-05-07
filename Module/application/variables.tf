variable "rgname" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Resource location"
}

variable "service_plan_name" {
  type        = string
  description = "Service plan name"
}

variable "webapp_name" {
  type        = string
  description = "Web app name"
}

locals {
  env                = "prod"
  service_plan_name = upper("SP-${var.service_plan_name}-WE-001")
  webapp_name       = lower("app-${var.webapp_name}we-001")
}