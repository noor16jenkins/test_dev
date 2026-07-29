resource "azurerm_resource_group" "Rg_19july" {
    for_each = var.Rg
    name = each.value.name
    location = each.value.location

  
}



