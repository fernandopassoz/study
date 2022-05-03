variable "volume-size" {
    type = number
    default = 10 * 1024 * 1024 * 1024
}

variable "volume-source-local" {
    type = string
    default = "/home/fernando/Files/VMs/jammy-server-cloudimg-amd64.img"
}

variable "volume-source-remote" {
    type = string
    default = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

variable "network-name" {
    type = string
    default = "default"
}
  
