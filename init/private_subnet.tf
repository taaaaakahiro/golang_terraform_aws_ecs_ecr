resource "aws_subnet" "private_container_1a" {
  cidr_block              = "10.0.3.0/24"
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.env}-pri-container-1a"
  }
}

resource "aws_subnet" "private_container_1c" {
  cidr_block              = "10.0.4.0/24"
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.env}-pri-container-1c"
  }
}
