terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_pool" "ubuntu" {
  name = "ubuntu-pool"
  type = "dir"
  path = "/home/fernando/Files/VMs/ubuntu-pool/"
}


data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}

data "template_file" "network_config" {
  template = file("${path.module}/network_config.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  pool           = libvirt_pool.ubuntu.name
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
}

#resource "libvirt_network" "kube-net" {
#  name      = "kube-net"
#  mode      = "none"
#  domain    = "kube.local"
#  addresses = ["10.20.30.0/24"]
#  dns {
#    enabled    = false
#    local_only = false
#
#  }
#  bridge    = "virbr0"
#  autostart = true
#  dhcp {
#    enabled = true
#  }
#}