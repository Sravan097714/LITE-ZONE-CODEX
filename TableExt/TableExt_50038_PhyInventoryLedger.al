tableextension 50038 PhyInventoryLedger extends "Phys. Inventory Ledger Entry"
{
    fields
    {
        field(50000; "Item No.2"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Shelf No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Qty Modified"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    var
        myInt: Integer;
}