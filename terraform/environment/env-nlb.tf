module nlb {
  source = "../modules/nlb"
  #basic
  env     = var.env
  project = var.project

  nlb_name               = "nlb-internal"
  public_subnets_ids   = module.network.subnet_public_id
  nlb_type               = "nlb"
}

#create a target group for the load balancer and set up a health check
module nlb_target_group_traefik {
  source = "../modules/nlb-target-group"
  #basic
  env     = var.env
  project = var.project

  nlb_target_group_name        = "nlb-tg-traefik"
  nlb_target_group_type        = "nlb-traefik"
  vpc_id                       = module.network.vpc_id
  nlb_target_group_target_type = "ip"
  nlb_target_group_port        = 80

  #Health check settings
  nlb_target_group_healthcheck_port = "8080"
  nlb_target_group_healthcheck_path = "/ping"
}

module nlb_target_group_traefik_magento {
  source = "../modules/nlb-target-group"
  #basic
  env     = var.env
  project = var.project

  nlb_target_group_name        = "nlb-tg-magento"
  nlb_target_group_type        = "nlb-magento"
  vpc_id                       = module.network.vpc_id
  nlb_target_group_target_type = "ip"
  nlb_target_group_port        = 8080

  #Health check settings
  nlb_target_group_healthcheck_port = "8080"
  nlb_target_group_healthcheck_path = "/ping"
}

# Create listener for nlb
module nlb_listener_traefik {
  source = "../modules/nlb-listener"
  #basic
  env     = var.env
  project = var.project

  nlb_listener_target_group_arn = module.nlb_target_group_traefik.nlb_target_group_arn
  load_balancer_arn             = module.nlb.nlb_arn
  port_listen = 80
}

# Create listener for nlb
module nlb_listener_traefik_magento {
  source = "../modules/nlb-listener"
  #basic
  env     = var.env
  project = var.project

  nlb_listener_target_group_arn = module.nlb_target_group_traefik_magento.nlb_target_group_arn
  load_balancer_arn             = module.nlb.nlb_arn
  port_listen = 8080
}
