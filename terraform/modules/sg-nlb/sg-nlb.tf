resource aws_security_group sg_nlb {
  name        = "${var.project}-${var.sg_nlb_name}-sg-${var.env}"
  vpc_id      = var.vpc_id
  description = "Allow inbound and outbound traffic for internal NLB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}-${var.sg_nlb_name}-sg-${var.env}"
    Type  = var.sg_nlb_type
    Stage = var.env
  }
}
