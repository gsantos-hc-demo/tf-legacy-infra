module "security_group" {
  source = "./module_security_group"
}

resource "aws_instance" "this" {
  ami                    = "${data.aws_ami.ubuntu.image_id}"
  vpc_security_group_ids = ["${module.security_group.security_group_id}"]
  instance_type          = "${var.instance_type}"
}

data "aws_ami" "ubuntu" {
  owners      = ["099720109477"] # Canonical
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
