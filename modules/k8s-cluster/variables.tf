variable "k8s_cluster_name" {
  description = "K8S Cluster Name"
  type        = string
}

variable "k8s_cluster_type" {
  description = "K8S cluster Type"
  type        = string
  default     = "multicloud"
}

variable "k8s_cni" {
  description = "K8S CNI"
  type        = string
  default     = "kilo"
}

variable "k8s_cluster_region" {
  description = "(Defaults to provider region) The region in which the cluster should be created"
  default     = ""
  type        = string
}

variable "k8s_cluster_description" {
  description = "K8S Cluster Description"
  type        = string
  default     = ""
}

variable "k8s_version" {
  description = "Offical K8S Version"
  type        = string
}

variable "k8s_tags" {
  description = "K8s tags"
  type        = list(any)
  default     = []
}

variable "k8s_auto_upgrade" {
  description = "Autoupgrade K8S"
  type        = bool
  default     = false
}

variable "k8s_project_id" {
  description = "Project ID for K8S Cluster"
  type        = string
  default     = ""
}

variable "k8s_private_network_id" {
  description = "Private Network ID for K8S Cluster"
  type        = string
  default     = null
}

variable "k8s_auto_upgrade_maintenance_day" {
  description = "Autoupgrade Maintenance Day"
  type        = string
  default     = ""
}

variable "k8s_auto_upgrade_maintenance_hour" {
  description = "Autoupgrade Maintenance start hour"
  type        = number
  default     = null
}


# Auto upgrade Config
variable "auto_upgrade" {
  default = {}
  type = object({
    enable                        = optional(bool, false)
    maintenance_window_start_hour = optional(number)
    maintenance_window_day        = optional(number)
  })
  description = "The auto upgrade configuration"
}


# Autoscaler Config
variable "autoscaler_config" {
  default = {}
  type = object({
    disable_scale_down               = optional(bool)
    scale_down_delay_after_add       = optional(string)
    scale_down_unneeded_time         = optional(string)
    estimator                        = optional(string)
    expander                         = optional(string)
    ignore_daemonsets_utilization    = optional(bool)
    balance_similar_node_groups      = optional(bool)
    expendable_pods_priority_cutoff  = optional(number)
    scale_down_utilization_threshold = optional(number)
    max_graceful_termination_sec     = optional(number)
  })
  description = "The configuration options for the Kubernetes cluster autoscaler"
}

# OpenID Configuration
# The openID Configuration is considered as ALPHA, but works pretty well.
#https://developers.scaleway.com/en/products/k8s/api/#open-id-connect-config-4edfd5

variable "open_id_connect_config" {
  default = {}
  type = object({
    issuer_url      = optional(string)
    client_id       = optional(string)
    username_claim  = optional(string)
    username_prefix = optional(string)
    groups_claim    = optional(list(string))
    groups_prefix   = optional(string)
    required_claim  = optional(list(string))
  })
  description = "The OpenID Connect configuration of the cluster"
}

# Node Pool Var with direct input
variable "node_pools" {
  default     = {}
  description = "Creates and manages Scaleway Kubernetes cluster pools"
  type        = any
}

variable "node_pools_defaults" {
  default     = {}
  description = "Default configuration for Kubernetes cluster pools"
  type        = map(any)
}