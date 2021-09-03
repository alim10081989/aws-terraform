output "instances_info" {
  value       = "Instance ID : ${aws_instance.sample_instance.id} , Public IP : ${aws_instance.sample_instance.public_ip}, Private IP : ${aws_instance.sample_instance.private_ip}"
}

output "public_subnets" {
    value = [for subnet in aws_subnet.public_subnet : subnet.id]
}

output "private_subnets" {
  value = [for subnet in aws_subnet.private_subnet : subnet.id]
}

output "internet_gateway" {
  value = aws_internet_gateway.sample_igw.id
}

output "route_tables" {
  value = "Public RT : ${aws_route_table.sample_public_route_table.id}, Private RT : ${aws_route_table.sample_private_route_table.id}"
}
output "security_groups" {
  value = aws_security_group.sample_sg.id
}

output "elastic_ips" {
  value = [for subnet in aws_subnet.public_subnet: aws_eip.nat_gateway[subnet.availability_zone].id]
}

output "nat_gateway" {
  value = [for subnet in aws_subnet.public_subnet: aws_nat_gateway.sample_nat_gw[subnet.availability_zone].id]
}