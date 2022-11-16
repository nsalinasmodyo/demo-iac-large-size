provider "aws" {
  region = var.region
  profile = var.profile
}

module "network" {
    source                    = "../network"
    vpc_cidr                  = var.vpc_cidr
    ingress_rules             = var.ingress_rules
    ingress_rules_private     = var.ingress_rules_private
    public_subnet_cidr_1      = var.public_subnet_cidr_1
    private_subnet_cidr_1     = var.private_subnet_cidr_1
    sg_name                   = var.sg_name
    sg_name_private           = var.sg_name_private
    tags                      = var.tags
}

module "ec2" {
    source                    = "../instances"
    ami                       = var.ami_id
    instance_type             = var.instance_type
    public_subnet_id          = module.network.public_subnet_id
    private_subnet_id         = module.network.private_subnet_id
    public_security_group_id  = module.network.sg_public
    private_security_group_id = module.network.sg_private
    tags                      = var.tags
    key_name                  = var.key_name
}