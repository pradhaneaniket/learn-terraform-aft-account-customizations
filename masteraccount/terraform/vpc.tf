data "aws_caller_identity" "current" {}

resource "aws_vpc" "sharedService" {
  cidr_block       = "10.0.1.0/23"

  tags = {
    Name = "MasteAccountVPC"
  }
}
