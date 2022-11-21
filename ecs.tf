resource "aws_ecs_cluster" "ecs_cluster" {
  name = "golang-terraform-aws-ecs-ecr"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_service" "ecs_service" {
  name            = "golang-terraform-aws-ecs-ecr"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"
 
  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [aws_subnet.pub_subnet1.id, aws_subnet.pub_subnet2.id]
  }
}
resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "main"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu    = 256
  memory = 512
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "httpd-container",
    "image": "httpd:latest",
    "essential": true,
    "memory": 128,
    "portMappings": [
      {
        "protocol": "tcp",
        "containerPort": 80
      }
    ]
  }
]
TASK_DEFINITION


}


resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = aws_iam_role.test_iam_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
          "ecs:*",
          "alb:*",
          "ecr:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "test_iam_role" {
  name = "test_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}