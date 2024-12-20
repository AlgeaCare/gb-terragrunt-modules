output "dockerconfigjson" {
  value = local.configjson
  description = "full constructed .dockerconfigjson"
  #sensitive = true
}