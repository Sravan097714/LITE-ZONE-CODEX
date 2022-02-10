pageextension 50113 PlannedProductionOrders extends "Planned Production Orders"
{
    layout
    {
        addlast(Control1)
        {
            field(Delete; Delete) { ApplicationArea = All; }
            field(Blocked; Blocked) { ApplicationArea = All; }
        }
    }
}