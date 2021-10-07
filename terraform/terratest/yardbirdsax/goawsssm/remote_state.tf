terraform {
  backend "s3" {
    bucket = "jef-terratest-tf-remote-state"
    key    = "iam/github_actions/yardbirdsax/goawsssm/terraform.tfstate"
    region = "us-east-2"
  }
}