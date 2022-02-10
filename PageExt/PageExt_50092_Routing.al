pageextension 50092 RoutingExt extends Routing
{
    layout
    {
        addafter("No.")
        {
            field("Item No."; "Item No.")
            {
                ApplicationArea = All;

                trigger OnValidate()
                var
                    grecItem: Record Item;
                begin
                    if grecItem.Get("No.") then
                        Description := grecItem.Description;
                end;
            }
        }
    }
}