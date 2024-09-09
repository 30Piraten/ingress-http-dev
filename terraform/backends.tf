terraform {
  backend "gcs" {
    bucket = "gcterraform-tf-state"
    prefix = "gke-cluster-dev"
  }
}