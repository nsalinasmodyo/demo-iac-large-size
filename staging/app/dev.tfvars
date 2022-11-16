
region = "us-east-1"
profile = "personal"
key_name="prueba"
ami_id = "ami-04505e74c0741db8d"
instance_type = "t2.micro"
tags = {
    Name = "practica"
    Environment = "dev"
}

vpc_cidr = "10.0.0.0/16"
public_subnet_cidr_1 = "10.0.1.0/24"
private_subnet_cidr_1 = "10.0.2.0/24"
sg_name = "nsalinas-rules"
sg_name_private = "nsalinas-rules-private"
bucket_backend = "toctoc.status"
ingress_rules = [
    {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    },
    {
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    },
    {
        from_port = "5439"
        to_port = "5439"
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
]

ingress_rules_private = [
    {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    },
    {
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    },
    {
        from_port = "5439"
        to_port = "5439"
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    },
    {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = [ "10.0.1.0/24" ]
    }
]
