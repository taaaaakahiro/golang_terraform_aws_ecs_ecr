# output.tf

output "task_definition_arn" {
  value       = aws_ecs_task_definition.this.arn
  description = "Task Definition Arn"
}

output "task_execution_role_arn" {
  value       = aws_iam_role.execution_role.arn
  description = "Task Execution Role Arn"
}

output "task_role_arn" {
  value       = aws_iam_role.task_role.arn
  description = "Task Role Arn"
}