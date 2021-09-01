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

resource "proxmox_vm_qemu" "k3s-01" {
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
  #sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsoLxieSZOhe/oNbgtjskR00f0Rfq+FXFg9jh31TrvbKHg+uQuFeZsuY3TfuPX6ZJS/5JbKh3JzyMEo7gps26SHLsIvs56hkcKoxMosgxMTbBffJMOWU2uI0meSHxrgUy/LMiq/fUjAU3X+looZaisXQibM643D3La74HZgE1WM/tSroN74uZy3TJPvwrr+Ra9KaCkMvCqLvmFX6VEhvlnIW2PG+EW0NUI0grGS7HnRXylavMy1QWDAn3k8x1/NnGp1l+gN39OC7XxIgTW4Ps1DJ5g896cJW0JML6YBI44aZgZebeeecSiSgAvPKbUbbG4scZcLlXj8esLNJ81IBOdjxvRuG7VURfnlnBGVO6PJcIStrjxVXK47c48fHaf+3Pg7kWzCx+hnk/o21MuGE4XdN3pZj7IM3mZ4+Nd3+vPgJkfpFvm4zIeJGQL4PAw8Dld6XYjySjI5QSPiSprkVLTk/cwLiPNoPcPqVCkWRr6mJoY2YYnyyCJEHGNszrqCTE= loeken@0x00f\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOl6y1OhYg28Og/9VjCkAu35GEw7uA5Xw2l6pReFSvYWBC/1al8cKPxB+7a5QCh6rNkUjc2M2ihNAu72cD0+XxihpD7Bqla5iLjtbAH5Dk4gCgdy5zfHpGN74TNcMUarCa0D0udoIdSuXtjfPhZeZ816YwUN3Wkef6zyOGsa9m/3U6feii/vYrJkm7pvN9bNQdwv29urwfDNayFfBuWGXr1XLwzjWlHvjulr+QT6EvH6Cq85rzg5RQ9OCw1jcoh/DJt3rLko9iA51C9cA0z6v7bWwhcir4fSL6EGwf5j2Ji2LzrOHq8ybMejkHF1gl4gNyx25SepPz5t9gNirnnf9+JAAcAXrGaRSXT1Xff1pTapVmCcEDcBtYYOmfdjP3oVP8cXFE1l27r9fUjg+RzAbIMcIUl9R4vogFKkXJ6laMslxl3wbyo6IX3X8nj639qUDUQSCddDsNcd28k4y/CcJOtbExLdsCFHz8YW9qBr8jozY5u8/GVPkjR5WYbDinL00= loeken"
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
resource "proxmox_vm_qemu" "k3s-02" {
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
  #sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsoLxieSZOhe/oNbgtjskR00f0Rfq+FXFg9jh31TrvbKHg+uQuFeZsuY3TfuPX6ZJS/5JbKh3JzyMEo7gps26SHLsIvs56hkcKoxMosgxMTbBffJMOWU2uI0meSHxrgUy/LMiq/fUjAU3X+looZaisXQibM643D3La74HZgE1WM/tSroN74uZy3TJPvwrr+Ra9KaCkMvCqLvmFX6VEhvlnIW2PG+EW0NUI0grGS7HnRXylavMy1QWDAn3k8x1/NnGp1l+gN39OC7XxIgTW4Ps1DJ5g896cJW0JML6YBI44aZgZebeeecSiSgAvPKbUbbG4scZcLlXj8esLNJ81IBOdjxvRuG7VURfnlnBGVO6PJcIStrjxVXK47c48fHaf+3Pg7kWzCx+hnk/o21MuGE4XdN3pZj7IM3mZ4+Nd3+vPgJkfpFvm4zIeJGQL4PAw8Dld6XYjySjI5QSPiSprkVLTk/cwLiPNoPcPqVCkWRr6mJoY2YYnyyCJEHGNszrqCTE= loeken@0x00f\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOl6y1OhYg28Og/9VjCkAu35GEw7uA5Xw2l6pReFSvYWBC/1al8cKPxB+7a5QCh6rNkUjc2M2ihNAu72cD0+XxihpD7Bqla5iLjtbAH5Dk4gCgdy5zfHpGN74TNcMUarCa0D0udoIdSuXtjfPhZeZ816YwUN3Wkef6zyOGsa9m/3U6feii/vYrJkm7pvN9bNQdwv29urwfDNayFfBuWGXr1XLwzjWlHvjulr+QT6EvH6Cq85rzg5RQ9OCw1jcoh/DJt3rLko9iA51C9cA0z6v7bWwhcir4fSL6EGwf5j2Ji2LzrOHq8ybMejkHF1gl4gNyx25SepPz5t9gNirnnf9+JAAcAXrGaRSXT1Xff1pTapVmCcEDcBtYYOmfdjP3oVP8cXFE1l27r9fUjg+RzAbIMcIUl9R4vogFKkXJ6laMslxl3wbyo6IX3X8nj639qUDUQSCddDsNcd28k4y/CcJOtbExLdsCFHz8YW9qBr8jozY5u8/GVPkjR5WYbDinL00= loeken"
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
resource "proxmox_vm_qemu" "k3s-03" {
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
  #sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsoLxieSZOhe/oNbgtjskR00f0Rfq+FXFg9jh31TrvbKHg+uQuFeZsuY3TfuPX6ZJS/5JbKh3JzyMEo7gps26SHLsIvs56hkcKoxMosgxMTbBffJMOWU2uI0meSHxrgUy/LMiq/fUjAU3X+looZaisXQibM643D3La74HZgE1WM/tSroN74uZy3TJPvwrr+Ra9KaCkMvCqLvmFX6VEhvlnIW2PG+EW0NUI0grGS7HnRXylavMy1QWDAn3k8x1/NnGp1l+gN39OC7XxIgTW4Ps1DJ5g896cJW0JML6YBI44aZgZebeeecSiSgAvPKbUbbG4scZcLlXj8esLNJ81IBOdjxvRuG7VURfnlnBGVO6PJcIStrjxVXK47c48fHaf+3Pg7kWzCx+hnk/o21MuGE4XdN3pZj7IM3mZ4+Nd3+vPgJkfpFvm4zIeJGQL4PAw8Dld6XYjySjI5QSPiSprkVLTk/cwLiPNoPcPqVCkWRr6mJoY2YYnyyCJEHGNszrqCTE= loeken@0x00f\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOl6y1OhYg28Og/9VjCkAu35GEw7uA5Xw2l6pReFSvYWBC/1al8cKPxB+7a5QCh6rNkUjc2M2ihNAu72cD0+XxihpD7Bqla5iLjtbAH5Dk4gCgdy5zfHpGN74TNcMUarCa0D0udoIdSuXtjfPhZeZ816YwUN3Wkef6zyOGsa9m/3U6feii/vYrJkm7pvN9bNQdwv29urwfDNayFfBuWGXr1XLwzjWlHvjulr+QT6EvH6Cq85rzg5RQ9OCw1jcoh/DJt3rLko9iA51C9cA0z6v7bWwhcir4fSL6EGwf5j2Ji2LzrOHq8ybMejkHF1gl4gNyx25SepPz5t9gNirnnf9+JAAcAXrGaRSXT1Xff1pTapVmCcEDcBtYYOmfdjP3oVP8cXFE1l27r9fUjg+RzAbIMcIUl9R4vogFKkXJ6laMslxl3wbyo6IX3X8nj639qUDUQSCddDsNcd28k4y/CcJOtbExLdsCFHz8YW9qBr8jozY5u8/GVPkjR5WYbDinL00= loeken"
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
