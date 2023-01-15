# aws_iam_role.tf

resource "aws_iam_role" "task_role" {
  name = "${var.env}-${var.service}-${var.function}-ecs-task-role"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "ecs.amazonaws.com",
          "ecs-tasks.amazonaws.com"
        ]
      }
    }
  ]
}
EOF
}

resource "aws_iam_role" "execution_role" {
  name = "${var.env}-${var.service}-${var.function}-ecs-task-execution-role"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "ecs.amazonaws.com",
          "ecs-tasks.amazonaws.com"
        ]
      }
    }
  ]
}
EOF
}