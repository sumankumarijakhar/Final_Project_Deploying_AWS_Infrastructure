variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_names" {
  description = "List of S3 bucket names to create"
  type        = list(string)
  default     = ["student-proj-bucket-a", "student-proj-bucket-b", "student-proj-bucket-c", "student-proj-bucket-d"]
}
