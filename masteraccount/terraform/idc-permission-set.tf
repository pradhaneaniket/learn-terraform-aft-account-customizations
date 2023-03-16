# AWS KMSAdmin Permission Set in Security Account

# resource "aws_ssoadmin_permission_set" "aws_kms_admin_permission_set" {
#   name         = "AWSKMSAdminPS"
#   description  = "Permission set for KMS Admin user/group"
#   instance_arn = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
# }

# resource "aws_ssoadmin_customer_managed_policy_attachment" "aws_kms_admin_permission_set_attachment" {
#   instance_arn       = aws_ssoadmin_permission_set.aws_kms_admin_permission_set.instance_arn
#   permission_set_arn = aws_ssoadmin_permission_set.aws_kms_admin_permission_set.arn
#   customer_managed_policy_reference {
#     name = var.aws_kms_admin_policy_name
#     path = "/"
#   }
# }

# resource "aws_ssoadmin_account_assignment" "security_account_permission_set_deploy" {
#   instance_arn       = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
#   permission_set_arn = aws_ssoadmin_permission_set.aws_kms_admin_permission_set.arn

#   principal_id   = aws_identitystore_group.aws_kms_admin_user_group.group_id
#   principal_type = "GROUP"

#   target_id   = var.security_account_id
#   target_type = "AWS_ACCOUNT"
# }

# AWS Network Admin Permission Set in Network Account

resource "aws_ssoadmin_permission_set" "aws_network_admin_permission_set" {
  name         = "AWSNetworkAdminPS"
  description  = "Permission set for Network Admin user/group"
  instance_arn = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
}

resource "aws_ssoadmin_managed_policy_attachment" "aws_network_admin_permission_set_attachment" {
  instance_arn       = aws_ssoadmin_permission_set.aws_network_admin_permission_set.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.aws_network_admin_permission_set.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/job-function/NetworkAdministrator"
}

resource "aws_ssoadmin_account_assignment" "network_account_permission_set_deploy" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.aws_network_admin_permission_set.arn

  principal_id   = aws_identitystore_group.aws_network_admin_user_group.group_id
  principal_type = "GROUP"

  target_id   = var.network_account_id
  target_type = "AWS_ACCOUNT"
}