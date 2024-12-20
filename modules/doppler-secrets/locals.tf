locals {
  default_secret = {
    project      = "default_project"
    config       = null
    name         = null
    value        = null
  }

#  object_buckets = {
#  for bucket_name, config in var.object_buckets :
#  bucket_name => merge(local.default_bucket , config)
#  }

  secret_entries = {
  for secret_name, config in var.secret_entries :
  secret_name => merge(local.default_secret , config)
  }

}