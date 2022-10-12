# Create nlb listener 80
resource aws_lb_listener nlb_listener {
  load_balancer_arn = var.load_balancer_arn
  port              = var.port_listen
  protocol          = "TCP"

  default_action {
    type = "forward"
    target_group_arn = var.nlb_listener_target_group_arn
  }
}
