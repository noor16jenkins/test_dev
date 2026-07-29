variable "Rg" {}
variable "vnets" {}
variable "subnets" {}
variable "NIC_VM" {}
variable "pip" {
  
}
module "resource_group" {
  source = "../../Module/01_azurerm_resource_block"
  Rg     = var.Rg
}

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source = "../../Module/02_azurerm_virtual_network"
  vnets  = var.vnets
}

module "subnets" {
  depends_on = [ module.virtual_network ]
  source  = "../../Module/03_azurerm_subnet_netowork"
  subnets = var.subnets
}
module "pubilcip" {
  depends_on = [ module.resource_group ]
  source = "../../Module/04_azurerm_public_IP"
  pip =var.pip

  
}
module "vm" {
  depends_on = [ module.subnets ]
  source = "../../Module/05_azurerm_VM"
  NIC_VM = var.NIC_VM
}