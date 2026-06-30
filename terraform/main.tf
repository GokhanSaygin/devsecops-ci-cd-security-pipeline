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