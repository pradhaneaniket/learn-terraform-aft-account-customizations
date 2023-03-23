module "permissionSet" {
  source = "./modules/IAM"
  ct_management_account_id = var.ct_management_account_id
}
module "ct_management_account_vpc" {
  source = "./modules/VPC"
  ct_management_account_vpc = var.ct_management_account_vpc
}