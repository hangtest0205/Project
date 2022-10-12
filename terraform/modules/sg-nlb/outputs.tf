#modules/sg_nlb/outputs.tf
output sg_nlb_id {
  value = aws_security_group.sg_nlb.id
}
