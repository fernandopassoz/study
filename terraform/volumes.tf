resource "libvirt_volume" "base-volume-1" {
  name = "ubuntu-volume-1.qcow2"
  pool = libvirt_pool.ubuntu.name
  # source = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  source = var.volume-source-local
  format = "qcow2"
}

resource "libvirt_volume" "volume-1" {
  name           = "volume-1"
  pool           = libvirt_pool.ubuntu.name
  base_volume_id = libvirt_volume.base-volume-1.id
  size           = var.volume-size
}

resource "libvirt_volume" "base-volume-2" {
  name = "ubuntu-volume-2.qcow2"
  pool = libvirt_pool.ubuntu.name
  # source = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  source = var.volume-source-local
  format = "qcow2"
}

resource "libvirt_volume" "volume-2" {
  name           = "volume-2"
  pool           = libvirt_pool.ubuntu.name
  base_volume_id = libvirt_volume.base-volume-2.id
  size           = var.volume-size
}

resource "libvirt_volume" "base-volume-3" {
  name = "ubuntu-volume-3.qcow2"
  pool = libvirt_pool.ubuntu.name
  # source = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  source = var.volume-source-local
  format = "qcow2"
}

resource "libvirt_volume" "volume-3" {
  name           = "volume-3"
  pool           = libvirt_pool.ubuntu.name
  base_volume_id = libvirt_volume.base-volume-3.id
  size           = var.volume-size
}