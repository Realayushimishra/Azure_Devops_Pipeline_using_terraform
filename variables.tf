# This file contains the variable definitions

## Project
variable "project_name" {
  type    = string
  default = "terraform pipelines"
}

variable "project" {
  type    = string
  description = "Name of the project"
}

variable "project_description" {
  type    = string
  default = "Terraform project"
}

variable "visibility" {
  type    = string
}

variable "version_control" {
  type    = string
}

variable "work_item_template" {
  type    = string
}

variable "project_github_service_endpoint_name" {
  type    = string
  default = "github"
}

variable "project_github_service_endpoint_description" {
  type    = string
  default = "Github Service Connection"
}

## Pipeline
variable "build_branch" {
  type = string
  default = "main"
}

variable "build_definition_name" {
  type    = string
  default = "sample-pipeline-build-definition"
}

variable "github_org_name" {
  type    = string
}

variable "github_repo_name" {
  type    = string
}

variable "project_build_yml_dir_path" {
  type    = string
}

variable "github_personal_access_token" {
  type        = string
  description = "Github Org Personal Access Token"
}

## Azure DevOps
variable "devops_org_service_url" {
  type = string
}

variable "devops_personal_access_token" {
  type = string
}