variable "int_port" {
type = number
  default = 3000
  validation {
    condition     = var.int_port == 3000
    error_message = "The Grafana port must be set to 3000."
  }
}
variable "ext_port" {
 type = list(any)
  // sensitive = true

#   validation {
#     condition     = max(var.ext_port["Houston"]...) <= 65535 && min(var.ext_port["Houston"]...) >= 3100
#     error_message = "The external port must be in range 1980-65535."
#   }
#   validation {
#     condition     = max(var.ext_port["Kennedy"]...) <= 3001 && min(var.ext_port["Kennedy"]...) >= 3000
#     error_message = "The external port must be in range 1880-1980."
#   }
}