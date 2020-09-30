# Google CloudSQL

Module made for Terraform 0.12.x

### Code examples

```tf
module "cloudsql_postgres_apps" {
  source = "github.com/bulderbank/terraform-google-cloudsql"

  created_on = "2020-04-15"
  created_by = "fredrick-myrvoll"

  environment    = var.environment
  google_project = var.google_project
  google_region  = var.google_region

  instance_name = "apps-postgres"

  instance_version       = "POSTGRES_11"
  instance_availability  = "ZONAL"            // ZONAL for single-zone, REGIONAL for HA
  instance_configuration = "db-custom-1-4096" // db-custom-cpu_count-mem_mb

  instance_network = module.gcp.apps_vpc_network

  instance_backup_enabled = true
  instance_backup_time    = "06:00"

  credential_secret_namespace = var.k8s_apps_namespace

  databases = {
    finansportalen = {
      user = "finansportal_user"
    }
  }
}
```
