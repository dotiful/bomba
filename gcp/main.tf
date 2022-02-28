terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.20.0"
    }
  }
}

provider "google" {
  credentials = file("key.json")

  project  = var.PROJECT
  region  = var.REGION
  zone    = var.ZONE
}

provider "google-beta" {
  credentials = file("key.json")

  project  = var.PROJECT
  region  = var.REGION
  zone    = var.ZONE
}

resource "google_compute_network" "default" {
  name                    = "terraform-autoscale"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "default" {
  name                     = "terraform-autoscale"
  ip_cidr_range            = "10.127.0.0/20"
  network                  = "${google_compute_network.default.self_link}"
  region                   = var.REGION
  private_ip_google_access = true
}

resource "google_compute_instance_template" "default" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  can_ip_forward = false

  disk {
    source_image = data.google_compute_image.debian_11.id
  }

  network_interface {
    subnetwork = google_compute_subnetwork.default.name
  }

  scheduling {
    automatic_restart = false
    preemptible = true
  }

  metadata_startup_script = file("${path.module}/provision.sh")
}

resource "google_compute_autoscaler" "default" {
  provider = google-beta

  name   = "my-autoscaler"
  zone   = var.ZONE
  target = google_compute_instance_group_manager.default.id

  autoscaling_policy {
    max_replicas    = var.COUNT
    min_replicas    = var.COUNT
    cooldown_period = 60
  }
}

resource "google_compute_target_pool" "default" {
  provider = google-beta

  name = "my-target-pool"
}

resource "google_compute_instance_group_manager" "default" {
  provider = google-beta

  name = "my-igm"
  zone = var.ZONE

  version {
    instance_template = google_compute_instance_template.default.id
    name              = "primary"
  }

  target_pools       = [google_compute_target_pool.default.id]
  base_instance_name = "autoscaler-sample"
}

data "google_compute_image" "debian_11" {
  provider = google-beta

  family  = "debian-11"
  project = "debian-cloud"
}

variable "PROJECT" {
  type = string
}

variable "REGION" {
  type = string
  default = "us-central1"
}

variable "ZONE" {
  type = string
  default = "us-central1-c"
}

variable "COUNT" {
  type = number
  default = 3
}