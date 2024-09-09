terraform {
  backend "gcs" {
    bucket = "<storage bucket here | create with GCP console or gcloud>"
    prefix = "update-with-your-prefix"
  }
}
