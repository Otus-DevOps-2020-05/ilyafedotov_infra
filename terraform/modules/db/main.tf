resource "yandex_compute_instance" "db" {
  name = "reddit-db"
  labels = {
    tags = "reddit-db"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    private_key = file(var.private_key_path)
  }

  
//  provisioner "file" {
//    source      = "../modules/db/files/install_mongodb.sh"
//    destination = "/tmp/install_mongodb.sh"
//  }
//
//  provisioner "remote-exec" {
//    inline = [
//      "export LC_ALL=C",
//      "chmod +x /tmp/install_mongodb.sh",
//      "/tmp/install_mongodb.sh",
//    ]
//    
//}
}
