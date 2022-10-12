#modules/ecs-task-definition/outputs.tf
output ecs_task_definition_arn {
  value = aws_ecs_task_definition.ecs_task_definition.arn # ARN including both family and revision
}
output ecs_task_definition_family {
  value = aws_ecs_task_definition.ecs_task_definition.family
}
