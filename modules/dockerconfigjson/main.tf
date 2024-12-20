locals {
  container_registry_password_user_base64 = base64encode("${var.container_registry_username}:${var.container_registry_password}")
  configjson = <<EOF
    {
        "auths": {
            "${var.container_registry_endpoint}": {
                "auth": "${local.container_registry_password_user_base64}"
            }
        }
    }
    EOF
}


