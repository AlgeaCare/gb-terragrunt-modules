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
  #mock_outputs_merge_strategy_with_state = "shallow"
  mock_outputs = {
    this = {
      testbucket = {
        region_endpoint = "https://s3.nl-ams.scw.cloud"
        region          = "nl-ams"
        bucket_name            = "bucketname"
      }
    }
  }
}

locals {
  doppler_project = "terraform-test"
  doppler_config = "dev"
  default_instance = "main"
  test_value = "terragrunt"
}


inputs = {
  secret_entries = {
    PROJECT_ID = {
      name          = "PROJECT_ID"
      value         = dependency.account-project.outputs.project_id
      project       = local.doppler_project
      config        = local.doppler_config
    },
    S3_ENDPOINTS = {
      name          = "S3_ENDPOINTS"
      value         = dependency.object-bucket.outputs.this["testbucket"].region_endpoint
      project       = local.doppler_project
      config        = local.doppler_config
    },

    S3_REGIONS = {
      name          = "S3_REGIONS"
      value         = dependency.object-bucket.outputs.this["testbucket"].region
      project       = local.doppler_project
      config        = local.doppler_config
    },

    S3_CONTAINERS = {
      name          = "S3_CONTAINERS"
      value         = dependency.object-bucket.outputs.this["testbucket"].bucket_name
      project       = local.doppler_project
      config        = local.doppler_config
    },

  }
}