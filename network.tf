// vpc
resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support               = "true"
  enable_dns_hostnames             = "true"

  tags = {
    Name = "${local.env}-vpc-${local.name}"
  }
}

//public subnet
resource "aws_subnet" "pub_subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${local.env}-subnet1a-${local.name}"
  }
}

resource "aws_subnet" "pub_subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${local.env}-subnet1c-${local.name}"
  }
}

// igw
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.env}-gw-${local.name}"
  }
}

// rt
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  # 外部向け通信を可能にするためのルート設定
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${local.env}-rt-${local.name}"
  }
}

resource "aws_route" "example" {
  gateway_id             = aws_internet_gateway.gw.id
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "rt-subnet1" {
  subnet_id      = aws_subnet.pub_subnet1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rt-subnet2" {
  subnet_id      = aws_subnet.pub_subnet2.id
  route_table_id = aws_route_table.rt.id
}

// sg
resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.vpc.id
  name   = "main"

  tags = {
    Name = "example"
  }
}

# インバウンドルール(ssh接続用)
resource "aws_security_group_rule" "in_ssh" {
  security_group_id = aws_security_group.sg.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}

# インバウンドルール(pingコマンド用)
resource "aws_security_group_rule" "in_icmp" {
  security_group_id = aws_security_group.sg.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
}
