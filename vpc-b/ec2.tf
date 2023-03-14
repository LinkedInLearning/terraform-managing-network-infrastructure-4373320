resource "aws_key_pair" "test" {
  key_name   = local.key_pair_name
  public_key = file(var.public_key)
}

resource "aws_instance" "test" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.test.key_name
  subnet_id                   = aws_subnet.test.id
  associate_public_ip_address = true

  tags    = {
    Name  = local.ec2_instance_name
  }

}

resource "aws_security_group" "test" {
  vpc_id      = aws_vpc.test.id
  name        = local.security_group_name

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = local.ingress_cidr_list
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags    = {
    Name  = local.security_group_name
  }

}

resource "aws_network_interface_sg_attachment" "test" {
  security_group_id     = aws_security_group.test.id
  network_interface_id  = aws_instance.test.primary_network_interface_id
}