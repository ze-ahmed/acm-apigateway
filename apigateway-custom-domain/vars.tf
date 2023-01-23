variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "../key/mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "../key/mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-00874d747dde814fa"
    eu-west-1 = "ami-0333305f9719618c7"
    us-west-2 = "ami-0d09654d0a20d3ae2"
    eu-west-3 = "ami-0afd55c0c8a52973a"
  }
}


variable "AMIS-AMAZON" {
  type = map(string)
  default = {
    us-east-1 = "ami-0b5eea76982371e91"
    eu-west-1 = "ami-0fe0b2cf0e1f25c8a"
    us-west-2 = "ami-084e8c05825742534"
    eu-west-3 = "ami-0cc814d99c59f3789"
  }
}

variable "root_domain_name" {
  type    = string
  default = "api-my-api.fr"
}

variable "root_domain_name-2" {
  type    = string
  default = "api-my-api.fr"
}