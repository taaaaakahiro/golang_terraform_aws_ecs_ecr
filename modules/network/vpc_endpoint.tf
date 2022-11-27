resource "aws_vpc_endpoint" "ecr_api" {
  tags = {
    Name = "${var.name}-vpce-ecr-api"
  }
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.ecr.api"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.vpce.id
  ]

  private_dns_enabled = true
  subnet_ids = [
    aws_subnet.private_container_1a.id,
    aws_subnet.private_container_1c.id
  ]
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  tags = {
    Name = "${var.name}-vpce-ecr-dkr"
  }
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.ap-northeast-1.ecr.dkr"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.vpce.id
  ]

  private_dns_enabled = true
  subnet_ids = [
    aws_subnet.private_container_1a.id,
    aws_subnet.private_container_1c.id
  ]
}