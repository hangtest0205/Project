# Create VPC Link NLB
module api_gateway_vpc_link {
  source = "../modules/api-gateway-vpc-link"
  #basic
  env         = var.env
  project     = var.project

  #VPC-Link
  nlb_arn = module.nlb.nlb_arn
}

# Create the API Gateway HTTP endpoint
module api_gateway {
  source = "../modules/api-gateway-reset-api"
  #basic
  project     = var.project

  #API Gateway 
  # uri = module.nlb_listener_traefik.nlb_listener_arn
  connection_id = module.api_gateway_vpc_link.vpclink_apigw_to_nlb_id
}


