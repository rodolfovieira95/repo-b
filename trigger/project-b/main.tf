provider "google" {}

terraform {
  backend "gcs" {
    bucket = "project-b"
    prefix = "trigger/project-b/state"
  }
}

module "trigger_project-b" {
  source     = "git@github.com:PRAVALER/terraform-mod-sidecar-trigger.git?ref=v2.0.0"
  project    = "stage"
  repository = "project-b"
  triggers = [
    { kind = "stage", description = "project-b - Cópia de Produção", branch = "main" },
    { kind = "dev", description = "project-b - Ambientes dinâmicos cicd/*" }
  ]
}