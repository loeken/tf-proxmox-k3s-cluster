terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}
provider "proxmox" {
  pm_api_url = "https://homeserver:8006/api2/json"
  pm_password = "demotime"
  pm_user = "root@pam"
  pm_tls_insecure = "true"
} 

resource "proxmox_vm_qemu" "k3s-master-01" {
  agent = 1
  count = 1
  name = "k3s-01"
  target_node = "homeserver"
  clone = "template"
  full_clone = true
  os_type = "cloud-init"
  vcpus = 1
  memory = 4096
  scsihw            = "virtio-scsi-pci"
  ipconfig0 = "ip=dhcp"
  #sshkeys = ""
  ciuser = "debian"
  disk {
    type            = "virtio"
    storage = "local"
    size = "50G"
  }
  lifecycle {
     ignore_changes = [
       network
     ]
  }
}
resource "proxmox_vm_qemu" "k3s-master-02" {
  agent = 1
  count = 1
  name = "k3s-02"
  target_node = "homeserver"
  clone = "template"
  full_clone = true
  os_type = "cloud-init"
  vcpus = 1
  memory = 4096
  scsihw            = "virtio-scsi-pci"
  ipconfig0 = "ip=dhcp"
  #sshkeys = ""
  ciuser = "debian"
  disk {
    type            = "virtio"
    storage = "local"
    size = "50G"
  }
  lifecycle {
     ignore_changes = [
       network
     ]
  }
}
resource "proxmox_vm_qemu" "k3s-master-03" {
  agent = 1
  count = 1
  name = "k3s-03"
  target_node = "homeserver"
  clone = "template"
  full_clone = true
  os_type = "cloud-init"
  vcpus = 1
  memory = 4096
  scsihw            = "virtio-scsi-pci"
  ipconfig0 = "ip=dhcp"
  #sshkeys = ""
  ciuser = "debian"
  disk {
    type            = "virtio"
    storage = "local"
    size = "50G"
  }
  lifecycle {
     ignore_changes = [
       network
     ]
  }
}
