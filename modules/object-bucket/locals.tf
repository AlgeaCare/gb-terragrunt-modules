locals {
  default_bucket = {
    name      = "default_bucket"
    region    = null
    project_id = null
    tags       = {} # map of strings
    force_destroy = false
    # Canned ACLs for the bucket. For a list check this https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html#canned-acl
    # https://www.scaleway.com/en/docs/storage/object/api-cli/bucket-policy/
    # https://www.scaleway.com/en/docs/storage/object/api-cli/using-bucket-policies/
    canned_acl = "private"
    # CORS:
    # https://www.scaleway.com/en/docs/storage/object/api-cli/setting-cors-rules/
    #    The CORS object supports the following:
    #    allowed_headers (Optional) Specifies which headers are allowed.
    #    allowed_methods (Required) Specifies which methods are allowed. Can be GET, PUT, POST, DELETE or HEAD.
    #    allowed_origins (Required) Specifies which origins are allowed.
    #    expose_headers (Optional) Specifies expose header in the response.
    #    max_age_seconds (Optional) Specifies time in seconds that browser can cache the response for a preflight request.
    cors           = {}
    # Lifecycle rule
    #    The lifecycle_rule (Optional) object supports the following:
    #    id - (Optional) Unique identifier for the rule. Must be less than or equal to 255 characters in length.
    #    prefix - (Optional) Object key prefix identifying one or more objects to which the rule applies.
    #    tags - (Optional) Specifies object tags key and value.
    #    enabled - (Required) The element value can be either Enabled or Disabled. If a rule is disabled, Scaleway S3 doesn't perform any of the actions defined in the rule.
    #    abort_incomplete_multipart_upload_days (Optional) Specifies the number of days after initiating a multipart upload when the multipart upload must be completed.
    #    ~> Important: It's not recommended using prefix for AbortIncompleteMultipartUpload as any incomplete multipart upload will be billed
    #    expiration - (Optional) Specifies a period in the object's expire (documented below).
    #    transition - (Optional) Specifies a period in the object's transitions (documented below).
    lifecycle_rule = {}
  }

#  acl_configs = flatten([
#  for bucket, config in local.object_buckets : [
#  for acl in config.acls : {
#    bucket = bucket
#    rule     = acl
#  }
#  ]
#  ])

  object_buckets = {
  for bucket_name, config in var.object_buckets :
  bucket_name => merge(local.default_bucket , config)
  }
  scw_default_endpoint_suffix = "scw.cloud" # https://bcknames3s3.s3.nl-ams.scw.cloud
}