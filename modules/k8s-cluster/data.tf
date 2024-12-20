#data "scaleway_instance_security_group" "this" {
#  for_each           = local.node_pools
#  #zone               = try(each.value.zone, null) # Node Pools are zonal
#  zone               = try(each.value.zone, null) # Node Pools are zonal
#  name                = "kubernetes ${replace(scaleway_k8s_cluster.this.id, format("%s/", scaleway_k8s_cluster.this.region), "")}"
#}

# Does not work right now