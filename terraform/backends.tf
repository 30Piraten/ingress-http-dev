terraform {
  backend "gcs" {
    bucket = "<storage bucket here>"
    prefix = "gke-cluster-dev"
  }
}
