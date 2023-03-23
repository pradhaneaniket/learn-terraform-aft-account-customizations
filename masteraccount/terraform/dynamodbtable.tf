# resource "aws_dynamodb_table" "ct_mgmt_terraform_state_lock" {
#   name           = "ct-mgmt-tf-state-lock"
#   read_capacity  = 5
#   write_capacity = 5
#   hash_key       = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }