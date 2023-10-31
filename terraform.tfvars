# network values
vpc_name    = "vpc-dev"
vpc_cidr    = "10.5.0.0/20"
subnets     = ["sub-public", "sub-private"]
igw         = "igw-dev"
ngw         = "ngw-dev"
public_rtb  = "rtb-public"
private_rtb = "rtb-private"
public_sg   = "grp-public"
public_ip   = "76.110.169.141/32"

# instance values
instance_type = "t2.micro"
ami_id        = "ami-0fc5d935ebf8bc3bc"
instances     = ["ec2-public", "ec2-private"]
public_key    = "keys/ec2.pub"
