pageextension 50055 PostedPurchRcptSubformExt extends "Posted Purchase Rcpt. Subform"
{
    layout
    {

        modify("Expected Receipt Date")
        {
            Visible = false;
        }
        modify("Planned Receipt Date")
        {
            Visible = false;
        }
        modify("Qty. Rcd. Not Invoiced")
        {
            Visible = false;
        }
        modify("Order Date")
        {
            Visible = false;
        }
        addafter(Description)
        {
            field("Description 2"; "Description 2")
            {
                ApplicationArea = All;
            }
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
    }
}