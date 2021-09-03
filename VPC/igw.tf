resource "aws_internet_gateway" "sample_igw" {

  depends_on = [
    aws_vpc.sample_vpc,
    aws_subnet.public_subnet
  ]

  vpc_id = aws_vpc.sample_vpc.id

  tags = {
    Name = "Sample IGW"
  }
}