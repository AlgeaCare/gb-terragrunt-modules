variable "name" {
  description = "registry-name"
  type        = string
}

variable "description" {
  description = "Registry description"
  type        = string
  default     = ""
}

variable "is_public" {
  description = "Registry description"
  type        = bool
  default     = false
}

variable "registry_region" {
  description = "Registry region"
  type        = string
  default     = null
}


variable "project_id" {
  description = "Registry project_id"
  type        = string
  default     = null
}