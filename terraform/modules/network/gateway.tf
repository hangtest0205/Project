#2. INTERNET GATEWAY for public subnet
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name  = "${var.project}-internet-gateway-${var.env}"
    Stage = var.env
  }
}