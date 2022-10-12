#modules/nlb-listener/outputs.tf
# Listener 80
output nlb_listener_arn {
  value = aws_lb_listener.nlb_listener.arn
}
output nlb_listener_id {
  value = aws_lb_listener.nlb_listener.id
}
