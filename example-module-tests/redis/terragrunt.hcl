terraform {
  source = "${include.root.locals.source_url}//modules/redis?ref=${include.root.locals.source_version}"
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
    redis-0 = {
      name      = "redis-0"
      project_id = dependency.account-project.outputs.project_id
      redis_zone      = "nl-ams-1"
      node_type = "RED1-2XS"
      cluster_size = 1
      version   = "7.0.5" # 6.2.7
      settings = {}
      tls_enabled = true
      user_name        = "redisadmin"
      password_length = 20
      acls = [
        {
          ip          = "0.0.0.0/0"
          description = "Allow all"
        }

      ]
    }
  }
}
