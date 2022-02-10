tableextension 50014 ProductionOrdExt extends "Production Order"
{
    fields
    {
        Field(50000; Delete; Boolean) { }
        field(50001; "Sales Order No."; Code[20])
        {
            Editable = false;
        }
    }
}