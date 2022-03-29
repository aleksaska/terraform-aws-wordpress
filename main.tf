module "vpc" {
  source  = "./modules/VPC"
  ################## Region of landing VPC #################
  vpc_regions = var.aws_regions
  ################## VPC parameters #################
  vpc_cidr_blk = var.vpc_cidr_blk
  public_subnets_cidrs = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
  availability_zones = var.availability_zones
}

module "rds" {
  source  = "./modules/RDS"
  ################## Region of landing ASG #################
  rds_regions = var.aws_regions
  ################## RDS cluster #################
  engine_version = var.engine_version
  number_of_instanses = var.number_of_instanses
  master_username = var.aster_username
  ################## Route53 #################
  rds_zoneid = var.ZONEID
  rds_domain = var.DOMAIN
  ################## from other modules #################
  rds_vpc_id = module.vpc.vpc_id                     # for db security group
  rds_subnet_ids = module.vpc.private_subnet_ids     # for db subnet group
}

module "asg" {
  source  = "./modules/ASG_LB"
  ################## Region of landing ASG #################
  asg_region = var.aws_region
  ################## Autoscaling group #################
  min_size = var.min_size
  desire_size = var.desire_size
  max_size = var.max_size
  ################## Route53 #################
  asg_zoneid = var.ZONEID
  asg_domain = var.DOMAIN
  ################## from other modules #################
  asg_vpc_id = module.vpc.vpc_id
  asg_subnet_ids = module.vpc.public_subnet_ids
  ################## db credentials #################
  username = module.rds.username
  userpassword = module.rds.userpassword
  dbname = module.rds.dbname
  cluster_endpoint = module.rds.cluster_endpoint
  depends = [module.rds.depends_on]
}