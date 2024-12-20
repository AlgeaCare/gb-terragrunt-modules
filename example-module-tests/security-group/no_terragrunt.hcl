terraform {
  source = "${include.root.locals.source_url}//modules/sc?ref=${include.root.locals.source_version}"
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


dependency "k8s-cluster" {
  config_path    = "../k8s-cluster/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    id              = "00000000-0000-0000-0000-000000000000"
    region          = "xx-xx"
  }
}



inputs = {
  security_groups = {
    sc-abc = {
        name                    = "kubernetes ${replace(dependency.k8s-cluster.outputs.id, format("%s/", dependency.k8s-cluster.outputs.region), "")}"
      # Example: kubernetes cf7c915f-1072-499d-84d3-842b0836e37e
        project_id              = dependency.account-project.outputs.project_id
        inbound_default_policy  = "accept" # | accept
        outbound_default_policy = "accept" # | accept
        stateful                = true # | false
        enable_default_security = false # | false
        sc_zone                 = "fr-par-1"
      }
  }
  }