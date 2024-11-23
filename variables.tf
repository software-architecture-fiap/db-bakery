variable "tech_challenge" {
  description = "Name of the DynamoDB table"
  type        = string
  default = "customers"
}

variable "aws_region" {
  description = "AWS Region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "partition_key_name" {
  description = "Partition key name for the DynamoDB table"
  type        = string
  default = "PK"
}

variable "partition_key_type" {
  description = "Partition key type (S = String, N = Number, B = Binary)"
  type        = string
  default     = "S"
}

variable "environment" {
  description = "Environment TAG"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project Name Tag"
  type        = string
  default = "tech_challenge"
}

variable "read_capacity" {
  description = "Read capacity for PROVISIONED mode"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "Write capacity for PROVISIONED mode"
  type        = number
  default     = 5
}

variable "sort_key_name" {
  description = "Sort key name for the DynamoDB table (optional)"
  type        = string
  default     = null
}

variable "sort_key_type" {
  description = "Sort key type (S = String, N = Number, B = Binary) (optional)"
  type        = string
  default     = null
}
