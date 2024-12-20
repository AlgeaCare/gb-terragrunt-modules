terraform {
  source = "${include.root.locals.source_url}//modules/doppler-secrets?ref=${include.root.locals.source_version}"
}

include "root" {
  path           = find_in_parent_folders()
  expose         = true
}

dependency "account-project" {
  config_path                             = "../account-project/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    project_id = "00000000-0000-0000-0000-000000000000"
  }
}

dependency "object-bucket" {
  config_path                             = "../object-bucket/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    this = {
      testingbucketnamekjz = {
      region_endpoint = "https://s3.nl-ams.scw.cloud"
    }
    }
  }
}

dependency "rdb" {
  config_path                             = "../rdb/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    this = {
      main = {
        endpoint_ip_port = "1.2.3.4:1234"
        dbs = [
          {
            name = "example-db"
          }
        ],
        users = [
          {
            username        = "example-user"
            password        = "supersecrtetpassword"
            username_password = "example-user:supersecrtetpassword"
          }
        ]
      }
    }
  }
}

locals {
  doppler_project = "terraform-test"
  doppler_config = "dev"
  default_instance = "main"
}


inputs = {
  secret_entries = {
    BUCKET_ENDPOINT = {
      name          = "BUCKET_ENDPOINT"
      value         = dependency.object-bucket.outputs.this["testingbucketnamekjz"].region_endpoint # bucket name and region endpoint are exposed
      project       = local.doppler_project
      config        = local.doppler_config
    }
    DB_URL = {
      name          = "DB_URL"
      value         = "postgres://${dependency.rdb.outputs.this["main"].users[0].username_password }@${dependency.rdb.outputs.this["main"].endpoint_ip_port}/${dependency.rdb.outputs.this["main"].dbs[0].name}?sslmode=required"
      project       = local.doppler_project
      config        = local.doppler_config
    }
    }
  }