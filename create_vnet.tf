# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.location
  
  tags = {
        environment = "Terraform Demo"
  }
}

# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name = var.vnet
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space = [var.address-space]

}

# Create Subnet0
resource "azurerm_subnet" "subnet0" {
  name = var.subnet0-name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = [var.subnet0-address]
}

# Create Subnet1
resource "azurerm_subnet" "subnet1" {
  name = var.subnet1-name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = [var.subnet1-address]
}

resource "azurerm_network_security_group" "subnet0" {
    name                = var.subnet0-name
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
        
        security_rule {
        name                       = "Web"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    
        security_rule {
        name                       = "SSH"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
}

resource "azurerm_subnet_network_security_group_association" "subnet0nsglink" {
    subnet_id = azurerm_subnet.subnet0.id
    network_security_group_id = azurerm_network_security_group.subnet0.id
    
}


resource "azurerm_network_security_group" "subnet1" {
    name                = var.subnet1-name
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
        
        security_rule {
        name                       = "AllowSQL"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "10.10.0.0/24"
        destination_address_prefix = "*"
    }
    
        security_rule {
        name                       = "SSH"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
}

resource "azurerm_subnet_network_security_group_association" "subnet1nsglink" {
    subnet_id = azurerm_subnet.subnet1.id
    network_security_group_id = azurerm_network_security_group.subnet1.id
    
}