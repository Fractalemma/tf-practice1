# Terraform AWS Infrastructure Practice

Simple Terraform project that creates AWS infrastructure: VPC, subnet, security group, and EC2 instance.

## Setup

1. **Bootstrap S3 backend:**

   ```bash
   cd infra-bootstrap
   terraform init && terraform apply
   ```

2. **Configure backend:**
   Fill `backend.hcl` with the S3 bucket details from step 1

3. **Deploy main infrastructure:**

   ```bash
   terraform init -backend-config="backend.hcl"
   terraform plan && terraform apply
   ```
