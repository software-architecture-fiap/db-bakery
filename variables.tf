variable "aws_region" {
  description = "AWS Region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "rds_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
  default     = "customers-db"
}

variable "rds_instance_class" {
  description = "Instance class for RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_engine" {
  description = "RDS database engine"
  type        = string
  default     = "postgres"
}

variable "rds_engine_version" {
  description = "Engine version for the RDS instance"
  type        = string
  default     = "15.2"
}

variable "rds_username" {
  description = "Master username for the RDS instance"
  type        = string
  default     = "admin"
}

variable "rds_password" {
  description = "Master password for the RDS instance"
  type        = string
}

variable "rds_storage" {
  description = "Allocated storage size in GB for the RDS instance"
  type        = number
  default     = 20
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
