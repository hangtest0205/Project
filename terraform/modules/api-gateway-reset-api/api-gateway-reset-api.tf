resource "aws_api_gateway_rest_api" "rest_api" {
  name = "${var.project}-rest-api"
  description = "API Gateway REST API"
  api_key_source = "HEADER"
  endpoint_configuration {
    types = ["REGIONAL"]
  }

}

resource "aws_api_gateway_resource" "traefik_resource" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  parent_id   = aws_api_gateway_rest_api.rest_api.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "test_method" {
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  resource_id   = aws_api_gateway_resource.traefik_resource.id
  http_method   = "GET"
  authorization = "NONE"
  request_parameters = {
    "method.request.path.proxy" = true
  }
}

resource "aws_api_gateway_integration" "apigw_integration" {
  http_method             = aws_api_gateway_method.test_method.http_method
  resource_id             = aws_api_gateway_resource.traefik_resource.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api.id
  type                    = "HTTP_PROXY"
  integration_http_method = "ANY"
  connection_type         = "VPC_LINK"
  connection_id           = var.connection_id
  uri                     = var.uri

}



