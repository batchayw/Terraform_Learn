# Azure Variables
variable "rgname" {
  type        = string
  default     = "container-resources"
  description = "Resource group name"
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Resource location"
}

variable "acr_name" {
  type        = string
  default     = "registry"
  description = "Container registry name"
}

variable "aci_name" {
  type        = string
  default     = "containergroup"
  description = "Container group name"
}

locals {
  env        = "prod"
  rg_name   = lower(var.rgname)
  acr_name  = lower("acr${var.acr_name}we")
  aci_name  = lower("aci-${var.aci_name}")
}