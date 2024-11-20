terraform {
  backend "local" {
    path = "my.tfstate"
  }
}

provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

module "instance" {
  source = "./module_instance"
}
