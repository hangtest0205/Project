#All Variable of Environment
#basic
variable env {}
variable full_env {}
variable project {}
variable region {}
variable account_id {}

#==================================================================================
#vpc
variable vpc_cidr {}
#subnet
variable private_cidrs {}
variable public_cidrs {}

variable path_policy_template {default = "environment/policy-template"}
variable path_ecs_task_definition_template {default ="environment/ecs-task-definition-template"}


