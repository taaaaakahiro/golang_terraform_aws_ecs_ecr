module "network" {
  source = "./modules/network"
  env = local.env
  name = local.name
  vpc_cidr = local.vpc_cidr

}