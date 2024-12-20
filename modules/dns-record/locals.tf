locals {
  default_dns = {
    name         = "dns_entry"
    dns_zone     = null
    type         = null
    data         = null
    ttl          = 600
  }

  dns_entries = {
  for dns_name, config in var.dns_entries :
  dns_name => merge(local.default_dns , config)
  }

}