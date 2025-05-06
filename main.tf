module "M_st" {
  source = "./Module/storage_account"
  rgname = var.resource_group_name
  location = var.location
  storageaccount_name = var.storage_account_name
}
