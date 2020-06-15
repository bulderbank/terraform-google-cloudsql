output "instance" {
  value = google_sql_database_instance.instance.connection_name
}

output "address" {
  value     = google_sql_database_instance.instance.ip_address.0.ip_address
  sensitive = true
}

output "secrets" {
  value = kubernetes_secret.credential_secret.*.metadata.0.name
}

output "databases" {
  value = google_sql_database.database.*.name
}

output "usernames" {
  value     = google_sql_user.database_user.*.name
  sensitive = true
}

output "passwords" {
  value     = google_sql_user.database_user.*.password
  sensitive = true
}
