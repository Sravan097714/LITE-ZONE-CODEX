pageextension 50101 FirmedProdOrdsExt extends "Firm Planned Prod. Orders"
{
    layout
    {
        addlast(Control1)
        {
            field("Saled Order No."; "Sales Order No.") { ApplicationArea = all; }
            field(Delete; Delete) { ApplicationArea = All; }
            field(Blocked; Blocked) { ApplicationArea = All; }
        }
    }
}