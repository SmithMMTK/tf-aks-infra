variable location {
    default = "southeastasia"
}

variable "login" {
    default = "azureuser"
}

variable "rg" {
    default = "az-tf-aks-infra"  
}
variable "vnet" {
    default = "vnet-tflz"
}

variable "address-space" {
    default = "10.10.0.0/16"
}

variable "subnet0-name" {
    default = "workload"
}
variable "subnet0-address" {
    default = "10.10.0.0/24"
}

variable "subnet1-name" {
    default = "backend"
}
variable "subnet1-address" {
    default = "10.10.1.0/24"
}

variable "vm0-name" {
    default = "vm0"
}

variable "ssh-key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDmTTJhmpJzSOx2PvGknszw2Sdzai96eC6Hsr/cLJ/c232mViI7dQQ9xCXd1cJPUJ1oErCwXTc5w0CSzUe3lFIIMBgcMdFR6CI5N8JLretnUI7jCXHhQFSVphGoTgEfCqvDjOd6oJ4QZML5hZOiyUvXFa7E61hERJsd3cuAQb2zBswlVpPaD8HV7wKPM312L//hnMRQBQEXZAfgAYmwSMwiXmI/tNOsH6h1t7zPw+3gS4jfzpRnQxJfwi4gG9fG4F9L+BwPoUYPujD/AJLQWfMvJQpLTAa96dwCRx2Iok6VW/Kt4KQ34J1eBUQ7Kr7LvuvyVGMD3vbFPX7HqVOcSZq5Vbq12CF2vzD2cWnkulix11+th+h4fLoBdM8eR3VNwBOM/BJNMPzXCsjLwzdnPHnG4GJewzfD3wMi0r/G+5e4Gw3+lbYUZ40my7QDBGyoLYRGFAhQ2mdCDb1XwMrXiLqsQPOzKeiAX1q4KQ8wDsei8yuo1xtEBO28mz8h/MpHWlFkZtjT4pF+jkZk+9DRg2trpBeGRdyQ4W+UOXVHEZ2Lb2EKLhUbZY6MexkPG1k+C4t6JrrQvkJcsPggijy2TsgQlPtYUM7nlexa3nZfFv3ph/pf4q7C2TYrLHVpVqMQmcCIU06r1jFjgfzz3Rs+JjsQ9+u7Ao+/Re2DNzTCmMN08Q== smithm@smmb.local"
}  

variable "vm0-size" {
    default = "Standard_A2_v2"
}
