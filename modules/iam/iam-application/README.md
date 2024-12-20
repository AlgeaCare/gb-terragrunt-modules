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
| [scaleway_iam_api_key.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/iam_api_key) | resource |
| [scaleway_iam_application.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/iam_application) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey_description"></a> [apikey\_description](#input\_apikey\_description) | Description of the API key to be created | `string` | `null` | no |
| <a name="input_apikey_expires_at"></a> [apikey\_expires\_at](#input\_apikey\_expires\_at) | (Optional) The date and time of the expiration of the iam api key. Please note that in case of change, the resource will be recreated. | `string` | `null` | no |
| <a name="input_create_apikey"></a> [create\_apikey](#input\_create\_apikey) | Whether an API key must be created for the application | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the iam application. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the iam application. | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | (Defaults to provider organization\_id) The ID of the organization the application is associated with. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | n/a |
| <a name="output_editable"></a> [editable](#output\_editable) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_updated_at"></a> [updated\_at](#output\_updated\_at) | n/a |
