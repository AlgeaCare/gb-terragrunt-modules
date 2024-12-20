resource "scaleway_iam_group" "this" {
  name            = var.name
  description     = var.description
  user_ids        = var.user_ids
  application_ids = var.application_ids
  organization_id = var.organization_id
}
