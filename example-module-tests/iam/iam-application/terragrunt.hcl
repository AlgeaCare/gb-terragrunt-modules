terraform {
  source = "${include.root.locals.source_url}//modules/iam/iam-application/?ref=${include.root.locals.source_version}"
}

include "root" {
  path           = find_in_parent_folders()
  expose         = true
}

dependency "account-project" {
  config_path    = "../../account-project/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    project_id              = "00000000-0000-0000-0000-000000000000"
  }
}


inputs = {
  name               = "application-kosmos-external-node"
  description        = "Access to institate new external node in the kosmos cluster in project ${dependency.account-project.outputs.project_id}"
  apikey_description = "k8s node pool api key for external nodes in project ${dependency.account-project.outputs.project_id}"
  create_apikey      = true
}

