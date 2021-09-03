resource "aws_route_table_association" "public_route" {
   for_each = aws_subnet.public_subnet
   subnet_id = each.value.id
   route_table_id = aws_route_table.sample_public_route_table.id
}

resource "aws_route_table_association" "private_route" {
    for_each = aws_subnet.private_subnet
    subnet_id = each.value.id
    route_table_id = aws_route_table.sample_private_route_table.id
}