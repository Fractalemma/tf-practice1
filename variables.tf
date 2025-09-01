variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "The availability zone to deploy resources in"
  default     = "us-east-1a"
}

variable "prefix" {
  description = "The prefix to use for resource names"
  default     = "tf-practice"
}

variable "instance_type" {
  description = "The type of instance to create"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  default     = "ami-00ca32bbc84273381"
}

