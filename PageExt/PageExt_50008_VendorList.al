pageextension 50008 VendorList extends "Vendor List"
{
    layout
    {
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Post Code")
        {
            Visible = false;
        }
        modify("Country/Region Code")
        {
            Visible = false;
        }
        modify("Fax No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(Contact)
        {
            Visible = false;
        }
        modify("Vendor Posting Group")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Payment Terms Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(Blocked)
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Application Method")
        {
            Visible = false;
        }
        modify("Balance Due (LCY)")
        {
            Visible = false;
        }
        modify("Payments (LCY)")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Currency Code")
        {
            Visible = true;
        }
        addafter(Blocked)
        {
            field(Balance; Rec.Balance)
            {
                Editable = false;
            }
        }
        addlast(Control1)
        {
            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                Visible = true;
                ApplicationArea = All;
            }
            field(BRN; Rec.BRN)
            {
                Visible = true;
                ApplicationArea = All;
            }
        }

    }
}