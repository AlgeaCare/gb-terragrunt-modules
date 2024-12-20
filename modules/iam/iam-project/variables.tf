#variable "organization_id" {
#  type        = string
#  description = "(Defaults to provider organization_id) The ID of the organization the project is associated with."
#}

variable "name" {
  type        = string
  description = "(Optional) The name of the Project."
  default     = null
}

variable "description" {
  type        = string
  description = "(Optional) The description of the Project."
  default     = null
}

variable "application" {
  type        = map(any)
  description = "Application to be created alongside the Project"
  default     = null
}
