# network values
vpc_name = "vpc-dev"
vpc_cidr = "10.5.0.0/20"
subnets  = ["sub-public", "sub-private"]

# instance values
instance_type = "t2.micro"
ami_id        = "ami-0fc5d935ebf8bc3bc"
instances     = ["ec2-public", "ec2-private"]
public_key    = "keys/ec2.pub"
