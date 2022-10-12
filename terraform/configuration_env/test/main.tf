# terraform {
#   backend s3 {}
# }

provider aws {
  region  = var.region
  profile = "${var.project}-project-${var.env}"
  version = "~> 4.0"
}

data aws_caller_identity current {}

module environment {
  source = "../../environment"

  #basic
  env              = var.env
  full_env         = var.full_env
  project          = var.project
  region           = var.region
  account_id       = var.account_id
  #network
  vpc_cidr = "10.1.0.0/16"
  private_cidrs = [
    "10.1.1.0/24",
    "10.1.2.0/24"
  ]
  public_cidrs = [
    "10.1.10.0/24",
    "10.1.11.0/24"
  ]
  

}
