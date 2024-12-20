resource "scaleway_registry_namespace" "this" {
  name        = var.name
  description = var.description
  is_public   = var.is_public
  region      = var.registry_region
  project_id  = var.project_id
}