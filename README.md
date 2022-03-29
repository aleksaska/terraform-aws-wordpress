# terraform 3tier app

### Usage:
```
module "wordpress" {
  source = "AleksaSka/wordpress/aws"
  ################### VPC ###########################
  ################## Region of landing VPC #################
  vpc_region = "us-east-1"
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
  rds_region = "us-east-1"
  ################## RDS cluster #################
  engine_version = "5.7.mysql_aurora.2.03.2"
  number_of_instanses = 1
  master_username = "tanos"
  master_password = "changeme"
  ################## Route53 #################
  rds_zoneid = "yourdomainid"
  rds_domain = "yourdomain"

################### ASG ###########################
  ################## Region of landing ASG #################
  asg_region = "us-east-1"
  ################## Autoscaling group #################
  min_size = 1
  desire_size = 4
  max_size = 99
  ################## Route53 #################
  asg_zoneid = "yourdomainid"
  asg_domain = "yourdomain"
}
```


### IN CASE IF U NEED OUTPUTS RIGHT AWAY U CAN USE FOLLOWING IN OUTPUT.TF FOLDER:

```
output "name" {
    value = module.wordpress.user_name
}
output  "password" {
    value = module.wordpress.user_password
}

output "wordpress_domain_link" {
    value = module.wordpress.link_to_wordpress_domain
}

output "rds_writer_link" {
    value = module.wordpress.link_to_rds_writer_instanse
}

output "rds_readers_links" {
    value = module.wordpress.links_to_rds_reader_instanses
}
```

### IN CASE IF U WANT TO KEEP YOUR STATE FILE IN S3 BACKET USE FOLLOWING WITH YOUR OWN S3 BACKET NAME AND KEY:

```
terraform {
  backend "s3" {
    bucket = "yourbacket"
    key    = "project/"
    region = "us-east-1"
  }
  ```
