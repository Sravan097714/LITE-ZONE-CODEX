pageextension 50022 PurchInvoiceListExt extends "Purchase Invoices"
{
    layout
    {
        modify(Control1)
        {
            FreezeColumn = "Buy-from Vendor Name";
        }
        modify("Vendor Invoice No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify("Document Date")
        {
            Visible = true;
            Editable = true;
        }
        modify("Posting Date")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        movelast(Control1; "Shortcut Dimension 1 Code")
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify("Currency Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(Amount)
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify(Status)
        {
            Visible = true;
            ApplicationArea = All;
        }
        addafter("Buy-from Vendor Name")
        {
            field("Posting Description"; Rec."Posting Description")
            {
                Visible = true;
                Editable = false;
                ApplicationArea = All;
            }
        }
        addafter("Vendor Invoice No.")
        {
            field("Vendor Posting Group"; Rec."Vendor Posting Group")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
        addafter("Buy-from Vendor Name")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }

        }
        addlast(Control1)
        {
            field(BRN; Rec.BRN)
            {
                ApplicationArea = All;
            }
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.SetRange("Prices Including VAT", false);
    end;


}