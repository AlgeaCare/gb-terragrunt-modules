resource "scaleway_iam_policy" "this" {
  name            = var.name
  description     = var.description
  organization_id = var.organization_id
  application_id  = var.application_id
  user_id         = var.user_id
  group_id        = var.group_id
  no_principal    = var.no_principal

  dynamic "rule" {
    for_each = var.rules
    content {
      organization_id      = try(rule.value["organization_id"], null)
      project_ids          = try(rule.value["project_ids"], null)
      permission_set_names = rule.value["permission_set_names"]
    }
  }
}
