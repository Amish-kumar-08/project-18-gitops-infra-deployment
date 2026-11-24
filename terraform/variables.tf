
variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_prefix" {
  description = "Prefix for the GitOps S3 bucket"
  type        = string
  default     = "project-18-gitops"
}

