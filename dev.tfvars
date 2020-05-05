created_on = "2020-04-15"
created_by = "fredrick-myrvoll"

environment    = "dev"
google_project = "module-dev"
google_region  = "europe-north1"

instance_name = "apps-postgres"

instance_version       = "POSTGRES_11"
instance_availability  = "ZONAL"
instance_configuration = "db-custom-1-4096"

instance_network = "projects/module-dev/global/networks/module-network"

instance_backup_enabled = true
instance_backup_time    = "06:00"

credential_secret_namespace = "module-dev-namespace"

databases = {
  module-dev-db = {
    user = "module_dev_user"
  }
}