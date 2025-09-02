variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "The AZ to deploy resources in"
  type        = string
  default     = "us-east-1a"
}

variable "prefix" {
  description = "The prefix to use for resource names"
  type        = string
  default     = "tf-practice"
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-00ca32bbc84273381"
}

# Backend Configuration Variables
variable "aws_profile" {
  description = "The AWS profile to use for authentication"
  type        = string
  default     = "practice-tf"
}

