# terraform 3tier app

### Usage:
```
module "wordpress" {
  source = "AleksaSka/wordpress/aws"
  ################### VPC ###########################
  ################## Region of landing VPC #################
  vpc_regions = "us-east-1"
  ################## VPC parameters #################
  vpc_cidr_blk = "10.0.0.0/16"
  public_subnets_cidrs = [
      "10.0.101.0/24",
      "10.0.102.0/24",
      "10.0.103.0/24",
  ]
  private_subnets_cidrs = [
      "10.0.1.0/24",
      "10.0.2.0/24",
      "10.0.3.0/24",
  ]
  availability_zones = [
       "us-east-1a",
       "us-east-1b",
       "us-east-1c",
  ]
################### RDS ###########################
  ################## Region of landing RDS #################
  rds_regions = "us-east-1"
  ################## RDS cluster #################
  engine_version = "5.7.mysql_aurora.2.03.2"
  number_of_instanses = 1
  master_username = "tanos"
  ################## Route53 #################
  rds_zoneid = "Z0797111NE21F45UKDAP"
  rds_domain = "fiefdomain.com"

################### ASG ###########################
  ################## Region of landing ASG #################
  asg_region = "us-east-1"
  ################## Autoscaling group #################
  min_size = 1
  desire_size = 4
  max_size = 99
  ################## Route53 #################
  asg_zoneid = "Z0797111NE21F45UKDAP"
  asg_domain = "fiefdomain.com"
}
```