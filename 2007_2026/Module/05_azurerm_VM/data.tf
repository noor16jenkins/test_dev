data "azurerm_subnet" "subnet1" {
    for_each = var.NIC_VM
    name                    =each.value.subnet_name
    virtual_network_name    = each.value.virtual_network_name
    resource_group_name     = each.value.rg_name
  
}

data "azurerm_public_ip" "pip_frontend" {
    for_each = var.NIC_VM
    name    = each.value.pip_name
    resource_group_name = each.value.rg_name      
    }