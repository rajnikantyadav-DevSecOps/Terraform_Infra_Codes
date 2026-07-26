module "azurerm_resource_group" {
  source = "../../Modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "azurerm_virtual_network" {
  source     = "../../Modules/azurerm_virtual_network"
  vnets      = var.vnets
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_subnet" {
  source     = "../../Modules/azurerm_subnet"
  snets      = var.snets
  depends_on = [module.azurerm_virtual_network]
}

module "azurerm_public_ip" {
  source     = "../../Modules/azurerm_public_ip"
  pips       = var.pips
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_network_interface" {
  source     = "../../Modules/azurerm_network_interface"
  nics       = var.nics
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
}

module "azurerm_linux_virtual_machine" {
  source     = "../../Modules/azurerm_virtual_machines"
  vms        = var.vms
  depends_on = [module.azurerm_subnet, module.azurerm_network_interface]
}

