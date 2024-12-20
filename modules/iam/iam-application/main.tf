resource "scaleway_iam_application" "this" {
  name            = var.name
  description     = var.description
  organization_id = var.organization_id
}

resource "scaleway_iam_api_key" "this" {
  count          = var.create_apikey ? 1 : 0
  description    = var.apikey_description
  application_id = scaleway_iam_application.this.id
  expires_at     = var.apikey_expires_at
  default_project_id = var.s3_project_id
}
