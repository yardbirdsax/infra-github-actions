variable "github_owner_list" {
  type = list(string)
  description = "A list of GitHub orgs / users that the OIDC provider will trust."
}

variable "allowed_account_ids" {
  type = list(string)
  description = "A list of AWS Account IDs that the provider can deploy to."
}