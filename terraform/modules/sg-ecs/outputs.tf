#modules/sg-ecs/outputs.tf
output sg_id {
  value = aws_security_group.sg.id
}
