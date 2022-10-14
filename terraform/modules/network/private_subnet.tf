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

resource "aws_route_table" "route_private" {
  vpc_id = aws_vpc.vpc.id
  route = []

  tags = {
    Name  = "${var.project}-route-private-${var.env}"
    Stage = var.env
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.subnet_private)
  subnet_id      = aws_subnet.subnet_private.*.id[count.index]
  route_table_id = aws_route_table.route_private.id
}

# resource "aws_main_route_table_association" "private_table" {
#   vpc_id         = aws_vpc.vpc.id
#   route_table_id = aws_route_table.route_private.id
# }

