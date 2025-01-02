variable "exemptions_for_resource_groups" {
  description = "All exemptions created on resource group level"
  default     = {}
  type = map(object({
    resource_group_id               = string
    exemption_name                  = string
    policy_assignment_id            = string
    reason                          = string
    exemption_category              = string
    expires_on                      = optional(string, null)
    policy_definition_reference_ids = optional(list(string), [])
  }))
}

variable "exemptions_for_subscriptions" {
  description = "All exemptions created on subscription level"
  default     = {}
  type = map(object({
    subscription_id                 = string
    exemption_name                  = string
    policy_assignment_id            = string
    reason                          = string
    exemption_category              = string
    expires_on                      = optional(string, null)
    policy_definition_reference_ids = optional(list(string), [])
  }))
}

variable "exemptions_for_each_subscription" {
  description = "All exemptions created on each subscription in a provided management group"
  default     = {}
  type = map(object({
    management_group_name           = string
    exemption_name                  = string
    policy_assignment_id_suffix     = string
    reason                          = string
    exemption_category              = string
    expires_on                      = optional(string, null)
    policy_definition_reference_ids = optional(list(string), [])
  }))
}

variable "exemptions_for_management_groups" {
  description = "All exemptions created on management group level"
  default     = {}
  type = map(object({
    management_group_id             = string
    exemption_name                  = string
    policy_assignment_id            = string
    reason                          = string
    exemption_category              = string
    expires_on                      = optional(string, null)
    policy_definition_reference_ids = optional(list(string), [])
  }))
}

variable "exemptions_for_resources" {
  description = "All exemptions created on resource level"
  default     = {}
  type = map(object({
    resource_id                     = string
    exemption_name                  = string
    policy_assignment_id            = string
    reason                          = string
    exemption_category              = string
    expires_on                      = optional(string, null)
    policy_definition_reference_ids = optional(list(string), [])
  }))
}