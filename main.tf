resource "google_service_account" "service_accounts" {
  count        = length(var.service_accounts)
  account_id   = var.service_accounts[count.index]
  description  = var.description[count.index]
  display_name = var.display_name[count.index]
  project      = var.project_id
}
resource "google_service_account_key" "service_account_keys" {
  count              = length(var.service_accounts)
  service_account_id = google_service_account.service_accounts[count.index].name
}
resource "google_project_service_identity" "sm_sa" {
  provider = google-beta

  project = var.project_id
  service = "secretmanager.googleapis.com"
}
resource "google_secret_manager_secret" "service_account_secrets" {
  count     = length(var.service_accounts)
  project   = var.project_id
  secret_id = "service-account-secret-${count.index}"
  replication {
    user_managed {
      replicas {
        location = var.location
        customer_managed_encryption {
          kms_key_name = var.cmek
        }
      }
    }
  }
  lifecycle {
    ignore_changes = [labels]
  }
  depends_on = [google_project_service_identity.sm_sa]
}

resource "google_secret_manager_secret_version" "service_account_secret_versions" {
  count  = length(var.service_accounts)
  secret = google_secret_manager_secret.service_account_secrets[count.index].id

  secret_data = google_service_account_key.service_account_keys[count.index].private_key
}
