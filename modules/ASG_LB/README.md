# terraform aws asg

### Usage:
```
module "asg" {
  source  = "./modules/ASG_LB"
  ################## Region of landing ASG #################
  aws_region = "us-east-1"
  ################## Autoscaling group #################
  name = "wordpress"
  min_size = 1
  desire_size = 4
  max_size = 99
  health_check_type = "EC2"
  ################## Route53 #################
  ZONEID = "yourdomainid"
  DOMAIN = "yourdomain"
  ################## from other modules #################
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
  ################## db credentials #################
  username = module.rds.username
  userpassword = module.rds.userpassword
  dbname = module.rds.dbname
  cluster_endpoint = module.rds.cluster_endpoint
  depends = [module.rds.depends_on]
}

```