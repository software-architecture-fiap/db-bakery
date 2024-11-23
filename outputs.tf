output "table_name" {
  description = "Name of the DynamoDB Table"
  value       = aws_dynamodb_table.tech_challenge.name
}

output "table_arn" {
  description = "ARN of the DynamoDB Table"
  value       = aws_dynamodb_table.tech_challenge.arn
}
