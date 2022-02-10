pageextension 50097 ReleasedProdOrdsExt extends "Released Production Orders"
{
    layout
    {
        addlast(Control1)
        {
            field("Sales Order No."; "Sales Order No.")
            {
                ApplicationArea = all;
            }
            field(Delete; Delete) { ApplicationArea = All; }
            field(Blocked; Blocked) { ApplicationArea = All; }
        }

        modify(Control1)
        {
            FreezeColumn = "Source No.";
        }
    }
}