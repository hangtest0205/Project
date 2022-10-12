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
    for_each = var.ecs_service_target_group_arn != null ? [1] : []
    content {
      target_group_arn = var.ecs_service_target_group_arn
      container_name   = var.ecs_service_container_name
      container_port   = var.ecs_service_container_port
    }
  }


}
