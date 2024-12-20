#variable "organization_id" {
#  type        = string
#  description = "(Defaults to provider organization_id) The ID of the organization the policy is associated with."
#}

variable "name" {
  description = "Name of the policy"
  type        = string
}

variable "description" {
  description = "Description of the policy"
  type        = string
}

variable "application_id" {
  type        = string
  description = "ID of the Application the policy will be linked to"
  default     = null
}

variable "user_id" {
  type        = string
  description = "ID of the User the policy will be linked to"
  default     = null
}

variable "no_principal" {
  type        = bool
  description = "If the policy doesn't apply to a principal."
  default     = null
}

variable "group_id" {
  type        = string
  description = "ID of the Group the policy will be linked to"
  default     = null
}

variable "rules" {
  description = "Rules of the policy"
  type        = any
  default     = null
}
