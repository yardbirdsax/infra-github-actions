variable "allowed_account_ids" {
  type        = list(string)
  description = "A list of AWS Account IDs that the provider can deploy to."
}

variable "aws_profile_name" {
  type        = string
  description = "The AWS profile name to use for the provider."
  default     = null
}