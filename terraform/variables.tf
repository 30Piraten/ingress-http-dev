variable "project_id" {
  type        = string
  description = "value of project"
}

variable "region" {
  type        = string
  description = "value of region"
}

variable "zone" {
  type        = string
  description = "value of zone"
}

variable "machine_type" {
  type        = string
  default     = "e2-medium"
  description = "value of machine_type"
}

variable "account_id" {
  type        = string
  default     = "gke-service-account"
  description = "value of account_id"
}

variable "display_name" {
  type        = string
  default     = "dev-service-account"
  description = "value of display_name"
}

variable "cluster_name" {
  type        = string
  default     = "dev-cluster"
  description = "value of cluster_name"
}