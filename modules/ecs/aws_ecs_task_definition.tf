resource "aws_ecs_task_definition" "backend" {
  family                   = "${var.env}-def"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  task_role_arn            = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"
  execution_role_arn       = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      name   = "${var.env}-"
      image  = "413937037843.dkr.ecr.ap-northeast-1.amazonaws.com/terraform-fargate-practice-ecr:latest"
      
      cpu    = 128
      memory = 256

      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}