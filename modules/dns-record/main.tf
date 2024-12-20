# Adding an A record on the apex of the "something.cloudns.net" zone
resource "scaleway_domain_record" "this" {
  for_each = local.dns_entries
  name  = lookup(each.value, "name", null)
  dns_zone  = lookup(each.value, "dns_zone", null)
  type  = lookup(each.value, "type", null)
  data = lookup(each.value, "data", null)
  ttl   = lookup(each.value, "ttl", null)
}