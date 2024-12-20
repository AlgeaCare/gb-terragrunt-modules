variable "loadbalancers" {
  type        = map(any)
  description = "The Scaleway Load Balancers configurations"
}

variable "lb_region" {
  type        = string
  description = "Region to be used with the Scaleway provider"
  default     = "fr-par"
}

variable "lb_zone" {
  type        = string
  description = "Zone to be used with the Scaleway provider"
  default     = "fr-par-1"
}