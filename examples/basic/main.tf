terraform {
  required_version = ">= 1.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4"
    }
    azapi = {
      source  = "azure/azapi"
      version = "2.0.1"
    }
  }
}

module "policy_exemptions" {
  source                           = "../.."
  exemptions_for_resource_groups   = local.exemptions_for_resource_groups
  exemptions_for_subscriptions     = local.exemptions_for_subscriptions
  exemptions_for_each_subscription = local.exemptions_for_each_subscription
  exemptions_for_management_groups = local.exemptions_for_management_groups
  exemptions_for_resources         = local.exemptions_for_resources
}

locals {
  exemptions_for_resource_groups = {
    "example_exemption" = {
      resource_group_id    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rsg"
      exemption_name       = "Example Exemption Name"
      policy_assignment_id = "/providers/microsoft.management/managementgroups/example/providers/microsoft.authorization/policyassignments/exampleassignment"
      reason               = "Example Reason"
      exemption_category   = "Waiver"
      policy_definition_reference_ids = [
        "00000000-0000-0000-0000-000000000000"
      ]
    }
  }

  exemptions_for_subscriptions = {
    "example_exemption" = {
      subscription_id      = "/subscriptions/00000000-0000-0000-0000-000000000000"
      exemption_name       = "Example Exemption Name"
      policy_assignment_id = "/providers/microsoft.management/managementgroups/example/providers/microsoft.authorization/policyassignments/exampleassignment"
      reason               = "Example Reason"
      exemption_category   = "Waiver"
      policy_definition_reference_ids = [
        "00000000-0000-0000-0000-000000000000"
      ]
    }
  }

  exemptions_for_each_subscription = {
    "example_exemption" = {
      management_group_name       = "example-mg"
      exemption_name              = "Example Exemption Name"
      policy_assignment_id_suffix = "/providers/microsoft.authorization/policyassignments/securitycenterbuiltin"
      reason                      = "Example Reason"
      exemption_category          = "Waiver"
      policy_definition_reference_ids = [
        "00000000-0000-0000-0000-000000000000"
      ]
    }
  }

  exemptions_for_management_groups = {
    "example_exemption" = {
      management_group_id  = "/providers/microsoft.management/managementgroups/example-mg"
      exemption_name       = "Example Exemption Name"
      policy_assignment_id = "/providers/microsoft.management/managementgroups/example/providers/microsoft.authorization/policyassignments/exampleassignment"
      reason               = "Example Reason"
      exemption_category   = "Waiver"
      policy_definition_reference_ids = [
        "00000000-0000-0000-0000-000000000000"
      ]
    }
  }

  exemptions_for_resources = {
    "example_exemption" = {
      resource_id          = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rsg/providers/Microsoft.Storage/storageAccounts/examplestorageaccount"
      exemption_name       = "Example Exemption Name"
      policy_assignment_id = "/providers/microsoft.management/managementgroups/example/providers/microsoft.authorization/policyassignments/exampleassignment"
      reason               = "Example Reason"
      exemption_category   = "Waiver"
      policy_definition_reference_ids = [
        "00000000-0000-0000-0000-000000000000"
      ]
      assignment_scope_validation = "DoNotValidate"
    }
  }
}