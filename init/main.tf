module "vpc" {
    source = "../modules/network"
    env = local.env
    cidr_block = local.cidr_block
}

module "ecr" {
    source = "../modules/ecr"
    env = local.env
}
