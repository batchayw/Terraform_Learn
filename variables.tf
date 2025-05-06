# Ces variables sont placer pour effectuer une surcharge du module "storage_account et autres". 
# Dans le cas contraire il va prendre les valeurs par defaut définie dans les fichiers 'variables.tf' de chaque module

variable "resource_group_name" {
  type = string
  default = "test"
}

variable "location" {
  type = string
  default = "West Europe"
}

variable "storage_account_name" {
  type = string
  default = "william001"
}