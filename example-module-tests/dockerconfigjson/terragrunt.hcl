terraform {
  source = "${include.root.locals.source_url}//modules/dockerconfigjson?ref=${include.root.locals.source_version}"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

locals {
  cr_user = "nologin"
}

dependency "container-registry" {
  config_path                             = "../container-registry/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    endpoint = "https://cr.endpoint.scw.cloud"
  }
}

dependency "iam-application-cr" {
  config_path                             = "../container-registry/iam-application/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    scw_access_key = "00000000-0000-0000-0000-000000000000"
    scw_secret_key = "00000000-0000-0000-0000-000000000000"
  }
}

inputs =  {
  container_registry_username = local.cr_user
  container_registry_password = dependency.iam-application-cr.outputs.scw_secret_key
  container_registry_endpoint = dependency.container-registry.outputs.endpoint
  container_registry_name     = "exampleregistry" # TODO: getting value from container-registry module (no hardcoding)
}
