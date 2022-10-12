# Create ECS cluster
module ecs_cluster_general {
  source = "../modules/ecs-cluster"
  #basic
  env     = var.env
  project = var.project

  #ecs-cluster
  ecs_cluster_name = "ecs"
  ecs_cluster_type = "general"
}

# Create ecs-role
module ecs_role {
  source = "../modules/iam-role"
  #basic
  env     = var.env
  project = var.project
  #region  = var.region

  #iam-role
  iam_assume_role_template = "../../${var.path_policy_template}/ecs-policy-template/assume-role-ecs"
  iam_role_name            = "ecs-role"
  iam_role_service         = "ecs"
  iam_role_type            = "ecs"
}
