terraform {
  required_providers { 
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
    random = { source = "hashicorp/random", version = "~> 3.1" }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "practice-tf"
}

# Minimal S3 bucket for TF state (testing only)
resource "aws_s3_bucket" "tf_state" {
  bucket = "practice-tf-state-${random_id.bucket_suffix.hex}"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

output "bucket" { value = aws_s3_bucket.tf_state.bucket }
