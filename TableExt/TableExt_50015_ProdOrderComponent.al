tableextension 50015 ProdOrdCompExt extends "Prod. Order Component"
{
    fields
    {
        Field(50000; "Thru Consumption Jnl"; Boolean) { }
        Field(50001; "New Item Addn Manual Entry"; Boolean) { }
        field(50002; "Qty Issued"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Document No." = field("Prod. Order No."), "Item No." = field("Item No.")));
        }
    }

}