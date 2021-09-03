resource "aws_vpc" "sample_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  # Required for EKS. Enable/disable DNS support & DNS hostnames in the VPC.
  enable_dns_support   = true
  enable_dns_hostnames = true

  # Enable/disable ClassicLink & Classic Link DNS Support for the VPC.
  enable_classiclink             = false
  enable_classiclink_dns_support = false

  # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC.
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "Terraform VPC"
  }
}