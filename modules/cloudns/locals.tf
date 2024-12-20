locals {
  default_dns = {
    name         = "default_project"
    zone         = null
    type         = null
    value        = null
    ttl          = 600
  }

  dns_entries = {
  for dns_name, config in var.dns_entries :
  dns_name => merge(local.default_dns , config)
  }

}