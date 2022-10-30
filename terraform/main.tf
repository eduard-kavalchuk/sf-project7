terraform {
  required_version = "~> 1.3.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.80.0"
    }
  }
}

provider "yandex" {
  token              = var.token
  cloud_id           = var.cloud_id
  folder_id          = var.folder_id
  zone               = "ru-central1-a"
  storage_access_key = var.storage_access_key
  storage_secret_key = var.storage_secret_key
}

resource "yandex_vpc_network" "vpc_network" {}

resource "yandex_vpc_subnet" "default_subnet" {
  name           = "default subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

module "vm" {
  zone               = yandex_vpc_subnet.default_subnet.zone
  source             = "./instances"
  vm_image           = "fd8kb72eo1r5fs97a1ki"
  subnet_id          = yandex_vpc_subnet.default_subnet.id
  service_account_id = var.service_account_id
}
