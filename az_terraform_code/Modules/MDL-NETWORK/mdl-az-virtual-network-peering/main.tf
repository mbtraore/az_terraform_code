data "azurerm_resource_group" "mdl_resource_group_target" {
  name = var.var_resource_group.name
}

data "azurerm_resource_group" "mdl_resource_group_source" {
  name = var.var_resource_group.name
}

data "azurerm_virtual_network" "mdl_virtual_network_target" {
  name = var.var_virtual_network_target.name
  resource_group_name = data.azurerm_resource_group.mdl_resource_group_target
}

data "azurerm_virtual_network" "mdl_virtual_network_source" {
  name = var.var_virtual_network_source.name
  resource_group_name = data.azurerm_resource_group.mdl_resource_group_source
}

resource "azurerm_virtual_network_peering" "mdl_virtual_network_peering_source_to_target" {
  name = "${var.var_virtual_network_source.name}-to-${var.var_virtual_network_target.name}"
  resource_group_name = data.azurerm_resource_group.mdl_resource_group_source.name
  virtual_network_name = data.azurerm_virtual_network.mdl_virtual_network_source
  remote_virtual_network_id = data.azurerm_virtual_network.mdl_virtual_network_target.id
}

resource "azurerm_virtual_network_peering" "mdl_virtual_network_peering_target_to_source" {
  name = "${var.var_virtual_network_target.name}-to-${var.var_virtual_network_source.name}"
  resource_group_name = data.azurerm_resource_group.mdl_resource_group_source.name
  virtual_network_name = data.azurerm_virtual_network.mdl_virtual_network_target
  remote_virtual_network_id = data.azurerm_virtual_network.mdl_virtual_network_source.id
}