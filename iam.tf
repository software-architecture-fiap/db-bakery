resource "aws_iam_policy" "dynamodb_access_policy" {
  name        = "DynamoDBAccessPolicy"
  description = "Policy to Allow Access to DynamoDB Tables"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "dynamodb:DescribeTable",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem"
        ]
        Resource = "arn:aws:dynamodb:us-east-1:830714066230:table/customers"
      }
    ]
  })
}

resource "aws_iam_policy" "dynamodb_describe_table" {
  name        = "DynamoDBDescribeTablePolicy"
  description = "Policy to allow DescribeTable action on customers table"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "dynamodb:DescribeTable"
        Resource = "arn:aws:dynamodb:us-east-1:830714066230:table/customers"
      }
    ]
  })
}
