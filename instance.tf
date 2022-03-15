resource "google_compute_instance" "default" {
  name         = "instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = google_compute_network.default.name
    access_config {}
  }
  metadata_startup_script = file("script.sh")
  metadata = {
    ssh-keys = "username:${file("id_rsa.pub")}"
  }
}

output "ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}
