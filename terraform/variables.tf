variable "application_name" {
  type        = string
  description = "The name of your application"
  default     = "demo-4276-7762-6039-2574"
}

variable "environment" {
  type        = string
  description = "The environment (dev, test, prod...)"
  default     = ""
}

variable "location" {
  type        = string
  description = "The Azure region where all resources in this example should be created"
  default     = "eastus"
}
