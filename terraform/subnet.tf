resource "aws_subnet" "public_1" {

    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "public-ap-south-1a"
        "kubernetes.io/cluster/eks" = "shared"
        "kubernetes.io/role/elb"    = 1
    }
}

resource "aws_subnet" "public_2" {

    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = "public-ap-south-1b"
    }
  
}

resource "aws_subnet" "private_1" {

    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-south-1a"

    tags = {
        Name = "private-ap-south-1a"
    }
}

resource "aws_subnet" "private_2" {

    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-south-1b"

    tags = {
        Name = "private-ap-south-1b"
        "kubernetes.io/cluster/eks"       = "shared"
        "kubernetes.io/role/internal-elb" = 1
    }
}