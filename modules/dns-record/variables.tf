variable "dns_entries" {
  type        = map(any)
  description = "Map for dns Entries"
}


variable "dns_project_id" {
  type        = string
  description = "project id for DNS"
}