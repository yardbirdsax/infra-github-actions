terraform {
  required_providers {
    aws = {
      version = "~>4"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region              = "us-east-2"
  allowed_account_ids = var.allowed_account_ids
  profile             = var.aws_profile_name
}

resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  thumbprint_list = ["15e29108718111e59b3dad31954647e3c344a231"]
  client_id_list  = ["sts.amazonaws.com"]
}