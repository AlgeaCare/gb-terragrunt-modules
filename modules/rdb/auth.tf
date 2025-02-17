resource "random_password" "this" {
  for_each = local.user_by_database

  length      = each.value.user.password_length
  min_numeric = 1
#  min_lower   = 3
#  min_upper   = 3
  special     = true
#  override_special = "!()+"
  
#    keepers = {
#    trigger = timestamp()
#  }
}

resource "scaleway_rdb_user" "this" {
  for_each = local.user_by_database

  instance_id = scaleway_rdb_instance.this[each.value.database].id
  name        = each.value.user.username
  password    = random_password.this[each.key].result
  is_admin    = each.value.user.is_admin
}