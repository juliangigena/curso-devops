locals {
  location = "East US"

  tags = merge(
    {
      environment = "demo"
      cost_center = "0001"
      managed_by  = "terraform"
    },
    var.tags
  )

  address_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
}