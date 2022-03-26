variable "service_accounts" {
  type = list(object({
    account_id   = account_id,
    display_name = string
  }))
  description = "The list of service accounts"
}

variable "project" {
  type        = string
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}