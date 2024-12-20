locals {

  node_pools_defaults_defaults = {
    node_type                   = "DEV1-L"
    autohealing                 = true
    autoscaling                 = false
    tags                        = ["ssh-enabled=false"]
    wait_for_pool_ready         = false
    container_runtime           = "containerd"
    root_volume_type            = "b_ssd"
    root_volume_size_in_gb      = 100
    use_random_pet_suffix       = false
  }

  node_pools_defaults = merge(
    local.node_pools_defaults_defaults,
    var.node_pools_defaults
  )

  node_pools = { for k, v in var.node_pools : k => merge(
    local.node_pools_defaults,
    v
  )
  }
}