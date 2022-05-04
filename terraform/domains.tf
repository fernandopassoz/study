resource "libvirt_domain" "kube-1" {
  name   = "kube-1"
  memory = var.memory-size
  vcpu   = var.vcpus

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    #network_id = libvirt_network.kube-net.id
    network_name = var.network-name
    mac          = "00:11:22:AA:BB:01"
    hostname     = "kube-1"
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

resource "libvirt_domain" "kube-2" {
  name   = "kube-2"
  memory = var.memory-size
  vcpu   = var.vcpus

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    #network_id = libvirt_network.kube-net.id
    network_name = var.network-name
    mac          = "00:11:22:AA:BB:02"
    hostname     = "kube-2"
  }
  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }
  disk {
    volume_id = libvirt_volume.volume-2.id
  }
  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}

resource "libvirt_domain" "kube-3" {
  name   = "kube-3"
  memory = var.memory-size
  vcpu   = var.vcpus

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    #network_id = libvirt_network.kube-net.id
    network_name = var.network-name
    mac          = "00:11:22:AA:BB:03"
    hostname     = "kube-3"
  }
  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }
  disk {
    volume_id = libvirt_volume.volume-3.id
  }
  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}