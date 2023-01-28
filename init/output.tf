output "backend_ecr_repository_url" {
  value = module.ecr.backend_ecr_repository_url
}

output "subnet_container_1a_id"{
  value = module.vpc.private_container_1a_id
}

output "subnet_container_1c_id"{
  value = module.vpc.private_container_1c_id
}

output "sg_container_id" {
  value = module.vpc.sg_container_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_alb_1a_id" {
  value = module.vpc.subnet_alb_1a_id
}

output "subnet_alb_1b_id" {
  value = module.vpc.subnet_alb_1b_id
}

output "sg_alb_id" {
  value = module.vpc.sg_alb_id
}
