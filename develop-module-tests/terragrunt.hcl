locals {
  source_url        = "../modules"
  source_version    = ""
  deployment_prefix = "terraform-module-test"
  region        = "nl-ams"
  zone          = "nl-ams-1"
  project_id    = ""
  organization_id = "e7e96346-a99e-462d-a6c4-ab40f1ec8713" # Inheaden Orga
  default_tags = {
    "TerminationDate"  = "Permanent",
    "Environment"      = "Development",
    "Team"             = "DevOps",
    "DeployedBy"       = "Terraform",
    "OwnerEmail"       = "christian.hein@inheaden.io"
    "DeploymentPrefix" = local.deployment_prefix
  }
}

# For every terragrunt file
#locals {
#  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
#  region = "us-east-1"
#}

# Configure Terragrunt to store state in Gitlab
# Generate a SCW Provider Block

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
EOF
}


##Generate a Provider Block
#generate "provider" {
#  path      = "provider_overwrite.tf"
#  if_exists = "overwrite_terragrunt"
#  contents  = <<-EOF
#    provider "scaleway" {
#      region          = var.region
#      zone            = var.zone
#      organization_id = var.organization_id
#    }
#
#    variable "region" {
#      description = "SCW Region."
#    }
#    variable "zone" {
#      description = "SCW Zone."
#    }
#
#    variable "organization_id" {
#      description = "SCW Orga ID"
#    }
#
#    provider "doppler" {
#      doppler_token = var.doppler_token
#    }
#
#    variable "doppler_token" {
#      type = string
#      description = "A token to authenticate with Doppler"
#    }
#  EOF
#}


retryable_errors = [
  "(?s).*Error.*Required plugins are not installed.*"
]

# Inputs
inputs = {
  region              = local.region
  zone                = local.zone
  project_id          = local.project_id
  organization_id     = local.organization_id
  deployment_prefix   = local.deployment_prefix
}