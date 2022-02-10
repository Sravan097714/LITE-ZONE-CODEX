pageextension 50102 FirmedProdOrdExt extends "Firm Planned Prod. Order"
{
    layout
    {
        addlast(General)
        {
            field("Saled Order No."; "Sales Order No.")
            {
                ApplicationArea = all;
            }

            field(Delete; Delete) { ApplicationArea = All; }
            field(Blocked; Blocked) { ApplicationArea = All; }
        }
    }
}