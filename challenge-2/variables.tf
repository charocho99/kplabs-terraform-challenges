variable "https" {
  type = number
}

variable "apis" {
  type = number
}

variable "prod_apis" {
  type = number
}

variable "dev_vpc" {
  type = string
}

#terraform plan -var "splunk=8089"
variable "splunk" {
  default = "8088"
}