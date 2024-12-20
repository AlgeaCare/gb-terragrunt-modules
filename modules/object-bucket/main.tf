resource "scaleway_object_bucket" "this" {
  for_each = local.object_buckets
  name = try(each.value.name, each.key)
  project_id = lookup(each.value, "project_id", null)
  region = lookup(each.value, "region", null)
  tags = lookup(each.value, "tags", {})
}


#dynamic "lifecycle_rule" {
#    for_each = lookup(each.value, "lifecycle_rule", {}) != {} ? [1] : []
#
#    content {
#      id = lookup(each.value.lifecycle_rule, "id", null)
#      prefix = lookup(each.value.lifecycle_rule, "prefix", null)
#      enabled = lookup(each.value.lifecycle_rule, "enabled", false)
#      expiration = lookup(each.value.lifecycle_rule, "expiration", null)
#      transition = lookup(each.value.lifecycle_rule, "transition", null)
#    }
#  }

#  lifecycle_rule = lookup(each.value, "lifecycle_rule", {})

