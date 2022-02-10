tableextension 50034 RequisitionLineExt extends "Requisition Line"
{
    fields
    {
        field(50000; Comment; text[200]) { }
        field(50001; "Production Order"; code[20])
        {
            TableRelation = "Production Order"."No.";
        }
    }

    trigger OnInsert()
    begin
        "Location Code" := 'ADMN';
    end;
}