resource "aws_security_group" "alb" {
  name        = "${local.env}-sg-alb"
  description = "sg alb"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "my ip"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.env}-sg-alb"
  }
}

resource "aws_security_group" "container" {
  name        = "${local.env}-sg-container"
  description = "sg container"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "alb sg"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.env}-sg-container"
  }
}

resource "aws_security_group" "vpce" {
  name        = "${local.env}-sg-vpce"
  description = "sg vpce"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "container sg"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.container.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.env}-sg-vpce"
  }
}