# provider "aws" {
#   alias  = "security_account"
#   region = "us-east-1"
#   assume_role {
#     role_arn = "arn:${data.aws_partition.current.partition}:iam::${var.security_account_id}:role/AWSAFTExecution"
#   }
#   default_tags {
#     tags = {
#       managed_by = "AFT"
#     }
#   }
# }