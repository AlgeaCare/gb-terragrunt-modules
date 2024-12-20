resource "scaleway_vpc_private_network" "this" {
  for_each    = local.vpc_private_networks
  name        = try(each.value.name, each.key)
  region      = lookup(each.value, "region", null)
  project_id  = lookup(each.value, "project_id", null)
  tags        = lookup(each.value, "tags", [])
  is_regional = lookup(each.value, "is_regional", true)
  }

