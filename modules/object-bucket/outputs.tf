output "this" {
  value = {
  for name in keys(var.object_buckets) : name => {
    "bucket_id" = scaleway_object_bucket.this[name].id,
    "bucket_name"     = scaleway_object_bucket.this[name].name,
    "bucket_endpoint" = scaleway_object_bucket.this[name].endpoint,
    "region" = scaleway_object_bucket.this[name].region
    "region_endpoint" = "https://s3.${scaleway_object_bucket.this[name].region}.${local.scw_default_endpoint_suffix}" ### https://bcknames3s3.s3.nl-ams.scw.cloud
    "acl"     = scaleway_object_bucket.this[name].acl
  }
  }
  description = "A map of the Scaleway object bucket definitions"
  sensitive   = false
}