variable "rgname" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Resource location"
}

variable "storageaccount_name" {
  type        = string
  description = "Storage account name"
}

locals {
  sku                 = "Standard"
  env                 = "prod"
  rg_name            = upper("RG-${var.rgname}-WE-001")
  storageaccount_name = lower("ds${var.storageaccount_name}we001")
}