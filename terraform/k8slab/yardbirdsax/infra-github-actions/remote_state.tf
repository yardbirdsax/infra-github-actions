terraform {
  backend "s3" {
    bucket  = "jef-k8slab-tf-remote-state"
    key     = "iam/github_actions/yardbirdsax/infra-github-actions/terraform.tfstate"
    region  = "us-east-2"
    profile = "k8slab"
  }
}