
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}
# Configure the GitHub Provider
variable "github_token" {}

provider "github" {
  token = var.github_token
}
# Add a user to the organization
resource "github_repository" "example" {
  name        = "RepoTerraform"
  description = "Repositorio creado por terraform"

  visibility = "public"

  auto_init = true
}

#Toca usar depends_on para aegurarnos que la rama se cree solo cuando ya exista el repo
resource "github_branch" "first" {
  repository = "RepoTerraform"
  branch = "PrimeraRama"
  depends_on = [
    github_repository.example,
  ]
}

resource "github_branch" "second" {
  repository = "RepoTerraform"
  branch = "SegundaRama"
  depends_on = [
    github_repository.example,
  ]
}

resource "github_branch" "third" {
  repository = "RepoTerraform"
  branch = "TerceraRama"
  depends_on = [
    github_repository.example,
  ]
}
