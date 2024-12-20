resource "scaleway_k8s_cluster" "this" {
  name                        = var.k8s_cluster_name
  description                 = var.k8s_cluster_description
  version                     = var.k8s_version
  type                        = var.k8s_cluster_type == "kapsule" ? null : var.k8s_cluster_type # When Kapsule is selected, cluster type is null
  cni                         = var.k8s_cluster_type == "multicloud" ? "kilo" : var.k8s_cni # When Kilo is selected, type needs to be multicloud
  tags                        = var.k8s_tags
  region                      = var.k8s_cluster_region
  project_id                  = var.k8s_project_id
  private_network_id          = var.k8s_private_network_id
  delete_additional_resources = false


  autoscaler_config {
    disable_scale_down               = try(var.autoscaler_config.disable_scale_down, null)
    scale_down_delay_after_add       = try(var.autoscaler_config.scale_down_delay_after_add, null)
    scale_down_unneeded_time         = try(var.autoscaler_config.scale_down_unneeded_time, null)
    estimator                        = try(var.autoscaler_config.estimator, null)
    expander                         = try(var.autoscaler_config.expander, null)
    ignore_daemonsets_utilization    = try(var.autoscaler_config.ignore_daemonsets_utilization, null)
    balance_similar_node_groups      = try(var.autoscaler_config.balance_similar_node_groups, null)
    expendable_pods_priority_cutoff  = try(var.autoscaler_config.expendable_pods_priority_cutoff, null)
    scale_down_utilization_threshold = try(var.autoscaler_config.scale_down_utilization_threshold, null)
    max_graceful_termination_sec     = try(var.autoscaler_config.max_graceful_termination_sec, null)
  }

  dynamic "auto_upgrade" {
    for_each = var.auto_upgrade.enable ? [1] : []
    content  {
      enable                        = var.auto_upgrade.enable
      maintenance_window_start_hour = var.auto_upgrade.maintenance_window_start_hour
      maintenance_window_day        = var.auto_upgrade.maintenance_window_day
    }
  }

  dynamic "open_id_connect_config" {
    for_each = var.open_id_connect_config.issuer_url != null || var.open_id_connect_config.client_id != null ? [1] : []
    content  {
      issuer_url      = var.open_id_connect_config.issuer_url
      client_id       = var.open_id_connect_config.client_id
      username_claim  = var.open_id_connect_config.username_claim
      username_prefix = var.open_id_connect_config.username_prefix
      groups_claim    = var.open_id_connect_config.groups_claim
      groups_prefix   = var.open_id_connect_config.groups_prefix
      required_claim  = var.open_id_connect_config.required_claim
    }
  }
}



