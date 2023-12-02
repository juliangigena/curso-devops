resource "azurerm_public_ip" "devops-publicip" {
  name                = "devops-pip-${var.proyecto}"
  resource_group_name = azurerm_resource_group.devops-rg.name
  location            = azurerm_resource_group.devops-rg.location
  allocation_method   = "Dynamic"
}


resource "azurerm_network_interface" "devops-networkinterface" {
  name                = "devops-nic-${var.proyecto}"
  location            = azurerm_resource_group.devops-rg.location
  resource_group_name = azurerm_resource_group.devops-rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.devops-subnet[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.devops-publicip.id
  }
}




resource "azurerm_linux_virtual_machine" "devops-virtualmachine" {
  name                  = "devops-vm-${var.proyecto}"
  location              = azurerm_resource_group.devops-rg.location
  resource_group_name   = azurerm_resource_group.devops-rg.name
  network_interface_ids = [azurerm_network_interface.devops-networkinterface.id]
  size                  = "Standard_B1s"
  admin_username        = "adminuser"


  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

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

  tags = local.tags
}