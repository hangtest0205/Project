# Create task role for task traefik
module iam_role_traefik {
  source = "../modules/iam-role"
  #basic
  env     = var.env
  project = var.project
 
  #iam-role
  iam_assume_role_template = "../../${var.path_policy_template}/ecs-policy-template/assume-role-ecs"
  iam_role_name            = "ecs-task-traefik"
  iam_role_service         = "ecs"
  iam_role_type            = "traefik"
  iam_policy_template      = "../../${var.path_policy_template}/ecs-policy-template/ecs-task-role-traefix"
  iam_policy_vars = {
    env                          = var.env
    region                       = var.region
    account_id                   = var.account_id
  }
}

# Create fargate task definition
module traefik_task_definition {
  source = "../modules/ecs-task-definition"

  #basic
  env     = var.env
  project = var.project

  # ecs task definition
  ecs_task_definition_name               = "traefik"
  ecs_task_definition_total_memory       = 2048
  ecs_task_definition_total_cpu          = 1024
  ecs_task_definition_execution_role_arn = module.ecs_role.iam_role_arn
  ecs_task_definition_task_role_arn      = module.iam_role_traefik.iam_role_arn
  ecs_task_definition_type               = "traefik"
  ecs_task_definition_template           = "../../${var.path_ecs_task_definition_template}/traefix"
  ecs_task_definition_vars = {
    region                = var.region
    ecs_cluster_name      = module.ecs_cluster_general.ecs_cluster_name
  }
}

# Create fargate task definition
module magento_task_definition {
  source = "../modules/ecs-task-definition"

  #basic
  env     = var.env
  project = var.project

  # ecs task definition
  ecs_task_definition_name               = "magento"
  ecs_task_definition_total_memory       = 2048
  ecs_task_definition_total_cpu          = 1024
  ecs_task_definition_type               = "magento"
  ecs_task_definition_template           = "../../${var.path_ecs_task_definition_template}/magento"
  ecs_task_definition_vars = {
    nlb_endpoint = module.nlb.nlb_dns_name
  }
}
