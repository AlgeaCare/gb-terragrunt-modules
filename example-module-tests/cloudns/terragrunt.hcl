terraform {
  source = "${include.root.locals.source_url}//modules/cloudns?ref=${include.root.locals.source_version}"
}

include "root" {
  path           = find_in_parent_folders()
  expose         = true
}


inputs = {
  dns_entries = {
    dev = {
      name     = "tftestdev"
      type     = "A"
      zone     = "inheaden.dev"
      value    = "1.2.3.4"
      ttl      = 600
    }
    staging = {
      name          = "tfteststaging"
      type          = "A"
      zone          = "inheaden.dev"
      value         = "1.2.3.4"
      ttl           = 600
    }
  }
}