provider "google" {}

terraform {
  backend "gcs" {
    bucket = "stage"
    prefix = "bucket/project-b/state"
  }
}

module "bucket_project_a_stage" {
    source = "git@github.com:PRAVALER/terraform-mod-sidecar-bucket.git?ref=v1.4.1"
    name                        = "project-b"
    project                     = "stage"
    public                      = true
    location                    = "us-east1"
    storage_class               = "STANDARD"
    uniform_bucket_level_access  = true
    main_page_suffix            = "index.html"
    not_found_page              = "404.html"

    labels = {
        tribe   = "engajamento"
        app     = "project-b"
  }
}