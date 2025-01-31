terraform {
  source = "${include.root.locals.source_url}//modules/k8s-cluster/argocd?ref=${include.root.locals.source_version}"
}

include "root" {
  path   = find_in_parent_folders("${get_terragrunt_dir()}/../../terragrunt.hcl")
  expose = true
}

dependency "account-project" {
  config_path    = "../../account-project/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    project_id              = "00000000-0000-0000-0000-000000000000"
  }
}

dependency "k8s-cluster" {
  config_path                             = "../"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    cluster_endpoint                  = "mock-cluster-endpoint"
    cluster_ca_cert                   = "bW9ja21vY2ttb2NrCg=="
    cluster_token                     = "bW9ja21vY2ttb2NrCg=="
  }
}

inputs = {
  deployment_prefix ="testing-dev"
  argocd_namespace = "argocd"
  argocd_helm_chart_version = "5.27.3"
  argocd_values_file = "values-repo.yaml"
  cluster_endpoint = dependency.k8s-cluster.outputs.cluster_endpoint
  cluster_ca_cert  = dependency.k8s-cluster.outputs.cluster_ca_cert
  cluster_token    = dependency.k8s-cluster.outputs.cluster_token

  initial_bootstrap = {
    namespace      = "argocd",
    path           = "cluster-bootstrap",
    repoURL        = "git@gitlab.inheaden.io:XXX.git",
    targetRevision = "main"
  }

}
