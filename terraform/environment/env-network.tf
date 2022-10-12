module "network" {
  source = "../modules/network"

  #basic
  env     = var.env
  project = var.project
  region  = var.region

  #vpc
  vpc_cidr      = var.vpc_cidr
  private_cidrs = var.private_cidrs
  public_cidrs  = var.public_cidrs
}
