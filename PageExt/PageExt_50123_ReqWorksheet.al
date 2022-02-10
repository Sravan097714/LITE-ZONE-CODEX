pageextension 50123 ReqWorksheetExt extends "Req. Worksheet"
{
    layout
    {
        addlast(Control1)
        {
            field(Comment; Comment) { ApplicationArea = All; }
            field("Production Order"; "Production Order") { ApplicationArea = All; }
        }
        addbefore(Type)
        {
            field("OrderDate"; "Order Date") { ApplicationArea = all; }
        }
    }
}