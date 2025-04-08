terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.50"
    }
  }
}

variable "hcloud_token" {
  description = "API token for Hetzner cloud"
  sensitive   = true
}

provider "hcloud" {
  token = var.hcloud_token
}
