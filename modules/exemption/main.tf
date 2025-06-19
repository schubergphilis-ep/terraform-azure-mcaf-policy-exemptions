resource "azapi_resource" "policy_exemption" {
  type      = "Microsoft.Authorization/policyExemptions@2022-07-01-preview"
  name      = var.name
  parent_id = var.resource_id

  body = {
    properties = {
      assignmentScopeValidation    = coalesce(var.assignment_scope_validation, "default")
      description                  = var.description
      displayName                  = var.display_name
      exemptionCategory            = var.exemption_category
      expiresOn                    = var.expires_on
      policyAssignmentId           = var.policy_assignment_id
      policyDefinitionReferenceIds = var.policy_definition_reference_ids

      metadata = {
        "CreatedBy" : "Terraform"
      }
    }
  }
}
