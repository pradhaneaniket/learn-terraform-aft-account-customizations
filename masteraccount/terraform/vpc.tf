

resource "aws_vpc" "masteraccountvpc" {
  cidr_block       = "10.0.1.0/24"

  tags = {
    Name = "MasteAccountVPC"
  }
}
