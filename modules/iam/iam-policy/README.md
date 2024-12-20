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
| [scaleway_iam_policy.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | ID of the Application the policy will be linked to | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the policy | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | ID of the Group the policy will be linked to | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the policy | `string` | n/a | yes |
| <a name="input_no_principal"></a> [no\_principal](#input\_no\_principal) | If the policy doesn't apply to a principal. | `bool` | `null` | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | (Defaults to provider organization\_id) The ID of the organization the policy is associated with. | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | Rules of the policy | `any` | `null` | no |
| <a name="input_user_id"></a> [user\_id](#input\_user\_id) | ID of the User the policy will be linked to | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The creation date of the policy. |
| <a name="output_editable"></a> [editable](#output\_editable) | Whether the policy is editable. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the policy. |
| <a name="output_updated_at"></a> [updated\_at](#output\_updated\_at) | The last update date of the policy. |
