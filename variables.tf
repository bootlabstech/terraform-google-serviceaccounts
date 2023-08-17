variable "service_accounts" {
  type        = list(string)
  description = "The list of service accounts"
}
variable "project_id" {
  type        = string
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}
variable "location" {
  type        = string
  description = "The location of the service accounts secrets created"
}
variable "cmek" {
  type        = string
  description = "The cmek for the service accounts secrets created"
}
variable "description" {
  type        = list(string)
  description = "The description of the service accounts created"
}
variable "display_name" {
  type        = list(string)
  description = "The display name of the service accounts created"
}