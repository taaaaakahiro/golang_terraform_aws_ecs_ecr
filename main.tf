data "aws_caller_identity" "current" {}

module "ecs" {
  source                       = "./modules/ecs"
  env                          = local.env
  service                      = local.service
  function                     = local.function
  account_id                   = data.aws_caller_identity.current.account_id
  backend_ecr_repository_url   = data.terraform_remote_state.init.outputs.backend_ecr_repository_url
  subnet_container_1a_id       = data.terraform_remote_state.init.outputs.subnet_container_1a_id
  subnet_container_1c_id       = data.terraform_remote_state.init.outputs.subnet_container_1c_id
  sg_container_id              = data.terraform_remote_state.init.outputs.sg_container_id
  alb_tg_blue_arn              = module.alb.alb_tg_blue_arn
}

module "alb" {
  source       = "./modules/alb"
  env          = local.env
  sg_alb_id    = data.terraform_remote_state.init.outputs.sg_alb_id
  subnet_1a_id = data.terraform_remote_state.init.outputs.subnet_alb_1a_id
  subnet_1b_id = data.terraform_remote_state.init.outputs.subnet_alb_1b_id
  vpc_id       = data.terraform_remote_state.init.outputs.vpc_id
}

data "terraform_remote_state" "init" {
  backend = "s3"
 
  config = {
    bucket = "terraform-example-tkoide"
    key    = "golang-terraform-aws-ecs-ecr/init/terraform.tfstate"
    region = "ap-northeast-1"
  }
}