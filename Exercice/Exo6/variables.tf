# Azure Variables
variable "rgname" {
  type        = string
  default     = "network-resources"
  description = "Resource group name"
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Resource location"
}

variable "vnet_name" {
  type        = string
  default     = "vnet"
  description = "Virtual network name"
}

variable "subnet_name" {
  type        = string
  default     = "subnet"
  description = "Subnet name"
}

variable "vm_name" {
  type        = string
  default     = "vmwin"
  description = "Virtual machine name"
}

variable "vm_sku" {
  type        = string
  default     = "Standard_B2s"
  description = "Virtual machine SKU"
}

locals {
  env         = "prod"
  rg_name    = lower("rg-${var.rgname}")
  vnet_name  = lower("vn-${var.vnet_name}")
  subnet_name = lower("sb${var.subnet_name}")
  nsg_name   = upper("NSG-${var.rgname}")
  vm_name    = lower("vm${var.vm_name}int")
}