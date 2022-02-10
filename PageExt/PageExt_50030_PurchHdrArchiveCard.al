pageextension 50030 PurchHdrArchiveCardExt extends "Purchase Order Archive"
{
    layout
    {
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }

        modify("Document Date")
        {
            Visible = false;
        }
        modify("Vendor Order No.")
        {
            Caption = 'Reason for Closing Purchase Order';
        }
        modify("Vendor Shipment No.")
        {
            Visible = false;
        }
        modify("Purchaser Code")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Pay-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Ship-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Order Address Code")
        {
            Visible = false;
        }
        addlast(General)
        {
            field("Cancelled By"; Rec."Cancelled By")
            {
                ApplicationArea = All;
            }
            field("Date Cancelled"; Rec."Date Cancelled")
            {
                ApplicationArea = All;
            }
            field("Time Cancelled"; Rec."Time Cancelled")
            {
                ApplicationArea = All;
            }
        }
    }
}
