output "id" {
  value       = scaleway_iam_policy.this.id
  description = "The ID of the policy."
}

output "created_at" {
  value       = scaleway_iam_policy.this.created_at
  description = "The creation date of the policy."
}

output "updated_at" {
  value       = scaleway_iam_policy.this.updated_at
  description = "The last update date of the policy."
}

output "editable" {
  value       = scaleway_iam_policy.this.editable
  description = "Whether the policy is editable."
}
