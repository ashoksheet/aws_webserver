####################################################
####    Variables used for Provider resource    ####
####################################################
variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "zones" {
  default = ["a", "b", "a", "b"]
}
###################################################
####    Variables used for Network resource    ####
###################################################
variable "vpc_name" {
  default = "my_vpc"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.11.0/24", "10.0.12.0/24", "10.0.21.0/24", "10.0.22.0/24"]
}

variable "pub_rtb_rt_cidrblk" {
  type    = string
  default = "0.0.0.0/0"
}
###############################################
####    Variables used for EC2 resource    ####
###############################################
variable "server_image" {
  type    = string
  default = "ami-03e88be9ecff64781"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}


###############################################
####    Variables used for RDS resource    ####
###############################################
variable "allocated_storage" {
  type    = string
  default = 20
}

variable "storage_type" {
  type    = string
  default = "gp2"
}
variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_vers" {
  type    = string
  default = "8.0.20"
}

variable "db_name" {
  type    = string
  default = "my_db"
}

variable "db_username" {
  type    = string
  default = "amaurya"
}

variable "db_passwd" {
  type    = string
  default = "admin123"
}

variable "db-instance_class" {
  type    = string
  default = "db.t2.micro"
}


