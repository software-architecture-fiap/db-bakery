variable "aws_region" {
  description = "AWS Region Where Resources Will Be Created"
  type        = string
  default     = "us-east-1"
}

variable "db_allocated_storage" {
  default = 20
}

variable "db_engine" {
  default = "postgres"
}

variable "db_engine_version" {
  default = "16.3"
}

variable "db_instance_class" {
  default = "db.t4g.micro"
}

variable "db_name" {
  default = "challenge"
}

variable "db_username" {
  default = "postgres"
}

variable "db_password" {
  sensitive = true
}

variable "db_parameter_group_name" {
  default = "default.postgres16"
}

variable "db_tags" {
  type = map(string)
  default = {
    Name = "db-bakery"
  }
}
