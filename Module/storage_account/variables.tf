# Azure Variables 
# les variable de type 'var' peut-etre surchager au moment du test 
# les variables de types 'local' ne sont pas modifiable pas contre. 
variable "rgname" {
  type = string
  default = "william-resources"
  description = "resource_group_name"
}

variable "location" {
  type = string
  default = "West Europe"
  description = "resource_location"
}

variable "storageaccount_name" {
  type = string
  default = "storageaccountwilliam"
  description = "storageaccount"
}

#la valeur lower permet de placer toute les variable donnée dans le fichier terraforn.tfvars en miniscule
#la valeur upper par contre place toute en majiscule 
locals {
  sku = "Standard"
  env = "prod"
  storageaccount_name = lower(var.storageaccount_name)
  rg_name = upper("rg_${var.rgname}_001")
}