#variable "organization_id" {
#  type        = string
#  description = "(Defaults to provider organization_id) The ID of the organization the group is associated with."
#}

variable "name" {
  type        = string
  description = "The name of the iam group."
}

variable "description" {
  type        = string
  description = "The description of the iam group."
}

variable "application_ids" {
  type        = list(string)
  description = "(Optional) The list of IDs of the applications attached to the group."
  default     = null
}

variable "user_ids" {
  type        = list(string)
  description = "(Optional) The list of IDs of the users attached to the group."
  default     = null
}
