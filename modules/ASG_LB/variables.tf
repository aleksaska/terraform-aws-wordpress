####################################################################
# Region of launcing
####################################################################

variable "aws_region" {
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

variable "ZONEID" {
  description = "id of your domain host"
  type        = string
  default     = null                              #    "Z0797111NE21F45UKDAP"
}

variable "DOMAIN" {
  description = "your domain host"
  type        = string
  default     = null                              #     "fiefdomain.com"
}

####################################################################
# from oter modules
####################################################################

variable "subnet_ids" {
  description = "A list of public subnet IDs to launch resources in"
  type        = list
  default     = null
}

variable "vpc_id" {
  description = "your vpc id"
  type        = string
  default     = null
}

####################################################################
# DB credentials
####################################################################

variable "username" {
  description = "your db username"
  type        = string
  default     = null
}

variable "userpassword" {
  description = "your db userpassword"
  type        = string
  default     = null
}

variable "dbname" {
  description = "your db name"
  type        = string
  default     = null
}

variable "cluster_endpoint" {
  description = "your db cluster endpoint"
  type        = string
  default     = null
}

variable "depends" {
  description = "depends"
  type        = list
  default     = null
}