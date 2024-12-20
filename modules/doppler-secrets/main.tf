resource "doppler_secret" "this" {
  for_each = local.secret_entries
  name = lookup(each.value, "name", null)
  project = lookup(each.value, "project", null)
  config = lookup(each.value, "config", null)
  value = lookup(each.value, "value", null)
}