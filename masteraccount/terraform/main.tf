module "permissionSet" {
  source = "./module/IAM"
  ct_management_account_id = var.ct_management_account_id
}
module "ct_management_account_vpc" {
  source = "./module/VPC"
  ct_management_account_vpc = var.ct_management_account_vpc
}