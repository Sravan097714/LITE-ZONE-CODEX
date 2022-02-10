pageextension 50064 CashReceiptJournal extends "Cash Receipt Journal"
{
    layout
    {
        modify("External Document No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Currency Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Amount (LCY)")
        {
            Visible = true;
        }
        modify("Credit Amount")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Debit Amount")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(Correction)
        {
            Visible = false;
        }
        modify("Applies-to Doc. Type")
        {
            Visible = false;
        }
        modify("Applies-to Doc. No.")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = true;
            ApplicationArea = All;

        }

        addfirst(Control1)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }


        addlast(Control1)
        {
            field("Bank Name for Cheque"; "Bank Name for Cheque")
            {
                ApplicationArea = all;
            }
        }
        addafter("External Document No.")
        {
            field("Payment Method Code"; Rec."Payment Method Code")
            {
                ApplicationArea = All;
            }
        }

    }
}