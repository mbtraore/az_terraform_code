data "azurerm_resource_group" "mdl_resource_group" {
  name = var.mdl_resource_group.name
}

resource "azurerm_route_table" "mdl_route_table" {
  name = var.mdl_route_table.name
  resource_group_name = data.azurerm_resource_group.mdl_resource_group.name
  location = data.azurerm_resource_group.mdl_resource_group.location
  bgp_route_propagation_enabled = var.mdl_route_table.bgp_route_propagation_enabled 
}