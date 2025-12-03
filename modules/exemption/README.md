<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~>2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | ~>2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.policy_exemption](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_policy_assignment_id"></a> [policy\_assignment\_id](#input\_policy\_assignment\_id) | n/a | `string` | n/a | yes |
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | n/a | `string` | n/a | yes |
| <a name="input_assignment_scope_validation"></a> [assignment\_scope\_validation](#input\_assignment\_scope\_validation) | n/a | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | n/a | `string` | `null` | no |
| <a name="input_exemption_category"></a> [exemption\_category](#input\_exemption\_category) | n/a | `string` | `"Waiver"` | no |
| <a name="input_expires_on"></a> [expires\_on](#input\_expires\_on) | n/a | `string` | `null` | no |
| <a name="input_policy_definition_reference_ids"></a> [policy\_definition\_reference\_ids](#input\_policy\_definition\_reference\_ids) | n/a | `list(string)` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->