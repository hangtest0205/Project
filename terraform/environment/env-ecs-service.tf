# Create SG without ingress rule for service traefik
module sg_traefik {
  source = "../modules/sg-ecs"
  #basic
  env     = var.env
  project = var.project


  #sg-nlb-internal
  vpc_id  = module.network.vpc_id
  description = "Allow http and https traffic from VPC Link"
  sg_name = "ecs-vplink"
  sg_type = "ecs"
}

# Create SG without ingress rule for service traefik
module sg_traefik_ecs {
  source = "../modules/sg-ecs"
  #basic
  env     = var.env
  project = var.project


  #sg-nlb-internal
  vpc_id  = module.network.vpc_id
  description = "Allow http and https traffic from NLB"
  sg_name = "traefik-ecs"
  sg_type = "sg_ecs"
}
# Create ingress rule for Magento
module sg_ecs_magento {
  source = "../modules/sg-ingress-rule-magento"

  #basic
  env     = var.env
  project = var.project

  # sg_rule
  sg_name = "magento"
  sg_type = "sg_ecs"
  security_groups = [module.sg_traefik_ecs.sg_id]
  vpc_id = module.network.vpc_id
  description = "Allow traffic from Traefik"


}

# Create ECS service Traefik
module ecs_service_traefik {
  source = "../modules/ecs-service"
  #basic
  env     = var.env
  project = var.project
  region  = var.region

  #ecs-service
  ecs_service_name                  = "traefik"
  ecs_service_cluster_id            = module.ecs_cluster_general.ecs_cluster_id
  ecs_service_task_definition_arn   = module.traefik_task_definition.ecs_task_definition_arn
  ecs_service_launch_type           = "FARGATE"
  ecs_service_desired_count         = 1
  ecs_service_subnets_id            = module.network.subnet_private_id
  ecs_service_security_groups       = module.sg_traefik_ecs.sg_id
  ecs_service_assign_public_ip      = true
  ecs_service_target_group_arn      = module.nlb_target_group_traefik.nlb_target_group_arn
  ecs_service_container_name        = "traefik"
  ecs_service_container_port        = 80
  
}

# Create ECS service magento
module ecs_service_magento {
  source = "../modules/ecs-service"
  #basic
  env     = var.env
  project = var.project
  region  = var.region

  #ecs-service
  ecs_service_launch_type           = "FARGATE"
  ecs_service_cluster_id            = module.ecs_cluster_general.ecs_cluster_id
  ecs_service_task_definition_arn   = module.magento_task_definition.ecs_task_definition_arn
  ecs_service_name                  = "magento"
  ecs_service_desired_count         = 1
  ecs_service_subnets_id            = module.network.subnet_private_id
  ecs_service_security_groups       = module.sg_ecs_magento.sg_id
  ecs_service_assign_public_ip      = true
}



