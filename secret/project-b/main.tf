provider "google" {}

terraform {
  backend "gcs" {
    bucket = "project-b-stage"
    prefix = "secrets/project-b/state"
  }
}

module "secrets_project_b_stage" {
  source = "git@github.com:PRAVALER/terraform-mod-sidecar-secret.git?ref=v0.0.3"
  project = "project-b-stage"

  secrets = [
    {
      name = "PROJECT_B_TOKEN"
    }
  ]
}