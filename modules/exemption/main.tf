resource "azapi_resource" "policy_exemption" {
  type      = "Microsoft.Authorization/policyExemptions@2022-07-01-preview"
  name      = var.name
  parent_id = var.resource_id

  body = local.policy_exemption_body
}
