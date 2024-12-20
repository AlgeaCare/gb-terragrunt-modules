output "id" {
  value = scaleway_iam_application.this.id
}
output "created_at" {
  value = scaleway_iam_application.this.created_at
}
output "updated_at" {
  value = scaleway_iam_application.this.updated_at
}
#output "editable" {
#  value = scaleway_iam_application.this.editable
#}
output "scw_access_key" {
  value = scaleway_iam_api_key.this[0].access_key
  sensitive = true
}
output "scw_secret_key" {
  value = scaleway_iam_api_key.this[0].secret_key
  sensitive = true
}