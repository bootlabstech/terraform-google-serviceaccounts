resource "google_service_account" "service_account" {
  for_each     = { for sa in var.service_accounts : sa.account_id => sa }
  account_id   = each.value.account_id
  display_name = each.value.display_name
  project      = var.project
}