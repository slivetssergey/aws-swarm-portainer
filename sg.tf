resource "aws_security_group" "swarm" {
  name        = "swarm-group"
  description = "Default security group. Allow inbound and outbound traffic from all instances in VPC"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    self        = true
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "swarm"
  }
}