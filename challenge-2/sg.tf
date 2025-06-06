resource "aws_security_group" "payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]

  ingress {
    description = "Below ingress allows HTTPS  from DEV VPC"
    from_port   = var.https
    to_port     = var.https
    protocol    = "tcp"
    cidr_blocks = [var.dev_vpc]
  }

  ingress {
    description = "Below ingress allows APIs access from DEV VPC"
    from_port   = var.apis
    to_port     = var.apis
    protocol    = "tcp"
    cidr_blocks = [var.dev_vpc]
  }

  ingress {
    description = "Below ingress allows APIs access from Prod App Public IP"
    from_port   = var.prod_apis
    to_port     = var.prod_apis
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }

  egress {
    description = "allow splunk"
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "payments-app"
    Team = "payments-team"
    Env = "Production"
  }
}