terraform {
  source = "${include.root.locals.source_url}//modules/account-project?ref=${include.root.locals.source_version}"
}

include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

inputs = {
  project_name = "terraform-test"
}