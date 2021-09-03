resource "aws_eip" "nat_gateway" {
    for_each = aws_subnet.public_subnet
    vpc = true

    tags = {
      Name = "Sample EIP - ${each.value.availability_zone}"
    }
}

resource "aws_nat_gateway" "sample_nat_gw" {
    for_each = aws_subnet.public_subnet
    allocation_id = aws_eip.nat_gateway[each.key].id
    subnet_id     = each.value.id

  tags = {
    Name = "Sample NAT GW - ${each.value.availability_zone}"
  }

  depends_on = [
      aws_internet_gateway.sample_igw,
      aws_subnet.private_subnet
      ]
}