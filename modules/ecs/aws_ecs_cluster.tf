resource "aws_ecs_cluster" "backend" {
  name = "${var.env}-ecs"

  tags = {
    Name = "${var.env}-ecs"
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

