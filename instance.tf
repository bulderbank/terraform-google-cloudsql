resource "google_sql_database_instance" "instance" {
  name             = "${var.instance_name}-${var.environment}"
  project          = var.google_project
  region           = var.google_region
  database_version = var.instance_version

  settings {
    tier              = var.instance_configuration
    activation_policy = "ALWAYS"
    availability_type = var.instance_availability
    disk_type         = "PD_SSD"
    user_labels       = local.labels
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.instance_network
    }
    backup_configuration {
      enabled    = var.instance_backup_enabled
      start_time = var.instance_backup_time
    }
    maintenance_window {
      day          = 3
      hour         = 07
      update_track = "stable"
    }
  }

  lifecycle {
    ignore_changes = [
      settings[0].replication_type
    ]
  }
}

