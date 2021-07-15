# Resource: aws_internet_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "demo-igw" {
  # The VPC ID to create in.
  vpc_id = aws_vpc.demo-vpc.id

  # A map of tags to assign to the resource.
  tags = {
    Name = "demo-vpc-igw"
  }
}