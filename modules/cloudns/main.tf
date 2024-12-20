# Adding an A record on the apex of the "something.cloudns.net" zone
resource "cloudns_dns_record" "this" {
  # something.cloudns.net 600 in A 1.2.3.4
  for_each = local.dns_entries
  name  = lookup(each.value, "name", null)
  zone  = lookup(each.value, "zone", null)
  type  = lookup(each.value, "type", null)
  value = lookup(each.value, "value", null)
  ttl   = lookup(each.value, "ttl", null)
}