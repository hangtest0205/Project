#modules/api-gateway-vpc-link/outputs.tf
output vpclink_apigw_to_nlb_id {
  value = aws_api_gateway_vpc_link.this.id
}