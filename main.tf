provider "google" {
 credentials = "${file("james-app-dev-a54b31ddc341.json")}"
 project     = "james-app-dev"
 region      = "us-east1"
}

resource "google_container_cluster" "gcp_kubernetes" {
    name               = "${var.cluster_name}"
    zone               = "us-east1-b"
    initial_node_count = 1
    additional_zones = [
        "us-east1-c",
        "us-east1-d",
    ]
    master_auth {
        username = "${var.linux_admin_username}"
        password = "${var.linux_admin_password}}"
    }
    node_config {
        oauth_scopes = [
          "https://www.googleapis.com/auth/compute",
          "https://www.googleapis.com/auth/devstorage.read_only",
          "https://www.googleapis.com/auth/logging.write",
          "https://www.googleapis.com/auth/monitoring",
        ]
        labels {
            this-is-for = "dev-cluster"
        }
        tags = ["dev", "work"]
    }
}