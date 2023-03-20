locals {
  ingress_cidr_list = concat([var.public_ip], ["10.1.1.0/24", "10.6.1.0/24"])
}