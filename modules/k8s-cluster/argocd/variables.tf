variable "deployment_prefix" {
  description = "Prefix of the deployment"
  type        = string
}

variable "argocd_namespace" {
  description = "Namespace to install ArgoCD in"
  type = string
}

variable "argocd_helm_chart_version" {
  description = "ArgoCD Helm Chart version"
  type        = string
}

variable "argocd_values_file" {
  description = "ArgoCD Helm Chart values file"
  type        = string
  default     = null
}

variable "gitlab_private_repo_urls" {
  description = "GitLab repo urls"
  type        = any
  default     = {}
}

# tflint-ignore: terraform_unused_declarations

variable "argocd_configs" {
  type        = any
  description = "ArgoCD parameters"
  default     = null
}

variable "cluster_ca_cert" {
  description = "PEM based cluster ca certificate."
  type = string
}

variable "cluster_token" {
  description = "Token for authenticating to API-Server."
  type = string
}

variable "cluster_endpoint" {
  description = "Kubernetes endpoint/host"
  type = string

}

variable "initial_bootstrap" {
  description = "Parameters for ArgoCD initial bootstrap app"
  type        = any
  default     = {}
}


