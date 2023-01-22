

output "subnet_container_1a_id"{
  value = module.vpc.private_container_1a_id
}

output "subnet_container_1c_id"{
  value = module.vpc.private_container_1c_id
}

output "sg_container_id" {
  value = module.vpc.sg_container_id
}