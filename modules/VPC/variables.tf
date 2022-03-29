variable "aws_region" {
  description = "AWS region"
  type        = string
  default = null
}

variable "vpc_cidr_blk" {
  description = "cider block for vpc"
  type        = string
  default     = null
}

variable "public_subnets_cidrs" {
  description = "public subnet cidr ip's"
  type        = list(string)
  default     = null
}

variable "private_subnets_cidrs" {
  description = "private subnet cidr ip's"
  type        = list(string)
  default     = null
}

variable "availability_zones" {
  description = "availability zones of AZ"
  type        = list(string)
  default     = null
}