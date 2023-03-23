resource "aws_ssoadmin_permission_set" "aws_cloud_admin_permission_set" {
  name         = "AWSCloudAdmin"
  description  = "Permission set for AWS Cloud Admin user/group"
  instance_arn = tolist(data.aws_ssoadmin_instances.idc_instance.arns)[0]
  session_duration = "PT1H"
}