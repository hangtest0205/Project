#modules/sg-rule/outputs.tf
output sg_id {
  value = aws_security_group.magento.id
}
