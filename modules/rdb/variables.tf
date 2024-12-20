variable "databases" {
  type        = map(any)
  description = "The scaleway Database configurations"
}

variable "rdb_region" {
  type        = string
  description = "Region to be used with the scaleway provider"
  default     = "fr-par"
}

variable "rdb_zone" {
  type        = string
  description = "Zone to be used with the scaleway provider"
  default     = "fr-par-1"
}
