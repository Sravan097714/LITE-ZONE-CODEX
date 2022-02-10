tableextension 50032 ItemJnlLineExt extends "Item Journal Line"
{
    fields
    {
        field(50000; "Qty. Phys. Inventory modified"; Boolean) { }
        field(50001; "Qty Issued"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Document No." = field("Document No."), "Item No." = field("Item No.")));
        }
        field(50002; "Expected Qty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Prod. Order Component"."Expected Quantity" where("Prod. Order No." = field("Document No."), "Item No." = field("Item No.")));
        }
        field(50003; "Item No.2"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Shelf No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        gpageProdJnl: page "Production Journal";
}