/* VPC */
resource "aws_vpc" "nsalinas_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  tags = var.tags
}

/* InternetGateway*/
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.nsalinas_vpc.id}"
  tags = var.tags
}

/* Public subnet */
resource "aws_subnet" "public_subnet" {
  vpc_id     = "${aws_vpc.nsalinas_vpc.id}"
  cidr_block        = "${var.public_subnet_cidr_1}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = var.tags
}

/* Private subnet */
resource "aws_subnet" "private_subnet" {
  vpc_id                  = "${aws_vpc.nsalinas_vpc.id}"
  cidr_block              = "${var.private_subnet_cidr_1}"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = var.tags
}

/* Routing table for private subnet */
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.nsalinas_vpc.id}"
  tags = var.tags
}
/* Routing table for public subnet */
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.nsalinas_vpc.id}"
  tags = var.tags
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.ig.id}"
}

/* Route table associations */
resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_security_group" "sg_public" {
    name = var.sg_name
    vpc_id     = "${aws_vpc.nsalinas_vpc.id}"
    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port = ingress.value.from_port
            to_port = ingress.value.to_port
            protocol = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
        }
    }
}

resource "aws_security_group" "sg_private" {
    name = var.sg_name_private
    vpc_id     = "${aws_vpc.nsalinas_vpc.id}"
    dynamic "ingress" {
        for_each = var.ingress_rules_private
        content {
            from_port = ingress.value.from_port
            to_port = ingress.value.to_port
            protocol = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
        }
    }
}

output "public_subnet_id" {
    value = "${aws_subnet.public_subnet.id}"
}

output "private_subnet_id" {
    value = "${aws_subnet.private_subnet.id}"
}

output "sg_public" {
    value = "${aws_security_group.sg_public.id}"
}

output "sg_private" {
    value = "${aws_security_group.sg_private.id}"
}
