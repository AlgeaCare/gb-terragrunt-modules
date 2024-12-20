# Creation of ACLs for the corresponding bucket
# We will set canned ACLs, which are simple to handle
# Check: https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html#canned-acl
resource "scaleway_object_bucket_acl" "this" {
  for_each = local.object_buckets
  bucket = scaleway_object_bucket.this[each.key].name
  region = scaleway_object_bucket.this[each.key].region
  project_id = scaleway_object_bucket.this[each.key].project_id
  acl = lookup(each.value, "canned_acl", null)
}
