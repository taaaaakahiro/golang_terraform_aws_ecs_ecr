resource "aws_subnet" "public_alb_1a" {

  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-public-alb-1a"
  }
}

resource "aws_subnet" "public_alb_1b" {

  cidr_block              = "10.0.2.0/24"
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-public-alb-1b"
  }
}