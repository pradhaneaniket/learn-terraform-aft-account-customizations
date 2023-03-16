# Identity Center User Group for AWS KMS Admins
resource "aws_identitystore_group" "aws_kms_admin_user_group" {
  display_name      = "AWSKMSAdmin"
  description       = "KMS Key Administrator Group"
  identity_store_id = tolist(data.aws_ssoadmin_instances.idc_instance.identity_store_ids)[0]
}



# Identity Center User Group for AWS Network Admins
resource "aws_identitystore_group" "aws_network_admin_user_group" {
  display_name      = "AWSNetworkAdmin"
  description       = "Network Administrator Group"
  identity_store_id = tolist(data.aws_ssoadmin_instances.idc_instance.identity_store_ids)[0]
}