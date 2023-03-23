

resource "aws_vpc" "masteraccountvpc" {
  cidr_block       = var.ct_management_account_vpc

  tags = {
    Name = "networkaccountVPC"
  }
}
