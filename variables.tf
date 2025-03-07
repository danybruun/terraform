# Define a normal variable (e.g., an environment variable)
variable "environment" {
  description = "A normal environment variable passed from GitHub Actions"
  type        = string
}

# Define a secret variable
variable "subscription_id" {
  description = "A secret variable passed from GitHub Actions"
  type        = string
  sensitive   = true
}
