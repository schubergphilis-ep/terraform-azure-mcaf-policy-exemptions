locals {
  exemptions_for_each_subscription = { for item in flatten([
    for key, properties in var.exemptions_for_each_subscription : [
      for subscription_id in data.azurerm_management_group.this[key].all_subscription_ids : {
        key                             = key
        subscription_id                 = subscription_id
        exemption_name                  = properties.exemption_name
        policy_assignment_id_suffix     = properties.policy_assignment_id_suffix
        reason                          = properties.reason
        exemption_category              = properties.exemption_category
        expires_on                      = properties.expires_on
        policy_definition_reference_ids = properties.policy_definition_reference_ids
      }
    ]
  ]) : "${item.key}-${item.subscription_id}" => item }
}

data "azurerm_management_group" "this" {
  for_each     = var.exemptions_for_each_subscription
  display_name = each.value.management_group_name
}

module "rsg_exemptions" {
  for_each = var.exemptions_for_resource_groups

  source                          = "./modules/exemption"
  resource_id                     = each.value.resource_group_id
  name                            = each.value.exemption_name
  description                     = each.value.reason
  policy_assignment_id            = each.value.policy_assignment_id
  expires_on                      = each.value.expires_on
  policy_definition_reference_ids = each.value.policy_definition_reference_ids
  assignment_scope_validation     = try(each.value.assignment_scope_validation, null)
}

module "resource_exemptions" {
  for_each = var.exemptions_for_resources

  source                          = "./modules/exemption"
  resource_id                     = each.value.resource_id
  name                            = each.value.exemption_name
  description                     = each.value.reason
  policy_assignment_id            = each.value.policy_assignment_id
  expires_on                      = each.value.expires_on
  policy_definition_reference_ids = each.value.policy_definition_reference_ids
  assignment_scope_validation     = try(each.value.assignment_scope_validation, null)
}

module "mg_exemptions" {
  for_each = var.exemptions_for_management_groups

  source                          = "./modules/exemption"
  resource_id                     = each.value.management_group_id
  name                            = each.value.exemption_name
  description                     = each.value.reason
  policy_assignment_id            = each.value.policy_assignment_id
  expires_on                      = each.value.expires_on
  policy_definition_reference_ids = each.value.policy_definition_reference_ids
  assignment_scope_validation     = try(each.value.assignment_scope_validation, null)
}

module "all_sub_exemptions" {
  for_each = local.exemptions_for_each_subscription

  source                          = "./modules/exemption"
  resource_id                     = "/subscriptions/${each.value.subscription_id}"
  name                            = each.value.exemption_name
  description                     = each.value.reason
  policy_assignment_id            = "/subscriptions/${each.value.subscription_id}${each.value.policy_assignment_id_suffix}"
  expires_on                      = each.value.expires_on
  policy_definition_reference_ids = each.value.policy_definition_reference_ids
  assignment_scope_validation     = try(each.value.assignment_scope_validation, null)
}

module "sub_exemptions" {
  for_each = var.exemptions_for_subscriptions

  source                          = "./modules/exemption"
  resource_id                     = each.value.subscription_id
  name                            = each.value.exemption_name
  description                     = each.value.reason
  policy_assignment_id            = each.value.policy_assignment_id
  expires_on                      = each.value.expires_on
  policy_definition_reference_ids = each.value.policy_definition_reference_ids
  assignment_scope_validation     = try(each.value.assignment_scope_validation, null)
}