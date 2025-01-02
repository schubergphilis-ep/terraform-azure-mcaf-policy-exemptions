variable "name" {
  type = string
}

variable "resource_id" {
  type = string
}

variable "exemption_category" {
  type    = string
  default = "Waiver"
}

variable "policy_assignment_id" {
  type = string
}

variable "display_name" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "expires_on" {
  type    = string
  default = null
}

variable "policy_definition_reference_ids" {
  type    = list(string)
  default = null
}

variable "assignment_scope_validation" {
  default = null
  type    = string
}