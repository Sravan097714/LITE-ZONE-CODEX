pageextension 50098 FinishedProdOrdsExt extends "Finished Production Orders"
{
    layout
    {
        addlast(Control1)
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