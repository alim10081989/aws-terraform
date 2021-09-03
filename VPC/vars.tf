variable "ingress_ports" {
  type        = map(any)
  description = "Ingress Ports"
  default = {
    "SSH Access"  = 22
    "HTTP Access" = 80
    "Jenkins Access" = 8080
  }
}

variable "public_subnets_list" {
  type        = map(any)
  description = "Public Subnets"
  default = {
    "ap-south-1a" = "10.0.1.0/24"
    "ap-south-1b" = "10.0.2.0/24"
    "ap-south-1c" = "10.0.3.0/24"
  }
}

variable "private_subnets_list" {
  type        = map(any)
  description = "Private Subnets"
  default = {
    "ap-south-1a" = "10.0.4.0/24"
    "ap-south-1b" = "10.0.5.0/24"
    "ap-south-1c" = "10.0.6.0/24"
  }
}

variable "aws_region" {}

variable "machine_type" {}

variable "ami_id" {}

variable "ssh_key" {}