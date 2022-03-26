output "sa_emails" {
    value = {
        for k, v in google_service_account.service_account : k => v.email
    }
}