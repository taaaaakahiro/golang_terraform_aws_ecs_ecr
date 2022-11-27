output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_container_1a_id"{
  value = aws_subnet.private_container_1a.id
}

output "subnet_container_1c_id"{
  value = aws_subnet.private_container_1c.id
}

output "sg_container_id" {
  value = aws_security_group.container.id
}