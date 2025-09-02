// ================================================================
// Network
// ================================================================

resource "aws_vpc" "jro-vpc" {
  // 10.123.0.0 - 10.123.255.255 (65536 IPs)
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.prefix}-public"
  }
}

resource "aws_internet_gateway" "jro-igw" {
  vpc_id = aws_vpc.jro-vpc.id
  tags = {
    Name = "${var.prefix}-igw"
  }
}

resource "aws_subnet" "jro-subnet" {
  vpc_id = aws_vpc.jro-vpc.id
  // 10.123.1.0 - 10.123.1.255
  // Real (considering reserved IPs): 10.123.1.4 - 10.123.1.254 (251 IPs)
  cidr_block = "10.123.1.0/24"
  //  Indicates that instances launched into the subnet should be assigned a public IP address:
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone
  tags = {
    Name = "${var.prefix}-subnet"
  }
}

resource "aws_route_table" "jro-rt" {
  vpc_id = aws_vpc.jro-vpc.id
  // Using nested route declaration
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jro-igw.id
  }

  tags = {
    Name = "${var.prefix}-route-table"
  }
}

resource "aws_route_table_association" "jro-rta" {
  subnet_id      = aws_subnet.jro-subnet.id
  route_table_id = aws_route_table.jro-rt.id
}

resource "aws_security_group" "jro-sg" {
  vpc_id = aws_vpc.jro-vpc.id
  // Allow all protocols for unique personal IP
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["187.145.53.149/32"]
  }
  // Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-sg"
  }
}

// ================================================================
// Cloud Compute (EC2)
// ================================================================

resource "aws_key_pair" "jro-key-pair" {
  key_name   = "${var.prefix}-key-pair"
  public_key = file("~/.ssh/jro-key.pub")

  tags = {
    Name = "${var.prefix}-key-pair"
  }
}

resource "aws_instance" "jro-instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.jro-subnet.id
  vpc_security_group_ids = [aws_security_group.jro-sg.id]
  key_name               = aws_key_pair.jro-key-pair.key_name

  tags = {
    Name = "${var.prefix}-instance"
  }

  user_data = file("${path.module}/user-data.sh")
}
