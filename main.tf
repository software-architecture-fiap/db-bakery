resource "aws_dynamodb_table" "customers" {
  name             = "customers"
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
