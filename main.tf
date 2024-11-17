
provider "azurerm" {
  features {}
  subscription_id = "4ba76d32-050c-4410-82fc-98b41b0b8e9a"
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "myrg-group"
  location = "westus2"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myAKSCluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "myaks"

   default_node_pool {
    name       = "default"
    node_count = 4
    vm_size    = "Standard_B2ms"
  }

  identity {
    type = "SystemAssigned"
  }
}
