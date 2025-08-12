terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "buckets" {
  for_each      = toset(var.bucket_names)
  bucket        = each.value
  object_lock_enabled = false
  
  lifecycle {
    ignore_changes = [object_lock_configuration]
  }
}

resource "aws_s3_bucket_acl" "private" {
  for_each = aws_s3_bucket.buckets
  bucket   = each.value.id
  acl      = "private"
}

resource "aws_s3_bucket_public_access_block" "block" {
  for_each                = aws_s3_bucket.buckets
  bucket                  = each.value.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  for_each = aws_s3_bucket.buckets
  bucket   = each.value.id
  versioning_configuration {
    status = "Enabled"
  }
}
