resource aws_lb_target_group nlb_target_group {
  
  name     = "${var.project}-${var.nlb_target_group_name}-${var.env}"
  port     = var.nlb_target_group_port
  protocol = "TCP"

  vpc_id = var.vpc_id

  target_type = var.nlb_target_group_target_type
  health_check {
    path                = var.nlb_target_group_healthcheck_path
    port                = var.nlb_target_group_healthcheck_port
    interval            = var.nlb_target_group_interval
    unhealthy_threshold = var.nlb_target_group_unhealthy_threshold
  }
  deregistration_delay = 60

  tags = {
    Name  = "${var.project}-${var.nlb_target_group_name}-${var.env}"
    Type  = var.nlb_target_group_type
    Stage = var.env
  }
}
