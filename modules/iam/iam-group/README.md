## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | ~> 2.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | ~> 2.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scaleway_iam_group.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/iam_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_ids"></a> [application\_ids](#input\_application\_ids) | (Optional) The list of IDs of the applications attached to the group. | `list(string)` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the iam group. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the iam group. | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | (Defaults to provider organization\_id) The ID of the organization the group is associated with. | `string` | n/a | yes |
| <a name="input_user_ids"></a> [user\_ids](#input\_user\_ids) | (Optional) The list of IDs of the users attached to the group. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
