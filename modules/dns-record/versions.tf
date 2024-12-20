terraform {
  required_version = ">= 1.4"
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = ">= 2.19"
    }
  }

}

provider "scaleway" {
  region          = var.region
  zone            = var.zone
  organization_id = var.organization_id
  project_id      = var.dns_project_id
}

variable "region" {
  description = "SCW Region."
}
variable "zone" {
  description = "SCW Zone."
}

variable "organization_id" {
  description = "SCW Orga ID"
}
