pageextension 50115 ItemLookup extends "Item Lookup"
{
    layout
    {
        addafter("No.")
        {
            field("No. 2"; "No. 2") { ApplicationArea = All; }
        }
        modify("Routing No.")
        {
            Visible = true;
        }
        modify("Base Unit of Measure")
        {
            Visible = true;
        }
        modify("Shelf No.")
        {
            Visible = true;
        }
        modify("Vendor No.")
        {
            Visible = true;
        }
        modify("Vendor Item No.")
        {
            Visible = true;
        }
        modify("Item Category Code")
        {
            Visible = true;
        }
        addlast(Group)
        {
            field(Inventory; Inventory) { ApplicationArea = All; }
            field("Substitutes Exist"; "Substitutes Exist") { ApplicationArea = All; }
            field("Production BOM No."; "Production BOM No.") { ApplicationArea = All; }
            //field("Routing No."; "Routing No.") { ApplicationArea = All; }
            //field("Base Unit of Measure"; "Base Unit of Measure") { ApplicationArea = All; }
            //field("Shelf No."; "Shelf No.") { ApplicationArea = All; }
            //field("Vendor No."; "Vendor No.") { ApplicationArea = All; }
            field("Vendor Name"; "Vendor Name") { ApplicationArea = All; }
            //field("Vendor Item No."; "Vendor Item No.") { ApplicationArea = All; }
            field("Rounding Precision"; "Rounding Precision") { ApplicationArea = All; }
            //field("Item Category Code"; "Item Category Code") { ApplicationArea = All; }
            field("Product Group Code"; "Product Group Code 2") { ApplicationArea = All; }
            field("Qty. on Prod. Order"; "Qty. on Prod. Order") { ApplicationArea = All; }
            field("Reserved Qty. on Inventory"; "Reserved Qty. on Inventory") { ApplicationArea = All; }
            field("Qty. on Sales Order"; "Qty. on Sales Order") { ApplicationArea = All; }
            field("Reserved Qty. on Sales Orders"; "Reserved Qty. on Sales Orders") { ApplicationArea = All; }
            field("Qty. on Purch. Order"; "Qty. on Purch. Order") { ApplicationArea = All; }
            field("Reserved Qty. on Purch. Orders"; "Reserved Qty. on Purch. Orders") { ApplicationArea = All; }
            field("Item Type"; "Item Type") { ApplicationArea = All; }
            field(Colour; Colour) { ApplicationArea = All; }
            field(Finish; Finish) { ApplicationArea = All; }
            field(Material; Material) { ApplicationArea = All; }
            field(Dimensions; Dimensions) { ApplicationArea = All; }
            field(Lampholder; Lampholder) { ApplicationArea = All; }
            field(Wattage; Wattage) { ApplicationArea = All; }
            field("ATTRIBUTE 8"; "ATTRIBUTE 8") { ApplicationArea = All; }
            field("ATTRIBUTE 9"; "ATTRIBUTE 9") { ApplicationArea = All; }
        }
    }
}