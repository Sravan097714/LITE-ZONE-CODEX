pageextension 50129 PhyInventoryLedgerEntry extends "Phys. Inventory Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("Item No.2"; Rec."Item No.2")
            {
                ApplicationArea = all;
            }
            field("Shelf No."; Rec."Shelf No.")
            {
                ApplicationArea = all;
            }
            field("Qty Modified"; Rec."Qty Modified")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}