data "aws_subnet" "subnet_var" {

  depends_on = [
    aws_security_group.sample_sg
  ]

  vpc_id = aws_vpc.sample_vpc.id
  filter {
    name   = "tag:Name"
    values = ["Public_Subnet_ap-south-1b"]
  }
}

#data "template_file" "init" {
#  template = "${file("${path.module}/templates/user_data.sh.tpl")}"
#  vars = {
#    some_address = "${aws_instance.sample_instance.private_ip}"
#  }
#}