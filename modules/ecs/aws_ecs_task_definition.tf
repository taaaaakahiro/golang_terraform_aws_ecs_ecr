resource "aws_ecs_task_definition" "backend" {
  family                   = "${var.env}-def"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  task_role_arn            = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"
  execution_role_arn       = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"
  container_definitions    = var.container-definition-file
  # container_definitions = jsonencode([
  #   {
  #     name   = "${var.env}-app"
  #     image  = "413937037843.dkr.ecr.ap-northeast-1.amazonaws.com/dev-ecr:latest"
  #     cpu    = 128
  #     memory = 256
  #     healthcheck = {
  #       command = ["CMD-SHELL", "curl -f http://127.0.0.1/ || exit 1"]
  #       interval = 20
  #       retries = 2
  #       timeout = 5
  #     }

  #     essential = true
  #     portMappings = [
  #       {
  #         containerPort = 80
  #         hostPort      = 80
  #       }
  #     ]
  #   }
  # ])
}
