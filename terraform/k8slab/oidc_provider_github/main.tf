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

data "http" "github_openid" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}

data "tls_certificate" "github_openid" {
  url = "https://token.actions.githubusercontent.com/.well-known/jwks"
}

resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  thumbprint_list = [data.tls_certificate.github_openid.certificates[0].sha1_fingerprint]
  client_id_list  = ["sts.amazonaws.com"]
}