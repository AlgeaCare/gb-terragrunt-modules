terraform {
  required_version = ">= 1.4"
  required_providers {
    doppler = {
      source = "DopplerHQ/doppler"
      version = "1.2.0"
    }
}
}

provider "doppler" {
  doppler_token = var.DOPPLER_TOKEN
}

variable "DOPPLER_TOKEN" {
  type = string
  description = "A token to authenticate with Doppler"
}