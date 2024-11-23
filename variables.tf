variable "tech_challenge" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "partition_key_name" {
  description = "Partition key name for the DynamoDB table"
  type        = string
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