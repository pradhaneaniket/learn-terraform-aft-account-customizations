# # KMS Admin user onboarding
# resource "aws_identitystore_user" "aws_kms_admin_user" {
#   identity_store_id = tolist(data.aws_ssoadmin_instances.idc_instance.identity_store_ids)[0]
#   display_name      = "KMS Admin"
#   user_name         = "kmsadmin"
#   name {
#     given_name  = "kms"
#     family_name = "admin"
#   }

#   emails {
#     value = "kms.admin1@example.com"
#   }
# }

# resource "aws_identitystore_group_membership" "aws_kms_admin_user_membership" {
#   identity_store_id = tolist(data.aws_ssoadmin_instances.idc_instance.identity_store_ids)[0]
#   group_id          = aws_identitystore_group.aws_kms_admin_user_group.group_id
#   member_id         = aws_identitystore_user.aws_kms_admin_user.user_id
# }

# Network Admin user onboarding

resource "aws_identitystore_user" "aws_network_admin_user" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.idc_instance.identity_store_ids)[0]
  display_name      = "Network Admin"
  user_name         = "networkadmin"
  name {
    given_name  = "Network"
    family_name = "Admin"
  }

  emails {
    value = "network.admin2@example.com"
  }
}

resource "aws_identitystore_group_membership" "aws_network_admin_user_membership" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.idc_instance.identity_store_ids)[0]
  group_id          = aws_identitystore_group.aws_network_admin_user_group.group_id
  member_id         = aws_identitystore_user.aws_network_admin_user.user_id
}
