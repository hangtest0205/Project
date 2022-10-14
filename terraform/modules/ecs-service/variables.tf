#modules/ecs-service/variables.tf
#base
variable env {}
variable project {}
variable region {}

#ecs-service
variable ecs_service_launch_type {}
variable ecs_service_cluster_id {}
variable ecs_service_task_definition_arn {}
variable ecs_service_name {}
variable ecs_service_desired_count {}
variable ecs_service_subnets_id {}
variable ecs_service_security_groups {}
variable ecs_service_assign_public_ip { default = false }
variable ecs_service_target_group_arn { default = null }

