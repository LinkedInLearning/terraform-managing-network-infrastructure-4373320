resource "random_id" "dev" {
  byte_length = 8
}

resource "aws_key_pair" "dev" {
  key_name   = random_id.dev.hex
  public_key = file(var.public_key)
}

resource "aws_instance" "dev" {
  count                       = length(var.instances)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.dev.key_name
  subnet_id                   = aws_subnet.dev[count.index].id
  associate_public_ip_address = true

  tags    = {
    Name  = var.instances[count.index]
  }

}

resource "aws_security_group" "public" {
  vpc_id      = aws_vpc.dev.id
  name        = var.public_sg

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags    = {
    Name  = var.public_sg
  }

}

resource "aws_network_interface_sg_attachment" "public" {
  security_group_id     = aws_security_group.public.id
  network_interface_id  = aws_instance.dev[0].primary_network_interface_id
}