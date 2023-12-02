variable "tags" {
  type        = map(string)
  description = "Valores de los tags para los recursos"
}

variable "proyecto" {
  type        = string
  description = "Nombre del proyecto a implementar"
}