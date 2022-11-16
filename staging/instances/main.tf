
resource "aws_instance" "nsalinas-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  tags                   = var.tags
  subnet_id              = "${var.public_subnet_id}"
  vpc_security_group_ids = [ "${var.public_security_group_id}" ]
  key_name               = "${var.key_name}"
}

resource "aws_instance" "nsalinas-instance-db" {
  ami                    = var.ami
  instance_type          = var.instance_type
  tags                   = var.tags
  subnet_id              = "${var.private_subnet_id}"
  vpc_security_group_ids = [ "${var.private_security_group_id}" ]
  key_name               = "${var.key_name}"
}