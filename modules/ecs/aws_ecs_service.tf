
resource "aws_ecs_service" "backend" {
  name                = "${var.env}-service"
  cluster             = aws_ecs_cluster.backend.id
  task_definition     = aws_ecs_task_definition.backend.arn
  desired_count       = 2
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"
  health_check_grace_period_seconds = 60

  network_configuration {
    assign_public_ip = false
    security_groups = [var.sg_container_id]
    subnets = [
      var.subnet_container_1a_id,
      var.subnet_container_1c_id
    ]
  }

  load_balancer {
    target_group_arn = var.alb_tg_blue_arn
    container_name   = "dev-"
    container_port   = 8080
  }
}