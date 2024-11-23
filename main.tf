resource "aws_dynamodb_table" "customers" {
  name         = "customers"
  read_capacity = var.read_capacity
  write_capacity = var.write_capacity

  attribute {
    name = "id"
    type = "S"
  }

  hash_key = "id"

  attribute {
    name = "name"
    type = "S"
  }

  attribute {
    name = "email"
    type = "S"
  }

  attribute {
    name = "cpf"
    type = "S"
  }

  attribute {
    name = "hashed_password"
    type = "S"
  }

  global_secondary_index {
    name               = "name-index"
    hash_key           = "name"
    projection_type    = "ALL"
    read_capacity      = 5
    write_capacity     = 5
  }

  global_secondary_index {
    name               = "email-index"
    hash_key           = "email"
    projection_type    = "ALL"
    read_capacity      = 5
    write_capacity     = 5
  }

  global_secondary_index {
    name               = "cpf-index"
    hash_key           = "cpf"
    projection_type    = "ALL"
    read_capacity      = 5
    write_capacity     = 5
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
