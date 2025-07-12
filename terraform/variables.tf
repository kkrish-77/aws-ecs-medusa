variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "medusa_my_store"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "medusa_user"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
} 