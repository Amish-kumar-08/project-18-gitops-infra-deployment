
output "s3_bucket_name" {
  description = "Name of the deployed S3 bucket"
  value       = aws_s3_bucket.gitops_bucket.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the deployed S3 bucket"
  value       = aws_s3_bucket.gitops_bucket.arn
}

output "aws_region" {
  description = "AWS region used for deployment"
  value       = var.aws_region
}

