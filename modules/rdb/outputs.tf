output "this" {
  value = {
    for name in keys(var.databases) : name => {
      "instance" = scaleway_rdb_instance.this[name],
      "endpoint_ip_port" = "${scaleway_rdb_instance.this[name].endpoint_ip}:${scaleway_rdb_instance.this[name].endpoint_port}"
      "acls"     = lookup(scaleway_rdb_acl.this, name, []),
      "users" = [
        for identifier, config in local.user_by_database : {
          "username" : config.user.username,
          "is_admin" : config.user.is_admin,
          "password" : random_password.this[identifier].result,
          "username_password" : "${config.user.username}:${random_password.this[identifier].result}",
          "identifier" : identifier
        } if config.database == name
      ],
      "dbs" = [
        for identifier, config in local.dbs_by_database :
        scaleway_rdb_database.this[identifier]
        if config.database == name
      ]
    }
  }
  description = "A map of the scaleway_rdb_database (including their users) and scaleway_rdb_instance resources grouped by databases definitions"
  sensitive   = true
}

output "instances" {
  sensitive = true
  value = {
    for name in keys(var.databases) : name => scaleway_rdb_instance.this[name]
  }
  description = "A map of each created scaleway_rdb_instance with each `var.databases` definition as key"
}

output "databases" {
  value = {
    for identifier, config in local.dbs_by_database :
    config.database => scaleway_rdb_database.this[identifier]...
  }
  description = "A map of each created scaleway_rdb_instance with each `var.databases` definition as key"
}
