terraform {
  backend "s3" {
    bucket  = "jef-k8slab-tf-remote-state"
    key     = "iam/oidc_provider_github/terraform.tfstate"
    region  = "us-east-2"
    profile = "k8slab"
  }
}