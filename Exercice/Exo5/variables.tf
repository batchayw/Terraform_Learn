# Azure Variables
variable "rgname" {
  type        = string
  default     = "storage-resources"
  description = "Resource group name"
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Resource location"
}

variable "storageaccount_name" {
  type        = string
  default     = "storageaccount"
  description = "Storage account name"
}

variable "share_name" {
  type        = string
  default     = "fileshare"
  description = "File share name"
}

variable "aci_name" {
  type        = string
  default     = "containergroup"
  description = "Container group name"
}

variable "quota" {
  type        = number
  default     = 5
  description = "Quota for file share (in GB)"
}

locals {
  sku                 = "Standard"
  env                 = "prod"
  rg_name            = lower(var.rgname)
  storageaccount_name = lower(var.storageaccount_name)
  share_name         = lower(var.share_name)
  aci_name           = lower("aci-${var.aci_name}")
}