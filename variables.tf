variable "created_on" {}

variable "created_by" {}

variable "environment" {}

variable "google_project" {}

variable "google_region" {}

variable "instance_name" {}

variable "instance_version" {}

variable "instance_availability" {}

variable "instance_configuration" {}

variable "instance_network" {}

variable "instance_backup_enabled" {}

variable "instance_backup_time" {}

variable "credential_secret_namespace" {}

variable "databases" {}

locals {
  labels = {
    created-with = "terraform"
    created-by   = var.created_by
    created-on   = var.created_on
    environment  = var.environment
  }
}
