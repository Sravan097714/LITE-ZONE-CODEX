pageextension 50093 RoutingListExt extends "Routing List"
{
    layout
    {
        addafter("No.")
        {
            field("Item No."; "Item No.")
            {
                ApplicationArea = All;
            }
        }

        modify(Status)
        {
            Visible = true;
        }
        modify(Type)
        {
            Visible = true;
        }
    }
}