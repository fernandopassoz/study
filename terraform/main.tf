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

resource "libvirt_network" "kube-net" {
  name      = "kube-net"
  mode      = "none"
  domain    = "kube.local"
  addresses = ["10.20.30.0/24"]
  dns {
    enabled    = false
    local_only = false

  }
  bridge    = "virbr1"
  autostart = true
  dhcp {
    enabled = true
  }
}

resource "libvirt_volume" "volume-1" {
  name   = "ubuntu-volume-1.qcow2"
  pool   = libvirt_pool.ubuntu.name
  source = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  format = "qcow2"
}

#resource "libvirt_volume" "volume-2" {
#  name   = "ubuntu-volume-2.qcow2"
#  pool   = libvirt_pool.ubuntu.name
#  source = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64-disk-kvm.img"
#  format = "qcow2"
#}
#
#resource "libvirt_volume" "volume-3" {
#  name   = "ubuntu-volume-3.qcow2"
#  pool   = libvirt_pool.ubuntu.name
#  source = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64-disk-kvm.img"
#  format = "qcow2"
#}

#resource "libvirt_volume" "volume-4" {
#  name   = "ubuntu-volume-4.qcow2"
#  pool   = libvirt_pool.ubuntu.name
#  source = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64-disk-kvm.img"
#  format = "qcow2"
#}

# add cloudinit disk to pool
resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit.iso"
  pool      = libvirt_pool.ubuntu.name
  user_data = data.template_file.user_data.rendered
} # read the configuration

data "template_file" "user_data" {
  template = file("./cloud_init.cfg")
}

resource "libvirt_domain" "kube-1" {
  name   = "kube-1"
  memory = "1024"
  vcpu   = 1
  network_interface {
    network_id = libvirt_network.kube-net.id
    addresses  = ["10.20.30.10"]
    mac        = "AA:BB:CC:11:22:10"
    hostname   = "kube-1"
    # wait_for_lease = true
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

#resource "libvirt_domain" "kube-2" {
#  name   = "kube-2"
#  memory = "1024"
#  vcpu   = 1
#  network_interface {
#    network_name = "default"
#  }
#  console {
#    type        = "pty"
#    target_type = "serial"
#    target_port = "0"
#  }
#  disk {
#    volume_id = libvirt_volume.volume-2.id
#  }
#  graphics {
#    type        = "spice"
#    listen_type = "address"
#    autoport    = true
#  }
#}
#
#resource "libvirt_domain" "kube-3" {
#  name   = "kube-3"
#  memory = "1024"
#  vcpu   = 1
#  network_interface {
#    network_name = "default"
#  }
#  console {
#    type        = "pty"
#    target_type = "serial"
#    target_port = "0"
#  }
#  disk {
#    volume_id = libvirt_volume.volume-3.id
#  }
#  graphics {
#    type        = "spice"
#    listen_type = "address"
#    autoport    = true
#  }
#}
#
#resource "libvirt_domain" "kube-4" {
#  name   = "kube-4"
#  memory = "1024"
#  vcpu   = 1
#  network_interface {
#    network_name = "default"
#  }
#  console {
#    type        = "pty"
#    target_type = "serial"
#    target_port = "0"
#  }
#  disk {
#    volume_id = libvirt_volume.volume-4.id
#  }
#  graphics {
#    type        = "spice"
#    listen_type = "address"
#    autoport    = true
#  }
#}
