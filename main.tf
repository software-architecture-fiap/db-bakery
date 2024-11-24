resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow RDS Inbound Access"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_db_instance" "customers_db" {
  identifier         = var.rds_instance_identifier
  instance_class     = var.rds_instance_class
  engine             = var.rds_engine
  engine_version     = var.rds_engine_version
  username           = var.rds_username
  password           = var.rds_password
  allocated_storage  = var.rds_storage
  storage_type       = "gp2"
  publicly_accessible = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }

  lifecycle {
    prevent_destroy = true
  }
}
