output "project_id" {
  description = "Scaleway Project ID"
  value       = scaleway_account_project.project.id
}

output "created_at" {
  description = "Scaleway Project created"
  value       = scaleway_account_project.project.created_at
}

output "updated_at" {
  description = "Scaleway Project updated"
  value       = scaleway_account_project.project.updated_at
}