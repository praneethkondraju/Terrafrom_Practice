resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

locals {
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }

  ##Name of S3 Bucket
  s3_bucket_name = lower("${local.name_prefix}-website-contents-${random_integer.rand.result}")

  ##Naming Prefix
  name_prefix = "${var.naming_prefix}-dev"
}