module "vpc" {
  source  = "./modules/VPC"
  ################## Region of landing VPC #################
  aws_regions = var.vpc_regions
  ################## VPC parameters #################
  vpc_cidr_blk = var.vpc_cidr_blk
  public_subnets_cidrs = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
  availability_zones = var.availability_zones
}

module "rds" {
  source  = "./modules/RDS"
  ################## Region of landing ASG #################
  aws_regions = var.rds_regions
  ################## RDS cluster #################
  engine_version = var.engine_version
  number_of_instanses = var.number_of_instanses
  master_username = var.aster_username
  ################## Route53 #################
  ZONEID = var.rds_zoneid
  DOMAIN = var.rds_domain
  ################## from other modules #################
  vpc_id = module.vpc.vpc_id                     # for db security group
  subnet_ids = module.vpc.private_subnet_ids     # for db subnet group
}

module "asg" {
  source  = "./modules/ASG_LB"
  ################## Region of landing ASG #################
  aws_regions = var.asg_region
  ################## Autoscaling group #################
  min_size = var.min_size
  desire_size = var.desire_size
  max_size = var.max_size
  ################## Route53 #################
  ZONEID = var.asg_zoneid
  DOMAIN = var.asg_domain
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