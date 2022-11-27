data "aws_caller_identity" "current" {}

module "network" {
  source = "./modules/network"
  env = local.env
  name = local.name
  vpc_cidr = local.vpc_cidr

}

module "ecr" {
  source = "./modules/ecr"
  name = local.name
}

module "ecs" {
  source = "./modules/ecs"
  name = local.name
  account_id                   = data.aws_caller_identity.current.account_id
  backend_ecr_repository_url = module.ecr.backend_ecr_repository_url
  subnet_container_1a_id       = module.network.subnet_container_1a_id
  subnet_container_1c_id       = module.network.subnet_container_1c_id
  sg_container_id = module.network.sg_container_id

}