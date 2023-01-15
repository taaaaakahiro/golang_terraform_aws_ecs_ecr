resource "aws_vpc" "vpc" {
  cidr_block = local.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy = "default"

  tags = {
    Name = "${local.env}-vpc"
  }
}