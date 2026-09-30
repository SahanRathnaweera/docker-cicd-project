terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "gcp-pipeline-sahan"
  region  = "us-central1"
  zone    = "us-central1-a"
}


resource "google_compute_firewall" "web_firewall" {
  name    = "allow-web-traffic"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}


resource "google_compute_instance" "vm_instance" {
  name         = "gcp-cicd-vm"
  machine_type = "e2-micro" 
  zone         = "us-central1-a"

  tags = ["web-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts" # Linux Ubuntu 22.04 LTS OS එක
    }
  }

  network_interface {
    network = "default"
    access_config {
    
    }
  }


  metadata_startup_script = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker ubuntu
  EOF
}


output "public_ip" {
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
  description = "The public IP address of the GCP Compute Instance"
}