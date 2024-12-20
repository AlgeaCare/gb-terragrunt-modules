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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application"></a> [application](#module\_application) | github.com/particuleio/terraform-scaleway-iam//modules/iam-application | n/a |
| <a name="module_policy"></a> [policy](#module\_policy) | github.com/particuleio/terraform-scaleway-iam//modules/iam-policy | n/a |

## Resources

| Name | Type |
|------|------|
| [scaleway_account_project.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/account_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Application to be created alongside the Project | `map(any)` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) The description of the Project. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) The name of the Project. | `string` | `null` | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | (Defaults to provider organization\_id) The ID of the organization the project is associated with. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | Policy to be created associating the Application and the Project | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | n/a |
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
| <a name="output_updated_at"></a> [updated\_at](#output\_updated\_at) | n/a |
