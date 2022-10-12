#modules/ecs-task-definition/variables.tf
#base
variable env {}
variable project {}

#ecs-task-definition
variable ecs_task_definition_template {}
variable ecs_task_definition_vars {}

variable ecs_task_definition_name {}
variable ecs_task_definition_total_memory {}
variable ecs_task_definition_total_cpu {}
variable ecs_task_definition_execution_role_arn {default =null}
variable ecs_task_definition_task_role_arn {default =null}
variable ecs_task_definition_volume_name { default = null }
variable ecs_task_definition_type {}
