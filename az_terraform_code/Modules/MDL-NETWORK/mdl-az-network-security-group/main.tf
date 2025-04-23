data "azurerm_resource_group" "mdl_resource_group" {
  name =  var.var_resource_group.name
}

resource "azurerm_network_security_group" "mdl_network_security_group" {
  name = var.var_network_security_group.name
  resource_group_name = data.azurerm_resource_group.mdl_resource_group.resource_group_name
  location = data.azurerm_resource_group.mdl_resource_group.location
  security_rule = var.var_network_security_group.security_rule
}