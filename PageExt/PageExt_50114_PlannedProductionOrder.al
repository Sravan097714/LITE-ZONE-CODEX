pageextension 50114 PlannedProductionOrder extends "Planned Production Order"
{
    layout
    {
        addlast(General)
        {
            field(Delete; Delete) { ApplicationArea = All; }
            field(Blocked; Blocked) { ApplicationArea = All; }
        }
    }
}