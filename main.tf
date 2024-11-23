resource "aws_dynamodb_table" "tech_challenge" {
  name         = var.tech_challenge
  read_capacity = var.read_capacity
  write_capacity = var.write_capacity

  attribute {
    name = var.partition_key_name
    type = var.partition_key_type
  }

  hash_key = var.partition_key_name

  dynamic "attribute" {
    for_each = var.sort_key_name != null ? [1] : []
    content {
      name = var.sort_key_name
      type = var.sort_key_type
    }
  }

  range_key = var.sort_key_name != null ? var.sort_key_name : null

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
