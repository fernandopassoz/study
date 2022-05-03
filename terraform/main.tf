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


resource "libvirt_volume" "base-volume-1" {
  name   = "ubuntu-volume-1.qcow2"
  pool   = libvirt_pool.ubuntu.name
  # source = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  source = var.volume-source-local
  format = "qcow2"
}

resource "libvirt_volume" "volume-1" {
  name = "volume-1"
  pool = libvirt_pool.ubuntu.name
  base_volume_id = libvirt_volume.base-volume-1.id
  size = var.volume-size
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

resource "libvirt_domain" "kube-1" {
  name   = "kube-1"
  memory = "1024"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    #network_id = libvirt_network.kube-net.id
    network_name = var.network-name
    mac      = "00:11:22:AA:BB:01"
    hostname = "kube-1"
  }
  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }
  disk {
    volume_id = libvirt_volume.volume-1.id
  }
  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
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