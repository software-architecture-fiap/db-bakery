variable "aws_region" {
  description = "AWS Region where resources will be created"
  type        = string
  default     = "us-east-1"
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
