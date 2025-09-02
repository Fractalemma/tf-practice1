# Backend configuration file
# Use this with: terraform init -backend-config="backend.hcl"

bucket        = "practice-tf-state-dac7b7f3"
key           = "practice1/terraform.tfstate"
region        = "us-east-1"
profile       = "practice-tf"
use_lockfile  = true
