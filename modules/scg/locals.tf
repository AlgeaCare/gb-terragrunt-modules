locals {
  default_sc = {
    name                    = "default_sc"
    description             = "default_sc-description"
    project_id              = null
    inbound_default_policy  = null
    outbound_default_policy = null
    stateful                = true #  false
    enable_default_security = true #  false
    sc_zone                 = null
    inbound_acls           = []
#    ip_range = "0.0.0.0/0"
#    action = "accept" # drop
#    port = 22
#    protocol = "TCP"
    outbound_acls          = []
#    ip_range = "0.0.0.0/0"
#    action = "accept" # drop
#    port = 22
#    protocol = "TCP"

  }

#  security_group_configs = flatten([
#  for security_group, config in local.security_groups : [
#  for group in config.groups : {
#    security_group = security_group
#    group          = group
#  }
#  ]
#  ])

#  acl_configs = flatten([
#  for security_group, config in local.security_groups : [
#  for acl in config.inbound_acls : {
#    security_group = security_group
#    rule  = acl
#  }
#  ]
#  ])
#
#  acls_by_database = {
#  for index, config in local.acl_configs :
#  "${config.security_groups}_${index}" => config
#  }


  security_groups = {
  for security_group_name, config in var.security_groups :
  security_group_name => merge(local.default_sc, config)
  }


#  databases = {
#  for database_name, config in var.databases :
#  database_name => merge(local.default_database, config)
#  }

}

