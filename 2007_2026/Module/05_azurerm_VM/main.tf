
resource "azurerm_network_interface" "nic_vm" {
    for_each = var.NIC_VM
    name = each.value.nic_name
    location = each.value.location
    resource_group_name = each.value.rg_name

    ip_configuration {
      name = "internal"
      subnet_id = data.azurerm_subnet.subnet1[each.key].id
      private_ip_address_allocation ="Dynamic"
      public_ip_address_id = data.azurerm_public_ip.pip_frontend[each.key].id
    }
  
}

resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.NIC_VM
    name = each.value.vm_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    size = each.value.vm_size
    admin_username = each.value.username
    admin_password = each.value.password
    disable_password_authentication = false
    network_interface_ids = [azurerm_network_interface.nic_vm[each.key].id,]  # ye list hai jo [] iske ander hai


os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}