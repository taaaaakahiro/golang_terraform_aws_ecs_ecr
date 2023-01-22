data "aws_caller_identity" "current" {}

module "ecs" {
  source                       = "./modules/ecs"
  env                          = local.env
  service                      = local.service
  function                     = local.function
  account_id                   = data.aws_caller_identity.current.account_id
  backend_ecr_repository_url   = module.ecr.backend_ecr_repository_url
  subnet_container_1a_id       = module.network.subnet_container_1a_id
  subnet_container_1c_id       = module.network.subnet_container_1c_id
  sg_container_id              = data.terraform_remote_state.init.sg_container_id
}

data "terraform_remote_state" "init" {
  backend = "s3"
 
  config = {
    bucket = "terraform-example-tkoide"
    key    = "golang-terraform-aws-ecs-ecr/init/terraform.tfstate"
    region = "ap-northeast-1"
  }
}