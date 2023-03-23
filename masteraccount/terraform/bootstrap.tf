terraform {
  backend "s3" {
    bucket         = "ct-management-account-tf-state"
    key            = "MGMT/terraform.tfstate"
    region         = "eu-central-1"
    # dynamodb_table = "ct-tf-state-lock"
  }
  required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 3.0"
      }
    }
}
