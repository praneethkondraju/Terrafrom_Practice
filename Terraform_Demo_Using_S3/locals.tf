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
  s3_bucket_name = "terraform-learning-s3-${random_integer.rand.result}"
}