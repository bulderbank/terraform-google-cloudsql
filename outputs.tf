output "databases" {
  value = google_sql_database.database.*.name
}

output "secrets" {
  value = kubernetes_secret.credential_secret.*.metadata.0.name
}

output "address" {
  value = google_sql_database_instance.instance.ip_address.0.ip_address
}
