variable "ami" {
  type        = string
  description = "ami id"
}

variable "instance_type" {
  type        = string
  description = "tipo de instancia"
}

variable "tags" {
  type        = map
  description = "llaves para dar seguimiento"
}

variable "public_subnet_id" { }
variable "private_subnet_id" { }
variable "public_security_group_id" { }
variable "private_security_group_id" { }
variable "key_name" { }