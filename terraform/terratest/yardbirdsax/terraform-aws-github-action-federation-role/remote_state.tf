terraform {
  backend "s3" {
    bucket = "jef-terratest-tf-remote-state"
    key    = "iam/github_actions/yardbirdsax/terraform-aws-github-action-federation/terraform.tfstate"
    region = "us-east-2"
  }
}