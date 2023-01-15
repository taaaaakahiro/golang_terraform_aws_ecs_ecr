data "terraform_remote_state" "demo" {
  backend = "s3"
 
  config = {
    bucket = "terraform-example-tkoide"
    key    = "golang-terraform-aws-ecs-ecr/init/terraform.tfstate"
    region = "ap-northeast-1"
  }
}