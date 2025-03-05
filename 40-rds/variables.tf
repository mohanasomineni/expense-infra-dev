variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "expense"
    Environment = "dev"
    Terraform = "true"
  }
}

variable "zone_id" {
  default = "Z02891778HHNB1AKFVYA"
}

variable "domain_name" {
  default = "mohanaaws.store"
}