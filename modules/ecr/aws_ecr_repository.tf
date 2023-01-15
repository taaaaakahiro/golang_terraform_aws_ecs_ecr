resource "aws_ecr_repository" "backend" {
  name                 = "${var.env}-ecr"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "backend" {
  policy = jsonencode(
    {
      "rules" : [
        {
          rulePriority : 1,
          description : "Hold only one image",
          selection : {
            "tagStatus" : "any",
            "countType" : "imageCountMoreThan",
            "countNumber" : 1
          },
          action : {
            "type" : "expire"
          }
        }
      ]
    }
  )

  repository = aws_ecr_repository.backend.name
}