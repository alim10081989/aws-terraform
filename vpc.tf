# Resource: aws_vpc
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "demo-vpc" {

    # The CIDR block for the VPC.
    cidr_block = "10.0.0.0/16"

    # Required for EKS. Enable/disable DNS support & DNS hostnames in the VPC.
    enable_dns_support = true
    enable_dns_hostnames = true

    # Makes your instances shared on the host.
    instance_tenancy = "default"

    # Enable/disable ClassicLink & Classic Link DNS Support for the VPC.
    enable_classiclink = false
    enable_classiclink_dns_support = false

    # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC.
    assign_generated_ipv6_cidr_block = false

    # A map of tags to assign to the resource.
    tags = {
        Name = "demo-vpc"
    }
}

output "vpc_id" {
    value = aws_vpc.demo-vpc.id
    description = "VPC id."
    # Setting an output value as sensitive prevents Terraform from showing its value in plan and apply.
    sensitive = false
}