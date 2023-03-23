

resource "aws_ssoadmin_permission_set" "aws_cloud_admin_permission_set" {
  name         = "AWSCloudAdmin"
  description  = "Permission set for AWS Cloud Admin user/group"
  instance_arn = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  session_duration = "PT1H"
}

resource "aws_ssoadmin_permission_set" "aws_infra_admin_permission_set" {
  name         = "AWSInfrAdmin"
  description  = "Permission set for AWS Infra Admin user/group"
  instance_arn = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  session_duration = "PT1H"
}
resource "aws_ssoadmin_permission_set" "aws_network_admin_permission_set" {
  name         = "AWSNetworkAdmin"
  description  = "Permission set for AWS Network Admin user/group"
  instance_arn = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  session_duration = "PT1H"
}
resource "aws_ssoadmin_permission_set" "aws_readonly_permission_set" {
  name         = "AWSReadOnly"
  description  = "Permission set for Read Only Access"
  instance_arn = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  session_duration = "PT1H"
}
resource "aws_ssoadmin_permission_set" "aws_security_permission_set" {
  name         = "AWSSecurityAdmin"
  description  = "Permission set for Security Team"
  instance_arn = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  session_duration = "PT1H"
}
resource "aws_ssoadmin_permission_set" "aws_database_permission_set" {
  name         = "AWSDatabaseAdmin"
  description  = "Permission set for Database Team"
  instance_arn = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  session_duration = "PT1H"
}
resource "aws_ssoadmin_permission_set" "aws_billing_permission_set" {
  name         = "AWSBillingAdmin"
  description  = "Permission set for Billing/Finance Team"
  instance_arn = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  session_duration = "PT1H"
}

#####Attaching Policy to Permission Set

resource "aws_ssoadmin_managed_policy_attachment" "aws_cloud_admin_permission_set_attachment" {
  instance_arn       = aws_ssoadmin_permission_set.aws_cloud_admin_permission_set.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.aws_cloud_admin_permission_set.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_ssoadmin_managed_policy_attachment" "aws_infra_admin_permission_set_attachment" {
  instance_arn       = aws_ssoadmin_permission_set.aws_infra_admin_permission_set.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.aws_infra_admin_permission_set.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#####Applying Permission Sets on Groups/Users

resource "aws_ssoadmin_account_assignment" "cloud_admin_permission_set_deploy" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.aws_cloud_admin_permission_set.arn

  principal_id   = "a3745872-6091-70b5-5020-81575c77ccf4"
  principal_type = "GROUP"

  target_id   = var.ct_management_account_id
  target_type = "AWS_ACCOUNT"
}
resource "aws_ssoadmin_account_assignment" "infra_admin_permission_set_deploy" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.aws_infra_admin_permission_set.arn

  principal_id   = "43a428e2-3021-70e7-5190-8b9b3ba8753b"
  principal_type = "GROUP"

  target_id   = var.ct_management_account_id
  target_type = "AWS_ACCOUNT"
}