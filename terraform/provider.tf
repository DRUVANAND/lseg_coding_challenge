terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.58.0"
    }
  }
  backend "gcs" {
    bucket = "stockchatbot-backend-bucket"
    prefix = "my-backend"
  }
}

provider "google" {
  project     = "just-strength-435207-v9"
  region      = "us-central1"
  zone        = "us-central1-c"
}