// ================================================================
// Output Values - Resource IDs
// ================================================================

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.jro-vpc.id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.jro-igw.id
}

output "subnet_id" {
  description = "ID of the Subnet"
  value       = aws_subnet.jro-subnet.id
}

output "route_table_id" {
  description = "ID of the Route Table"
  value       = aws_route_table.jro-rt.id
}

output "security_group_id" {
  description = "ID of the Security Group"
  value       = aws_security_group.jro-sg.id
}

output "key_pair_id" {
  description = "ID of the Key Pair"
  value       = aws_key_pair.jro-key-pair.id
}

output "instance_id" {
  description = "ID of the EC2 Instance"
  value       = aws_instance.jro-instance.id
}

// ================================================================
// Additional Useful Outputs
// ================================================================

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.jro-instance.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.jro-instance.public_dns
}