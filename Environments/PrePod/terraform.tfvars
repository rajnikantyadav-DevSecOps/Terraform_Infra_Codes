rgs = {
  rg1 = {
    name     = "rg1"
    location = "centralus"
  }

  rg2 = {
    name     = "rg2"
    location = "centralus"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet1"
    location            = "centralus"
    resource_group_name = "rg1"
    address_space       = ["10.0.0.0/16"]
  }
}

snets = {
  snet1 = {
    subnet_name          = "frontend-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    subnet_name          = "backend-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }

  snet3 = {
    subnet_name          = "database-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

pips = {
  pip1 = {
    pip_name            = "frontend-vm-pip"
    resource_group_name = "rg1"
    location            = "centralus"
    allocation_method   = "Static"
  }

  pip2 = {
    pip_name            = "backend-vm-pip"
    resource_group_name = "rg1"
    location            = "centralus"
    allocation_method   = "Static"
  }
}


nics = {
  nic1 = {
    nic_name             = "frontend-vm-nic"
    location             = "centralus"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    subnet_name          = "frontend-subnet"
    pip_name             = "frontend-vm-pip"
  }

  nic2 = {
    nic_name             = "backend-vm-nic"
    location             = "centralus"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    subnet_name          = "backend-subnet"
    pip_name             = "backend-vm-pip"
  }
}

vms = {
  vm1 = {
    subnet_name          = "frontend-subnet"
    pip_name             = "frontend-vm-pip"
    virtual_network_name = "vnet1"
    location             = "centralus"
    resource_group_name  = "rg1"
    vm_name              = "frontend-vm"
    admin_username       = "adminuser"
    admin_password       = "Admin@123"
    nic_name             = "frontend-vm-nic"
  }

  vm2 = {
    subnet_name          = "backend-subnet"
    pip_name             = "backend-vm-pip"
    virtual_network_name = "vnet1"
    location             = "centralus"
    resource_group_name  = "rg1"
    vm_name              = "backend-vm"
    admin_username       = "adminuser"
    admin_password       = "Admin@123"
    nic_name             = "backend-vm-nic"
  }
}