terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }
}

provider "azuredevops" {
  org_service_url       = var.devops_org_service_url
  personal_access_token = var.devops_personal_access_token
}

resource "azuredevops_project" "janethterraformproject" {
  name               = var.project
  description        = var.project_description
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.work_item_template
  features = {
      "boards" = "enabled"
      "repositories" = "enabled"
      "pipelines" = "enabled"
      "testplans" = "enabled"
      "artifacts" = "enabled"
  }
}

resource "azuredevops_serviceendpoint_github" "github_serviceendpoint" {
  project_id            = azuredevops_project.janethterraformproject.id
  service_endpoint_name = var.project_github_service_endpoint_name

  auth_personal {
    personal_access_token = var.github_personal_access_token
  }
}

resource "azuredevops_build_definition" "tf" {
  project_id          =  azuredevops_project.janethterraformproject.id
  name                =  var.build_definition_name
  ci_trigger {
    use_yaml  =   true
  }
  repository {
    repo_type             =   "GitHub"
    repo_id               =   join("/", [var.github_org_name, var.github_repo_name])
    branch_name           =   var.build_branch
    yml_path              =   var.project_build_yml_dir_path
    service_connection_id =   azuredevops_serviceendpoint_github.github_serviceendpoint.id
  }
}