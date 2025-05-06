# Azure Variables
variable "rgname" {
  type        = string
  default     = "william-resources"
  description = "Resource group name"
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Resource location"
}

variable "storageaccount_name" {
  type        = string
  default     = "stwilliam"
  description = "Storage account name"
}

variable "container_name" {
  type        = string
  default     = "blobcontainer"
  description = "Blob container name"
}

locals {
  sku                 = "Standard"
  env                 = "prod"
  rg_name            = upper("${var.rgname}-WE-001")
  storageaccount_name = lower("st${var.storageaccount_name}")
  container_name     = lower(var.container_name)
}