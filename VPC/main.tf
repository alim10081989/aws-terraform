provider "aws" {
  region  = var.aws_region
  profile = "default"
}

resource "aws_security_group" "sample_sg" {

  depends_on = [
    aws_vpc.sample_vpc,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet,
    aws_internet_gateway.sample_igw
  ]

  name = "sample_sg"
  vpc_id = aws_vpc.sample_vpc.id

  dynamic "ingress" {

    iterator = port
    for_each = tomap(var.ingress_ports)

    content {

      description = port.key
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Sample SG"
  }
}

locals {
  depends_on = [
    aws_instance.sample_instance
  ]
  vars = {
    some_address = "${aws_instance.sample_instance.private_ip}"
  }
}
resource "aws_instance" "sample_instance" {

  depends_on = [
    aws_vpc.sample_vpc,
    aws_subnet.public_subnet,
    aws_security_group.sample_sg,
  ]

  ami = var.ami_id
  instance_type = var.machine_type
  security_groups = ["${aws_security_group.sample_sg.id}"]
  key_name = var.ssh_key
  vpc_security_group_ids = ["${aws_security_group.sample_sg.id}"]
  subnet_id = data.aws_subnet.subnet_var.id

  user_data = file("scripts/install_apache.sh")
  #user_data = "${data.template_file.init.rendered}"

  root_block_device {
    volume_type = "gp2"
    volume_size = 10
    iops = 100
    encrypted = false
  }

  tags = {
    Name = "Sample Instance"
  }

}