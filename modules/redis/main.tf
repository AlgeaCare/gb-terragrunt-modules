resource "random_password" "this" {
  for_each = local.databases

  length      = each.value.password_length
  min_numeric = 3
  min_lower   = 3
  min_upper   = 3
  special     = true
  override_special = "!()+"
}

resource "scaleway_redis_cluster" "this" {
  for_each = local.databases

  name      = try(each.value.name, each.key)
  node_type = lower(each.value.node_type)
  version   = lookup(each.value, "version", null)
  cluster_size = lookup(each.value, "cluster_size", null)

# Standalone mode (cluster_size = 1) : you can attach as many private networks as you want (each must be a separate block).
# If you detach your only private network, your cluster won't be reachable until you define a new private or public network.
# You can modify your private_network and its specs, you can have both a private and public network side by side.
#
# Cluster mode (cluster_size > 1) : you can define a single private network as you create your cluster, you won't be able to edit or detach it afterwards, unless you create another cluster.
# Your service_ips must be listed as follows:
#  service_ips = [
#  "10.12.1.10/20",
#  "10.12.1.11/20",
#  "10.12.1.12/20",
#  ]
  user_name = lookup(each.value, "username", null)
  password  = random_password.this[each.key].result

  zone     = lookup(each.value, "redis_zone", null)
  settings = lookup(each.value, "settings", {})
  tls_enabled = lookup(each.value, "tls_enabled", true)

  project_id = lookup(each.value, "project_id", null)
  tags = lookup(each.value, "tags", [])

  dynamic "acl" {
    for_each = each.value.acls

    content {
      ip          = acl.value["ip"]
      description = acl.value["description"]
    }
  }

  dynamic "private_network" {
    for_each = lookup(each.value, "private_network", {}) != {} ? [1] : []

    content {
      id = lookup(each.value.private_networking, "pvn_id", null)
      service_ips  = lookup(each.value.private_networking, "pn_service_ips", null)
    }
  }
}
