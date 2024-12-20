terraform {
  required_version = ">= 1.4"
  required_providers {
    cloudns = {
      source = "mangadex-pub/cloudns"
      version = "0.2.0"
    }
  }
}

provider "cloudns" {
  auth_id = var.CLOUDNS_AUTH_ID
  sub_auth_id = var.CLOUDNS_SUB_AUTH_ID
  password    = var.CLOUDNS_PASSWORD
}

variable "CLOUDNS_AUTH_ID" {
  type = string
  default = null
}

variable "CLOUDNS_SUB_AUTH_ID" {
  type = string
  default = null
}

variable "CLOUDNS_PASSWORD" {
  type = string
}