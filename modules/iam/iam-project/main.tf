resource "scaleway_account_project" "this" {
  name            = var.name
  description     = var.description
  organization_id = var.organization_id
}

module "application" {
  source          = "../iam-application"
  name            = var.application.name
  description     = var.application.description
  create_apikey   = var.application.create_apikey
  organization_id = var.organization_id
}

module "policy" {
  source          = "../iam-policy"
  name            = "${var.name}-full-access"
  description     = "${var.name} full access"
  organization_id = var.organization_id
  application_id  = module.application.id

  rules = [
    {
      project_ids          = [scaleway_account_project.this.id]
      permission_set_names = ["AllProductsFullAccess"]
    }
  ]
}
