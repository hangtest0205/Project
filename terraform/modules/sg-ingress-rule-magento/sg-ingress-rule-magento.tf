resource "aws_security_group" "magento"{
  name        = "${var.project}-sg-${var.sg_name}-${var.env}"
  vpc_id      = var.vpc_id
  description = var.description

  ingress {
    description = "Non secured"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = var.security_groups
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}-sg-${var.sg_name}-${var.env}"
    Type  = var.sg_type
    Stage = var.env
  }
}