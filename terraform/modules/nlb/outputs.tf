#modules/nlb-external/outputs.tf
#nlb
output nlb_dns_name {
  value = aws_lb.nlb.dns_name
}
output nlb_zone_id {
  value = aws_lb.nlb.zone_id
}
output nlb_arn {
  value = aws_lb.nlb.arn
}
output nlb_arn_suffix {
  value = aws_lb.nlb.arn_suffix
}
