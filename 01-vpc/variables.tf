variable "project_name" {
  default = "expence"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  type = map
  default = {
    project_name = "expence"
    Terraform = true
    Environmen = "dev"
  }
}

variable "public_subnet_cidrs" {
  type = list
  default = ["10.0.2.0/24", "10.0.34.0/24"]
}

variable "private_subnet_cidrs" {
  type = list
  default = ["10.0.3.0/24", "10.0.11.0/24"]
}

variable "database_subnet_cidrs" {
  type = list
  default = ["10.0.4.0/24", "10.0.44.0/24"]
}

variable "is_peering_required" {
  default = true
}