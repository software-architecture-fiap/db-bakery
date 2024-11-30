resource "aws_db_instance" "postgres" {
  allocated_storage       = var.db_allocated_storage
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  parameter_group_name    = var.db_parameter_group_name
  publicly_accessible     = false
  skip_final_snapshot     = true
  storage_type            = "gp2"
  backup_retention_period = 0

  tags = var.db_tags
}
