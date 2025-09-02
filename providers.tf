terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  
  backend "s3" {
    # Backend configuration will be provided via backend.hcl file
    # Use: terraform init -backend-config="backend.hcl"
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}
