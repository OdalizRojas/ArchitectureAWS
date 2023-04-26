resource "aws_vpc" "main_vpc" {
  cidr_block = local.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "${var.app_prefix}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.app_prefix}-igw"
  }
}