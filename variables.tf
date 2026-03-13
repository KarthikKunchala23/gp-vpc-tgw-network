variable "region" {
  type = string
  default = "ap-south-1"
}

variable "vpc_cidr_blocks" {
  type = list(string)
  default = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
}

variable "vpc_subnets" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.1.1.0/24", "10.2.1.0/24"]
}

variable "vpc-1-routes" {
  type = list(string)
  default = ["10.1.0.0/16", "10.2.0.0/16"]
}
variable "vpc-2-routes" {
  type = list(string)
  default = ["10.0.0.0/16", "10.2.0.0/16"]
}

variable "vpc-3-routes" {
  type = list(string)
  default = ["10.0.0.0/16", "10.1.0.0/16"]
}
