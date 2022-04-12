resource "aws_db_instance" "default" {
  allocated_storage      = var.allocated_storage
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  multi_az               = true
  name                   = var.db_name
  username               = var.username
  password               = var.password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}
resource "aws_security_group" "database-sg" {
  name        = "Database-SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
   security_groups = [var.websg]
  }

  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database-SG"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [var.db_subnet_1, var.db_subnet_2]

  tags = {
    Name = "My DB subnet group"
  }
}