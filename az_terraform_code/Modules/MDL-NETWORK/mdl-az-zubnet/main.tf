data "azurerm_resource_group" "mdl_resource_group" {
  name =  var.var_resource_group.name
}

data "azurerm_virtual_network" "mdl_virtual_Network" {
  name = var.var_virtual_network.name
  resource_group_name = data.azurerm_resource_group.mdl_resource_group.name
}

resource "azurerm_subnet" "mdl_subnet" {
  name = var.var_subnet.name
  resource_group_name = data.azurerm_resource_group.mdl_resource_group.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.mdl_virtual_Network.virtual_network_name
  address_prefixes = var.var_subnet.address_prefixes
  service_endpoint_policy_ids = var.var_subnet.service_endpoints_ids
  service_endpoints = var.var_subnet.service_endpoints
}
