variable "vpc_id" {}

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

variable "aws_access_key" {
    default = "AKIARSZKLGUFX5LN6AIP"
    #default = "ACCESS"
}
variable "aws_secret_key" {
    default = "SniKUFMVPEM4yqlcKCXYdINyv/dwfuaoJ7Bv5jTd"
    #default = "SECRET"
}
variable "aws_key_path" {
    default = "/root/terraform-ansible/terraform"
}
variable "aws_key_name" {
    default = "ansible"
}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}

variable "amis" {
    description = "AMIs by region"
    default = {
        us-east-1 = "ami-0022c769"
    }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.2.0/24"
}
