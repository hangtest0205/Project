#modules/nlb-target-group/outputs.tf
output nlb_target_group_arn {
  value = aws_lb_target_group.nlb_target_group.arn
}

output nlb_target_group_name {
  value = aws_lb_target_group.nlb_target_group.name
}
