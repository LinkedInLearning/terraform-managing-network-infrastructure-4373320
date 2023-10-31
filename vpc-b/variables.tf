# security credential variables
variable "access_key" {
  type      = string
  sensitive = true
}

variable "secret_key" {
  type      = string
  sensitive = true
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR of AWS VPC"
  type        = string
}

# instance variables
variable "instance_type" {
  description = "Type of AWS instance to deploy"
  type        = string
}

variable "ami_id" {
  description = "ID of amazon machine image"
  type        = string
}

variable "public_key" {
  description = "Path to public key"
  type        = string
  sensitive   = true
}
