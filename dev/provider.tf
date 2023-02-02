terraform {
  required_version = ">= 0.11"
  backend "s3" {
    bucket = "golang-aws-lambda"
    key    = "golang-terraform-aws-ecs-ecr/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = local.region
}