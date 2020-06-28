resource "aws_instance" "webserver" {
  ami           = "ami-0affd4508a5d2481b"
  instance_type = var.instance_type
  tags = {
    Name        = "${var.environment}-webserver",
    Name1       = format("%s-webserver", var.environment),
    Name2       = format("%s-%s", var.environment, "webserver"),
    Environment = var.environment
  }
  root_block_device {
    delete_on_termination = true
  }

  user_data              = data.template_file.user_data.rendered
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
}

resource "aws_security_group" "webserver_sg" {
  name = "${var.environment}-webserver-sg"
}

resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  security_group_id = aws_security_group.webserver_sg.id

  from_port   = local.webserver_port
  to_port     = local.webserver_port
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_egress" {
  type              = "egress"
  security_group_id = aws_security_group.webserver_sg.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

data "template_file" "user_data" {
  template = file("${path.module}/user-data.sh")
  vars = {
    db_address  = data.aws_db_instance.rds.address
    environment = var.environment
  }
}

data "aws_db_instance" "rds" {
  db_instance_identifier = "${var.environment}-users-rds"
}