resource "aws_ecr_repository" "ecr-example" {
  name                 = "golang-terraform-aws-ecs-ecr"
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}