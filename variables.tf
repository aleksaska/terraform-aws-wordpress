########################### VPC ###################################
variable "vpc_region" {
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
########################### RDS ###################################
variable "rds_region" {
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

variable "rds_zoneid" {
  description = "id of your domain host"
  type        = string
  default     = null
}

variable "rds_domain" {
  description = "your domain host"
  type        = string
  default     = null
}

########################### ASG ###################################
####################################################################
# Region of launcing
####################################################################

variable "asg_region" {
  description = "AWS region"
  type        = string
  default     = "null"
}

####################################################################
# Autoscailing group
####################################################################

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
  default     = null
}

variable "desire_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
  default     = null
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
  default     = null
}

####################################################################
# Route53 information
####################################################################

variable "asg_zoneid" {
  description = "id of your domain host"
  type        = string
  default     = null                              #    "Z0797111NE21F45UKDAP"
}

variable "asg_domain" {
  description = "your domain host"
  type        = string
  default     = null                              #     "fiefdomain.com"
}
