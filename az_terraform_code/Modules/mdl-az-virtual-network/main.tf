data "azurerm_resource_group" "mdl_resource_group" {
  name =  var.var_resource_group.name
}

resource "azurerm_virtual_network" "mdl_virtual_network" {
    name = var.var_virtual_network.name
    resource_group_name = data.azurerm_resource_group.mdl_resource_group.resource_group_name
    location = data.azurerm_resource_group.mdl_resource_group.location
    address_space = var.var_virtual_network.address_space
    dns_servers = var.var_virtual_network.dns_servers

}