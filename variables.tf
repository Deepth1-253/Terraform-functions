variable "aws_region" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
# variable "IGW_name" {}
variable "key_name" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "Main_Routing_Table" {}
variable "azs" {}
variable "environment" { default = "dev" }
variable "ingress_value" {}
