variable "container_registry_name" {
  type = string
  default = null
  description = "CR username to construct docker config json"
}

variable "container_registry_endpoint" {
  type = string
  default = null
  description = "CR registry to construct docker config json"
}

variable "container_registry_username" {
  type = string
  default = null
  description = "CR username to construct docker config json"
}


variable "container_registry_password" {
  type = string
  default = null
  description = "CR password to construct docker config json"
}

#variable "container_registry_password_user_base64" {
#  type = string
#  default = null
#  description = "container_registry_password_user_base64"
#}
#
#variable "configjson" {
#  type = string
#  default = null
#  description = "docker config.json"
#}