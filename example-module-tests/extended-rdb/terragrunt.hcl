terraform {
  source = "${include.root.locals.source_url}//modules/rdb?ref=${include.root.locals.source_version}"
}

include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

dependency "account-project" {
  config_path    = "../account-project/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    project_id              = "00000000-0000-0000-0000-000000000000"
  }
}


inputs = {
  databases = {
    main = {
      name           = "rdb-example"
      node_type      = "DB-DEV-S"
      rdb_region     = "nl-ams"
      rdb_zone       = "nl-ams-1"
      project_id     = dependency.account-project.outputs.project_id
      engine         = "PostgreSQL-14"
      is_ha_cluster  = false
      disable_backup = false
      dbs = [
        "example-db"
      ],
      users = [
        {
          username        = "example-user"
          password_length = 24
          is_admin        = false
        },
        }
      }
      }


