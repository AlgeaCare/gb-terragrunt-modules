#output "this" {
#  value = {
#    for name in keys(var.databases) : name => {
#      "instance" = scaleway_redis_cluster.this[name],
#      "acls"     = lookup(scaleway_redis_cluster.this[name].acl, name, []),
#      "users" = [
#        for identifier, config in local.user_by_database : {
#          "username" : config.user.username,
#          "password" : random_password.this[identifier].result,
#        } if config.database == name
#      ]
#    }
#  }
#  description = "A map of the scaleway_rdb_database (including their users) and scaleway_rdb_instance resources grouped by databases definitions"
#  sensitive   = true
#}


output "this" {
  value = {
    for name in keys(var.databases) : name => {
      "name"                = scaleway_redis_cluster.this[name].name
      "username"                = scaleway_redis_cluster.this[name].user_name
      "password"                = scaleway_redis_cluster.this[name].password
      "certificate"             = scaleway_redis_cluster.this[name].certificate
    }
  }
  description = "A map of the scaleway_rdb_database (including their users) and scaleway_rdb_instance resources grouped by databases definitions"
  sensitive   = true
}

output "instances" {
  sensitive = false
  value = {
    for name in keys(var.databases) : name => scaleway_redis_cluster.this[name].public_network
  }
  description = "A map of each created scaleway_rdb_instance with each `var.databases` definition as key"
}



