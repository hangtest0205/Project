resource aws_lb nlb {
  name                       = "${var.project}-${var.nlb_name}-${var.env}"
  load_balancer_type         = "network"
  subnets                    = var.public_subnets_ids
  internal                   = false
  enable_deletion_protection = false


  tags = {
    Name  = "${var.project}-${var.nlb_name}-${var.env}"
    Type  = var.nlb_type
    Stage = var.env
  }
}



