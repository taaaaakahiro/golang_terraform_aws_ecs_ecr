resource "aws_route_table" "private_1a" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.env}-private-route-table-1a"
  }
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_container_1a.id
  route_table_id = aws_route_table.private_1a.id
}

resource "aws_route_table" "private_1c" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.env}-private-route-table-1b"
  }
}

resource "aws_route_table_association" "private_1c" {
  subnet_id      = aws_subnet.private_container_1c.id
  route_table_id = aws_route_table.private_1c.id
}


resource "aws_route_table" "public_alb_1a" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${local.env}-public-alb-route-table-1a"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}



resource "aws_route_table_association" "public_alb_1a" {
  subnet_id      = aws_subnet.pub_subnet1.id
  route_table_id = aws_route_table.public_alb_1a.id
}

resource "aws_route_table" "public_alb_1b" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${local.env}-public-alb-route-table-1b"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_alb_1b" {
  subnet_id      = aws_subnet.pub_subnet2.id
  route_table_id = aws_route_table.public_alb_1b.id
}