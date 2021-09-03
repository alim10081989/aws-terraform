resource "aws_subnet" "public_subnet" {

  depends_on = [
    aws_vpc.sample_vpc
  ]

  for_each          = tomap(var.public_subnets_list)
  availability_zone = each.key
  cidr_block        = each.value
  vpc_id            = aws_vpc.sample_vpc.id
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_Subnet_${each.key}"
  }
}

resource "aws_subnet" "private_subnet" {

  depends_on = [
    aws_vpc.sample_vpc
  ]

  for_each          = tomap(var.private_subnets_list)
  availability_zone = each.key
  cidr_block        = each.value
  vpc_id            = aws_vpc.sample_vpc.id

  tags = {
    Name = "Private_Subnet_${each.key}"
  }
}