output "id" {
  value = scaleway_account_project.this.id
}

output "created_at" {
  value = scaleway_account_project.this.created_at
}

output "updated_at" {
  value = scaleway_account_project.this.updated_at
}

output "application_id" {
  value = module.application.id
}

output "policy_id" {
  value = module.policy.id
}
