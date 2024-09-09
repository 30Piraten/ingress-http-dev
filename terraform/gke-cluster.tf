// create a service account for GKE
resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = var.display_name
}

// here we create IAM role to the service account
resource "google_project_iam_member" "container_admin" {
  project = var.project_id
  // roles/container.clusterAdmin for a less broader role
  // or opt for a broader roles/container.admin setup
  role    = "roles/container.admin" 
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

// define the GKE cluster 
resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.zone

  initial_node_count       = 2
  remove_default_node_pool = true
}

// define the GKE node pool
resource "google_container_node_pool" "gke-node" {
  name     = "gke-np"
  location = var.zone
  cluster  = google_container_cluster.gke_cluster.name

  # Autoscaling configuration
  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  # Node configuration
  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible     = true
    machine_type    = var.machine_type
    service_account = google_service_account.service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
