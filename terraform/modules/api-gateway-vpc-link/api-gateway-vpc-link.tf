resource "aws_api_gateway_vpc_link" "this" {
  name        = "${var.project}-vpc-link-to-NLB-${var.env}"
  target_arns = [var.nlb_arn]

  tags = {
    Name  = "${var.project}-vpc-link-to-NLB-${var.env}"
    Type  = "vpc-link"
    Stage = "${var.env}"
  }
}
