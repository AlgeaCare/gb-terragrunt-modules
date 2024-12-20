# When the orga ID variable is defined here, its redundant in the root.
#variable "iam_organization_id" {
#  type        = string
#  description = "(Defaults to provider organization_id) The ID of the organization the application is associated with."
#}

variable "name" {
  type        = string
  description = "The name of the iam application."
}

variable "description" {
  type        = string
  description = "The description of the iam application."
}

variable "create_apikey" {
  type        = bool
  default     = false
  description = "Whether an API key must be created for the application"
}

variable "apikey_description" {
  type        = string
  default     = null
  description = "Description of the API key to be created"
}

variable "apikey_expires_at" {
  type        = string
  default     = null
  description = "(Optional) The date and time of the expiration of the iam api key. Please note that in case of change, the resource will be recreated."
}

variable "s3_project_id" {
  type = string
  default = null
  description = "Defines S3 object storage default project where the buckets are in."
}