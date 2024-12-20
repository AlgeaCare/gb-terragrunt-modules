terraform {
  source = "${include.root.locals.source_url}//modules/vpc_private_network?ref=${include.root.locals.source_version}"
}

include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

dependency "account-project" {
  config_path                             = "../account-project/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    project_id = "00000000-0000-0000-0000-000000000000"
  }
}


locals {
  default_region = "nl-ams"
}

inputs = {
  private_networks = {
    k8s_network = {
      name        = "k8s_network"
      project_id  = dependency.account-project.outputs.project_id
      region      = local.default_region
      tags        = ["k8s_network"]
    }
  }
}