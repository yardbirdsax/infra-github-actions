terraform {
  required_providers {
    aws = {
      version = "3.54.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  allowed_account_ids = var.allowed_account_ids
}

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://vstoken.actions.githubusercontent.com"
  thumbprint_list = [ "a031c46782e6e6c662c2c87c76da9aa62ccabd8e" ]
  client_id_list = formatlist("https://github.com/%s", var.github_owner_list)
}