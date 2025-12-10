# terraform-azure-mcaf-policy-exceptions
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_all_sub_exemptions"></a> [all\_sub\_exemptions](#module\_all\_sub\_exemptions) | ./modules/exemption | n/a |
| <a name="module_mg_exemptions"></a> [mg\_exemptions](#module\_mg\_exemptions) | ./modules/exemption | n/a |
| <a name="module_resource_exemptions"></a> [resource\_exemptions](#module\_resource\_exemptions) | ./modules/exemption | n/a |
| <a name="module_rsg_exemptions"></a> [rsg\_exemptions](#module\_rsg\_exemptions) | ./modules/exemption | n/a |
| <a name="module_sub_exemptions"></a> [sub\_exemptions](#module\_sub\_exemptions) | ./modules/exemption | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_management_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/management_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_exemptions_for_each_subscription"></a> [exemptions\_for\_each\_subscription](#input\_exemptions\_for\_each\_subscription) | All exemptions created on each subscription in a provided management group | <pre>map(object({<br/>    management_group_name           = string<br/>    exemption_name                  = string<br/>    policy_assignment_id_suffix     = string<br/>    reason                          = string<br/>    exemption_category              = optional(string, "waiver")<br/>    expires_on                      = optional(string, null)<br/>    policy_definition_reference_ids = optional(list(string), [])<br/>  }))</pre> | `{}` | no |
| <a name="input_exemptions_for_management_groups"></a> [exemptions\_for\_management\_groups](#input\_exemptions\_for\_management\_groups) | All exemptions created on management group level | <pre>map(object({<br/>    management_group_id             = string<br/>    exemption_name                  = string<br/>    policy_assignment_id            = string<br/>    reason                          = string<br/>    exemption_category              = optional(string, "waiver")<br/>    expires_on                      = optional(string, null)<br/>    policy_definition_reference_ids = optional(list(string), [])<br/>  }))</pre> | `{}` | no |
| <a name="input_exemptions_for_resource_groups"></a> [exemptions\_for\_resource\_groups](#input\_exemptions\_for\_resource\_groups) | All exemptions created on resource group level | <pre>map(object({<br/>    resource_group_id               = string<br/>    exemption_name                  = string<br/>    policy_assignment_id            = string<br/>    reason                          = string<br/>    exemption_category              = optional(string, "waiver")<br/>    expires_on                      = optional(string, null)<br/>    policy_definition_reference_ids = optional(list(string), [])<br/>  }))</pre> | `{}` | no |
| <a name="input_exemptions_for_resources"></a> [exemptions\_for\_resources](#input\_exemptions\_for\_resources) | All exemptions created on resource level | <pre>map(object({<br/>    resource_id                     = string<br/>    exemption_name                  = string<br/>    policy_assignment_id            = string<br/>    reason                          = string<br/>    exemption_category              = optional(string, "waiver")<br/>    expires_on                      = optional(string, null)<br/>    policy_definition_reference_ids = optional(list(string), [])<br/>  }))</pre> | `{}` | no |
| <a name="input_exemptions_for_subscriptions"></a> [exemptions\_for\_subscriptions](#input\_exemptions\_for\_subscriptions) | All exemptions created on subscription level | <pre>map(object({<br/>    subscription_id                 = string<br/>    exemption_name                  = string<br/>    policy_assignment_id            = string<br/>    reason                          = string<br/>    exemption_category              = optional(string, "waiver")<br/>    expires_on                      = optional(string, null)<br/>    policy_definition_reference_ids = optional(list(string), [])<br/>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->