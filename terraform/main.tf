resource "google_compute_instance" "stockchatbot" {
  name         = "stockchatbot-host"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }

  metadata_startup_script = file("startup-script.sh") # startup-script which pulls and runs the application on a container during startup

  tags = ["stockchatbot"] # Added tags to be used by firewall rules
}

resource "google_compute_firewall" "stockchatbot_firewall" {
  name    = "stockchatbot-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["5000", "443", "3389", "22"] # Added port 5000 for your app
  }

  source_ranges = ["0.0.0.0/0"] # Open to all IP addresses, ensure this is required

  target_tags = ["stockchatbot"] # Ensures firewall rules apply to this instance
}
