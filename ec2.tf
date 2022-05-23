data "aws_ami" "amazonLinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "manager" {
  ami                    = data.aws_ami.amazonLinux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.swarm.id}"]

  tags = {
    Name = "Manager"
  }
}

resource "aws_instance" "worker" {
  count                  = 2
  ami                    = data.aws_ami.amazonLinux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.swarm.id}"]

  tags = {
    Name = "Worker ${count.index + 1}"
  }
}