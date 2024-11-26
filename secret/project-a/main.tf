provider "google" {}

terraform {
  backend "gcs" {
    bucket = "project-a-stage"
    prefix = "secrets/project-a/state"
  }
}

module "secrets_project_a_stage" {
  source = "git@github.com:PRAVALER/terraform-mod-sidecar-secret.git?ref=v0.0.3"
  project = "project-a-stage"

  secrets = [
    {
      name = "PROJECT_A_TOKEN"
    }
  ]
}