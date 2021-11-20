terraform {
  required_providers {
    aws = {
      version = "3.54.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region              = "us-east-2"
  allowed_account_ids = var.allowed_account_ids
  profile             = var.aws_profile_name
}

data "aws_iam_policy_document" "policy" {
  statement {
    actions   = ["ec2:*", "iam:*", "ssm:*", "eks:*"]
    effect    = "Allow"
    resources = ["*"]
  }
  
  statement {
    actions   = ["s3:Put*", "s3:Get*", "s3:ListBucket"]
    effect    = "Allow"
    resources = [
      "arn:aws:s3:::jef-k8slab-tf-remote-state",
      "arn:aws:s3:::jef-k8slab-tf-remote-state/*"
    ]
  }
}

resource "aws_iam_policy" "policy" {
  name   = "GitHub-Actions-${var.github_org_name}-${var.github_repository_name == "*" ? "all" : var.github_repository_name}"
  policy = data.aws_iam_policy_document.policy.json
}

module "iam_role" {
  source = "git@github.com:yardbirdsax/terraform-aws-github-action-federation-role?ref=0.0.2"

  iam_role_name          = var.iam_role_name
  github_org_name        = var.github_org_name
  github_repository_name = var.github_repository_name
  github_branch_names    = var.github_branch_names
  oidc_provider_arn      = var.oidc_provider_arn
  iam_policy_arns        = [aws_iam_policy.policy.arn]
}