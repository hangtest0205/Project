#1. NAT GATEWAY for private subnet
resource "aws_eip" "nat_gateway_eip" {
  vpc = true

  tags = {
    Name  = "${var.project}-eip-nat-gateway-${var.env}"
    Stage = var.env
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.subnet_public.*.id[0]

  tags = {
    Name  = "${var.project}-nat-gateway-${var.env}"
    Stage = var.env
  }
}

#2. INTERNET GATEWAY for public subnet
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name  = "${var.project}-internet-gateway-${var.env}"
    Stage = var.env
  }
}