# terraform aws rds

### Usage:
```
module "rds" {
  source  = "./modules/RDS"
  ################## Region of landing ASG #################
  aws_regions = "us-east-1"
  ################## RDS cluster #################
  engine_version = "5.7.mysql_aurora.2.03.2"
  number_of_instanses = 4
  master_username = "tanos"
  master_password = "changeme"
  ################## Route53 #################
  ZONEID = "yourdomainid"
  DOMAIN = "yourdomain"
  ################## from other modules #################
  vpc_id = module.vpc.vpc_id                     # for db security group
  subnet_ids = module.vpc.private_subnet_ids     # for db subnet group
}

```

