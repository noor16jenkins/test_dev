Rg = {
  Rg1 = {
    name     = "kalu"
    location = "centralIndia"

  }
  Rg2 = {
    name     = "pila"
    location = "westindia"
  }
}
vnets = {
  VN1 = {
    name                = "Frontend_vnet"
    location            = "westIndia"
    resource_group_name = "kalu"
    address_space       = ["10.0.0.0/16"]

  }

}

subnets = {
  SN1 = {
    name                 = "frontend_subnet"
    resource_group_name  = "Kalu"
    virtual_network_name = "Frontend_vnet"
    address_prefixes     = ["10.0.0.0/24"]
  }

  SN2 = {
    name                 = "backend_subnet"
    resource_group_name  = "Kalu"
    virtual_network_name = "Frontend_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

}

pip = {
    pip1 ={
        name = "frontend-pip"
        resource_group_name ="kalu"
        location = "westindia"

    }

    pip2 ={
        name ="backend-pip"
        resource_group_name ="kalu"
        location ="westindia"

    }
}

NIC_VM = {
  vm1 = {
    nic_name             = "frontend_nic"
    location             = "westindia"
    rg_name              = "kalu"
    virtual_network_name = "Frontend_vnet"
    subnet_name          = "frontend_subnet"
    vm_name              = "frontend_vm"
    vm_size              = "Standard_D4_V5"
    username             = "devops"
    password             = "India@123"
    pip_name             = "frontend-pip"
  }
  vm2 = {
    nic_name             = "backend_nic"
    location             = "westindia"
    rg_name              = "kalu"
    virtual_network_name = "Frontend_vnet"
    subnet_name          = "backend_subnet"
    vm_name              = "backend_vm"
    vm_size              = "Standard_D4_V5"
    username             = "devops"
    password             = "India@123"
    pip_name             = "backend-pip"
  }
}