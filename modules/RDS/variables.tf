variable "aws_region" {
  description = "AWS region"
  type        = string
  default = null
}

variable "engine_version" {
  description = "rds claster engene version"
  type        = string
  default     = null
}

variable "number_of_instanses" {
  description = "number of instanses"
  type        = number
  default     = null
}

variable "master_username" {
  description = "rds mastr user name"
  type        = string
  default     = null
}

variable "ZONEID" {
  description = "id of your domain host"
  type        = string
  default     = null
}

variable "DOMAIN" {
  description = "your domain host"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "your vpc id"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "private subnet ids"
  type        = list
  default     = null
}