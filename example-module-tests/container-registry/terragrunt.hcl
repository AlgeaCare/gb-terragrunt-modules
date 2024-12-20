terraform {
  source = "${include.root.locals.source_url}//modules/container-registry?ref=${include.root.locals.source_version}"
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
  name = "example-registry"
  description = "this is my awesome registry"
  is_public = false
  region = "nl-ams"
  project_id = dependency.account-project.outputs.project_id
}