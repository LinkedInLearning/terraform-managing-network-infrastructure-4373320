# network values
vpc_name       = "vpc-dev"
vpc_cidr       = "10.5.0.0/20"
subnets        = ["sub-public", "sub-private"]
igw            = "igw-dev"
ngw            = "ngw-dev"
public_rtb     = "rtb-public"
private_rtb    = "rtb-private"
public_sg      = "grp-public"

# instance values
instance_type  = "t3.nano"
ami_id         = "ami-0f0ba639982a32edb"
instances      = ["ec2-public", "ec2-private"]
public_key     = "keys/ec2.pub"