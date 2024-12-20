#resource "scaleway_object_bucket_policy" "policy" {
#  bucket = scaleway_object_bucket.this.name
#  policy = jsonencode(
#    {
#      Id = "MyPolicy"
#      Statement = [
#        {
#          Action = [
#            "s3:ListBucket",
#            "s3:GetObject",
#          ]
#          Effect = "Allow"
#          Principal = {
#            SCW = "*"
#          }
#          Resource  = [
#            "some-unique-name",
#            "some-unique-name/*",
#          ]
#          Sid = "GrantToEveryone"
#        },
#      ]
#      Version = "2012-10-17"
#    }
#  )
#}