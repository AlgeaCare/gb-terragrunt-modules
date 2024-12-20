terraform {
  source = "${include.root.locals.source_url}//modules/k8s-cluster?ref=${include.root.locals.source_version}"
}
# git::ssh://git@github.com/foo/modules.git//path/to/module?ref=v0.0.1


include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "account-project" {
  config_path                             = "../account-project/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    project_id = "00000000-0000-0000-0000-000000000000"
  }
  mock_outputs_merge_strategy_with_state = "shallow"
}


dependency "vpc-private-network" {
  config_path                             = "../vpc_private_network/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
          this = {
        k8s_network = {
          id = "nl-ams/00000000-0000-0000-0000-000000000000"
        }
      }
  }
  mock_outputs_merge_strategy_with_state = "shallow"
}
#~ this = {
#      ~ k8s_network = "nl-ams/e54be922-c399-409b-91b5-d48b1822dcb3" -> {
#          + id           = "nl-ams/e54be922-c399-409b-91b5-d48b1822dcb3"


locals {
  # If Kapsule, the nodes needs to be in the same region
  k8s_region        = "nl-ams"
  default_pool_zone = "nl-ams-1"
}

inputs = {
  k8s_cluster_name        = "k8s-dev-myproject"
  k8s_cluster_type        = "kapsule" # Regional Kapsule
  k8s_cni                 = "calico" # Regional Kapsule
  k8s_cluster_region      = local.k8s_region # K8S is a regional product
  k8s_version             = "1.27.2"
  k8s_autoupgrade         = false
  k8s_autoupgrade_day     = "sunday"
  k8s_autoupgrade_hour    = 3
  k8s_project_id          = dependency.account-project.outputs.project_id
  k8s_tags                = ["ssh-enabled=false"]
  k8s_private_network_id  = split( "/", dependency.vpc-private-network.outputs.this["k8s_network"].id)[1]
  node_pools = {
    p-nl-ams-1 = {                       # Name will be used from key
      node_type           = "PLAY2-NANO" # If nodetype is external, zone needs to be null
      zone                = local.default_pool_zone
      region              = local.k8s_region
      project_id          = dependency.account-project.outputs.project_id
      size                = 1
      min_size            = 1
      max_size            = 1
      autoscaling         = false
      wait_for_pool_ready = true
      tags                = ["ssh-enabled=false"]
      root_volume_type       = "b_ssd"
      root_volume_size_in_gb = 25
      use_random_id_suffix   = true
    }
#    p-nl-ams-2 = {                       # Name will be used from key
#      node_type           = "PLAY2-NANO" # If nodetype is external, zone needs to be null
#      zone                = "nl-ams-2"
#      region              = local.k8s_region
#      project_id          = dependency.account-project.outputs.project_id
#      size                = 2
#      min_size            = 1
#      max_size            = 2
#      autoscaling         = false
#      wait_for_pool_ready = true
#      #tags = [ ]
#      root_volume_type       = "b_ssd"
#      root_volume_size_in_gb = 75
#      use_random_id_suffix   = true
#    }
  }
}

retryable_errors = [
  "(?s).*Error.*resource cluster with ID .* is not found.*"
]
#"(?s).*Error.*Required plugins are not installed.*"
