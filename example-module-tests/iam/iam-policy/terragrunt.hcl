terraform {
  source = "${include.root.locals.source_url}//modules/iam/iam-policy/?ref=${include.root.locals.source_version}"
}

include "root" {
  path           = find_in_parent_folders()
  expose         = true
}

dependency "iam-application" {
  config_path    = "../iam-application/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    id              = "00000000-0000-0000-0000-000000000000"
  }
}

dependency "account-project" {
  config_path    = "../../account-project/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    project_id              = "00000000-0000-0000-0000-000000000000"
  }
}

inputs = {
  name           = "policy-kosmos-external-node"
  description    = "Policy to give external nodes access to the K8S Kosmos Cluster"
  application_id = dependency.iam-application.outputs.id
  #organization_id    = "00000000-0000-0000-0000-000000000000" # Inherit from global orga ID
  rules = [
    {
    #organization_id    = "00000000-0000-0000-0000-000000000000"
    project_ids          = [dependency.account-project.outputs.project_id]
    permission_set_names = ["KubernetesExternalNodeRegister"]
    }
  ]

}

