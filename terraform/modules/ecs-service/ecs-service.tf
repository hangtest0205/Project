resource "aws_ecs_service" "ecs_service" {
  name            = "${var.project}-fargate-${var.ecs_service_name}-${var.env}"
  cluster         = var.ecs_service_cluster_id
  task_definition = var.ecs_service_task_definition_arn
  launch_type     = var.ecs_service_launch_type

  desired_count        = var.ecs_service_desired_count
  force_new_deployment = true

  network_configuration {
    subnets          = var.ecs_service_subnets_id
    security_groups  = [var.ecs_service_security_groups]
    assign_public_ip = var.ecs_service_assign_public_ip
  }

  dynamic load_balancer {
    for_each = var.ecs_service_target_group_arn != null ? var.ecs_service_target_group_arn : []
    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }


}
