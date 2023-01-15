resource "aws_ecs_cluster" "backend" {
  name = "${var.name}-ecs"

  tags = {
    Name = "${var.name}-ecs"
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "backend" {
  family                   = "${var.name}-def"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  task_role_arn            = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"
  execution_role_arn       = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      name   = "app"
      image  = "413937037843.dkr.ecr.ap-northeast-1.amazonaws.com/terraform-fargate-practice-ecr:latest"
      
      cpu    = 128
      memory = 256

      essential = true
      portMappings = [
        {
          containerPort = 8080
          # hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "backend" {
  name                = "${var.name}-service"
  cluster             = aws_ecs_cluster.backend.id
  task_definition     = aws_ecs_task_definition.backend.arn
  desired_count       = 2
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"

  network_configuration {
    security_groups = [var.sg_container_id]
    subnets = [
      var.subnet_container_1a_id,
      var.subnet_container_1c_id
    ]
  }

  # load_balancer {
  #   target_group_arn = var.alb_tg_blue_arn
  #   container_name   = "app"
  #   container_port   = 80
  # }

  # deployment_controller {
  #   type = "CODE_DEPLOY"
  # }
}