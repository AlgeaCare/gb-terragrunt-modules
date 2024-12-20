locals {
  default_private_networks = {
    name        = "default_private_network"
    region      = null
    project_id  = null
    is_regional = true
    tags        = []
  }

  vpc_private_networks = {
  for vpc_name, config in var.private_networks :
  vpc_name => merge(local.default_private_networks , config)
  }
}