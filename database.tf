resource "google_sql_database" "database" {
  count = length(keys(var.databases))

  name     = "${element(keys(var.databases), count.index)}-${var.environment}"
  project  = var.google_project
  instance = google_sql_database_instance.instance.name
  charset  = "UTF8"
}

// TODO replace with GCP Secret Manager dynamic credentials in the future, per database for now
resource "random_string" "password" {
  count   = length(keys(var.databases))
  length  = 32
  number  = true
  lower   = true
  upper   = true
  special = false
}

resource "google_sql_user" "database_user" {
  count = length(keys(var.databases))

  name     = lookup(element(values(var.databases), count.index), "user")
  project  = var.google_project
  instance = google_sql_database_instance.instance.name
  password = random_string.password[count.index].result

  depends_on = [
    google_sql_database_instance.instance,
  ]
}
