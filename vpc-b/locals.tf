resource "random_id" "test" {
  byte_length = 8
}

resource "random_string" "test" {
  length   = 16
  lower    = true
  numeric  = true
  upper    = false
  special  = false
}

locals {

  # Format vpc values
  trim_suffix          = trimsuffix(var.vpc_cidr, "/20")
  replace_period       = replace(local.trim_suffix, ".", "-")
  vpc_name             = format("vpc-test-%s", local.replace_period)

  # Format subnet values
  rtb_name             = format("rtb-test-%s", random_string.test.result)
  subnet_cidr          = cidrsubnet(var.vpc_cidr, 4, 1)
  subnet_name          = format("subnet-%s", random_string.test.result)

  # Format instance values
  ec2_instance_name    = "ec2-${random_string.test.result}"
  key_pair_name        = random_id.test.hex
  security_group_name  = format("grp-%s", random_string.test.result)

  # Allowed for ingress
  ingress_cidr_list    = concat([var.public_ip], ["10.5.1.0/24"])

}