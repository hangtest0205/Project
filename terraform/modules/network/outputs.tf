#modules/network/output.tf
#vpc
output "vpc_id" {
  value = aws_vpc.vpc.id
}
#subnet
output "subnet_private_id" {
  value = aws_subnet.subnet_private.*.id
}
output "subnet_public_id" {
  value = aws_subnet.subnet_public.*.id
}
#gateway
output "nat_gateway_public_ip" {
  value = aws_nat_gateway.nat_gateway.public_ip
}
output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}
