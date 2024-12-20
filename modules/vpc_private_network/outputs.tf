output "this" {
  sensitive = false
  value = {
  for name in keys(var.private_networks) : name =>
  {
    "name"         = scaleway_vpc_private_network.this[name].name,
    "id"           = split( "/", scaleway_vpc_private_network.this[name].id)[1]
    "vpc_id"       = scaleway_vpc_private_network.this[name].vpc_id,
    "region"       = scaleway_vpc_private_network.this[name].region,
    "ipv4_subnet"  = scaleway_vpc_private_network.this[name].ipv4_subnet,
    "ipv6_subnets" = scaleway_vpc_private_network.this[name].ipv6_subnets,
    "is_regional"  = scaleway_vpc_private_network.this[name].is_regional,

  }

  }
  description = "A map of each created Scaleway Private Network definition as key"
}