resource "scaleway_account_project" "project" {
  name = "${var.project_name}" #
  description = "My Project name"
}