resource "aws_s3_bucket" "devsecops_demo" {
  bucket = "gokhan-devsecops-security-pipeline-demo-2026"

  tags = {
    Project     = "devsecops-ci-cd-security-pipeline"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "devsecops_demo" {
  bucket = aws_s3_bucket.devsecops_demo.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "devsecops_demo" {
  bucket = aws_s3_bucket.devsecops_demo.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "devsecops_demo" {
  bucket = aws_s3_bucket.devsecops_demo.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "devsecops_demo" {
  bucket = aws_s3_bucket.devsecops_demo.id

  rule {
    id     = "expire-old-objects"
    status = "Enabled"

    filter {
      prefix = ""
    }

    expiration {
      days = 365
    }

    noncurrent_version_expiration {
      noncurrent_days = 90
    }
  }
}