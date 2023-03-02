# security credential variables
variable "access_key" {
  type        = string
  sensitive   = true
}

variable "secret_key" {
  type        = string
  sensitive   = true
}

variable "region" {
  type        = string
  default     = "us-east-2"
}

# network variables
variable "vpc_name" {
  description  = "Name of AWS VPC"
  type         = string
}

variable "vpc_cidr" {
  description  = "CIDR of AWS VPC"
  type         = string
}

variable "subnets" {
  description  = "List of AWS subnets"
  type         = list(string)
}

variable "igw" {
  description  = "Name of AWS internet gateway"
  type         = string
}

variable "ngw" {
  description  = "Name of AWS NAT gateway"
  type         = string
}

variable "public_rtb" {
  description  = "Name of AWS route table"
  type         = string
}

variable "private_rtb" {
  description  = "Name of AWS route table"
  type         = string
}

variable "public_sg" {
  description  = "Name of AWS security group"
  type         = string
}

variable "public_ip" {
  description  = "Public IP to whitelist"
  type         = string
}

# instance variables
variable "instances" {
  description  = "List of AWS instances"
  type         = list(string)
}

variable "instance_type" {
  description  = "Type of AWS instance to deploy"
  type         = string
}

variable "ami_id" {
  description  = "ID of amazon machine image"
  type         = string
}

variable "public_key" {
  description  = "Path to public key"
  type         = string
  sensitive    = true
}