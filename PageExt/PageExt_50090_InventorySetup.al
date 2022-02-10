pageextension 50090 InventoryExt extends "Inventory Setup"
{
    layout
    {
        addlast(General)
        {
            field("Item Mandatory Field"; "Item Mandatory Field")
            {
                ApplicationArea = all;
            }
        }
    }
}