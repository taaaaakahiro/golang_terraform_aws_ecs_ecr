output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "private_container_1a_id"{
  value = aws_subnet.private_container_1a.id
}

output "private_container_1c_id"{
  value = aws_subnet.private_container_1c.id
}

output "sg_container_id" {
  value = aws_security_group.container.id
}

output "subnet_alb_1a_id" {
  value = aws_subnet.public_alb_1a.id
}

output "subnet_alb_1b_id" {
  value = aws_subnet.public_alb_1b.id
}

output "sg_vpce_id" {
  value = aws_security_group.vpce.id
}

output "sg_alb_id" {
  value = aws_security_group.alb.id
}

