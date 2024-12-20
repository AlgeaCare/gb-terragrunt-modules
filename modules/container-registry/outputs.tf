output "id" {
  value       = scaleway_registry_namespace.this.id
  description = "Registry id"
}

output "endpoint" {
  value       = scaleway_registry_namespace.this.endpoint
  description = "Registry endpoint"
}

output "name" {
  value       = scaleway_registry_namespace.this.name
  description = "Registry name"
}