resource "aws_route_table" "sample_public_route_table" {
  # The VPC ID.
  vpc_id = aws_vpc.sample_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample_igw.id
  }

  tags = {
    Name = "Sample Public RT"
  }
}

resource "aws_route_table" "sample_private_route_table" {
  vpc_id = aws_vpc.sample_vpc.id

  tags = {
    Name = "Sample Private RT"
  }
}
