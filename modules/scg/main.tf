resource "scaleway_instance_security_group" "this" {
  for_each = local.security_groups

  name = try(each.value.name, each.key)
  description = try(each.value.description, each.value.name)
  inbound_default_policy  = lookup(each.value, "inbound_default_policy", "drop") # accept# By default we drop incoming traffic that do not match any inbound_rule.
  outbound_default_policy = lookup(each.value, "outbound_default_policy", "drop") # accept # By default we drop outgoing traffic that do not match any outbound_rule.
  stateful = lookup(each.value, "stateful", true)
  enable_default_security = lookup(each.value, "enable_default_security", true)
  zone                    = lookup(each.value, "sc_zone", null)
  project_id              = lookup(each.value, "project_id", null)

  dynamic "inbound_rule" {
    for_each = lookup(each.value, "inbound_acls", [])
    content {
      action        = inbound_rule.value["action"]
      ip            = try(inbound_rule.value["ip"], null)
      ip_range      = try(inbound_rule.value["ip_range"], null)
      port          = try(inbound_rule.value["port"], null)
      port_range    = try(inbound_rule.value["port_range"], null)
      protocol      = inbound_rule.value["protocol"]
    }
  }

  dynamic "outbound_rule" {
    for_each = lookup(each.value, "outbound_acls", [])
    content {
      action        = outbound_rule.value["action"]
      ip            = try(outbound_rule.value["ip"], null)
      ip_range      = try(outbound_rule.value["ip_range"], null)
      port          = try(outbound_rule.value["port"], null)
      port_range    = try(outbound_rule.value["port_range"], null)
      protocol      = outbound_rule.value["protocol"]
    }
  }
}