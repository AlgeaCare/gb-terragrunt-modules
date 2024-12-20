locals {

  acl_configs = flatten([
    for database, config in local.databases : [
      for acl in config.acls : {
        database = database
        rule     = acl
      }
    ]
  ])
  acls_by_database = {
    for index, config in local.acl_configs :
    "${config.database}_${index}" => config
  }


  default_redis = {
    name      = "default"
    node_type = "RED1-S"
    version   = "6.2.6"
    username = "redisadmin"
    password  = null
    settings  = {}
    acls      = []
    tags      = []

    private_network = {}
  }
  databases = {
    for database_name, config in var.databases :
    database_name => merge(local.default_redis , config)
  }
}
