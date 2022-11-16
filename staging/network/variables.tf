variable "tags" {
  type        = map
  description = "llaves para dar seguimiento"
}

variable "ingress_rules" { }
variable "ingress_rules_private" { }
variable "vpc_cidr" { }
variable "public_subnet_cidr_1" { }
variable "private_subnet_cidr_1" { }
variable "sg_name" { }
variable "sg_name_private" { }