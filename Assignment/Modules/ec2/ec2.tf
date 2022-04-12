#Create EC2 Instance
resource "aws_instance" "webserver1" {
  ami                    = var.server_image
  instance_type          = var.instance_type
  availability_zone      = "${var.region}${var.zones[0]}"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = var.subnet_1
  user_data              = file("${path.module}/install_apache.sh")

  tags = {
    Name = "Web Server"
  }

}

resource "aws_instance" "webserver2" {
  ami                    = var.server_image
  instance_type          = var.instance_type
  availability_zone      = "${var.region}${var.zones[1]}"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = var.subnet_2
  user_data              = file("${path.module}/install_apache.sh")

  tags = {
    Name = "Web Server"
  }

}

# Create Application Security Group
resource "aws_security_group" "webserver-sg" {
  name        = "Webserver-SG"
  description = "Allow inbound traffic from ALB"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow traffic from web layer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.sg]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Webserver-SG"
  }
}