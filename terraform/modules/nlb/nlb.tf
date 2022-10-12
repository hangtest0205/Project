resource aws_lb nlb {
  name                       = "${var.project}-${var.nlb_name}-${var.env}"
  load_balancer_type         = "network"
  subnets                    = var.private_subnets_ids
  internal                   = true
  enable_deletion_protection = false


  tags = {
    Name  = "${var.project}-${var.nlb_name}-${var.env}"
    Type  = var.nlb_type
    Stage = var.env
  }
}



