terraform {
  required_version = ">= 1.0.2"

  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = ">= 2.16"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca_cert)
    token                  = var.cluster_token
#    exec {
#      api_version = "client.authentication.k8s.io/v1beta1"
#      command     = "aws-iam-authenticator"
#      # This requires the aws-iam-authenticator to be installed locally where Terraform is executed
#      args = ["token", "-i", var.cluster_id]
#    }
  }
}

provider "kubectl" {
  apply_retry_count      = 5
  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_ca_cert)
  token                  = var.cluster_token
  load_config_file       = false

#  exec {
#    api_version = "client.authentication.k8s.io/v1beta1"
#    command     = "aws-iam-authenticator"
#    # This requires the aws-iam-authenticator to be installed locally where Terraform is executed
#    args = ["token", "-i", var.cluster_id]
#  }
}

provider "scaleway" {
  region          = var.region
  zone            = var.zone
  organization_id = var.organization_id
}

variable "region" {
  description = "SCW Region."
}
variable "zone" {
  description = "SCW Zone."
}

variable "organization_id" {
  description = "SCW Orga ID"
}