provider "google" {}

terraform {
  backend "gcs" {
    bucket = "project-a"
    prefix = "trigger/project-a/state"
  }
}

module "trigger_project-a" {
  source     = "git@github.com:PRAVALER/terraform-mod-sidecar-trigger.git?ref=v2.0.0"
  project    = "stage"
  repository = "project-a"
  triggers = [
    { kind = "stage", description = "project-a - Cópia de Produção", branch = "main" },
    { kind = "dev", description = "project-a - Ambientes dinâmicos cicd/*" }
  ]
}