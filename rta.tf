resource "aws_route_table_association" "public-subnet" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = aws_route_table.terraform-public-rt.id
}

resource "aws_route_table_association" "private-subnet" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = aws_route_table.terraform-private-rt.id
}
