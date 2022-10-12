#1.1 Private Subnet - Route Table
resource "aws_subnet" "subnet_private" {
  count             = length(var.private_cidrs)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_cidrs[count.index]

  tags = {
    Name  = "${var.project}-subnet-private-${count.index + 1}-${var.env}"
    Stage = var.env
  }
}

resource "aws_default_route_table" "route_private" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name  = "${var.project}-route-private-${var.env}"
    Stage = var.env
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.subnet_private)
  subnet_id      = aws_subnet.subnet_private.*.id[count.index]
  route_table_id = aws_default_route_table.route_private.id
}
