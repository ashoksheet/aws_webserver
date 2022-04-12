provider "aws" {
  region = var.region
}

module "network" {
  source             = "../Modules/vpc"
  region             = var.region
  zones              = var.zones
  vpc_name           = var.vpc_name
  pub_rtb_rt_cidrblk = var.pub_rtb_rt_cidrblk
  vpc_cidr_block     = var.vpc_cidr_block
  subnet_cidr_block  = var.subnet_cidr_block
}

module "appnodes" {
  source         = "../Modules/ec2"
  region         = var.region
  zones          = var.zones
  server_image   = var.server_image
  instance_type  = var.instance_type
  vpc_id         = module.network.vpc_id
  vpc_cidr_block = var.vpc_cidr_block
  subnet_1       = module.network.subnet_1
  subnet_2       = module.network.subnet_2
  sg             = module.alb.sg
}

module "alb" {
  source     = "../Modules/alb"
  vpc_id     = module.network.vpc_id
  subnet_1   = module.network.subnet_1
  subnet_2   = module.network.subnet_2
  webserver1 = module.appnodes.webserver1
  webserver2 = module.appnodes.webserver2
}

module "dbnode" {
  source            = "../Modules/rds"
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  engine            = var.engine
  engine_version    = var.engine_vers
  instance_class    = var.db-instance_class
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_passwd
  db_subnet_1       = module.network.db_subnet_1
  db_subnet_2       = module.network.db_subnet_2
  vpc_id            = module.network.vpc_id
  websg             = module.appnodes.websg

}