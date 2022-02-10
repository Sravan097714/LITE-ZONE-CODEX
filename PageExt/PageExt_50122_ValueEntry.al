pageextension 50122 ValueEntryExt extends "Value Entries"
{
    layout
    {
        modify("Location Code")
        {
            Visible = true;
        }
        addafter(Description)
        {
            field("Item No.2"; Rec."Item No.2")
            {
                ApplicationArea = all;
            }
            field("Shelf No."; Rec."Shelf No.")
            {
                ApplicationArea = all;
            }
            field("Qty Modified"; Rec."Qty Modified")
            {
                ApplicationArea = all;
            }
        }
    }
}