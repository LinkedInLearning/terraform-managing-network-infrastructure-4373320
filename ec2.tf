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