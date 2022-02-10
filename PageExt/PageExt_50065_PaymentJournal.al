pageextension 50065 PaymentJournal extends "Payment Journal"
{
    layout
    {
        modify("Recipient Bank Account")
        {
            Visible = false;
        }
        modify("Message to Recipient")
        {
            Visible = false;
        }
        modify("Payment Reference")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("Amount (LCY)")
        {
            Visible = true;
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
        modify("Applies-to Doc. Type")
        {
            Visible = false;
        }
        modify(AppliesToDocNo)
        {
            Visible = false;
        }
        modify(Correction)
        {
            Visible = false;
        }
        modify("Exported to Payment File")
        {
            Visible = false;
        }
        modify(TotalExportedAmount)
        {
            Visible = false;
        }
        modify(GetAppliesToDocDueDate)
        {
            Visible = false;
        }
        modify("Has Payment Export Error")
        {
            Visible = false;
        }
        modify("Bank Payment Type")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Check Printed")
        {
            Visible = true;
            ApplicationArea = All;
        }
        movebefore("Bal. Account Type"; "Bank Payment Type")

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
            /* field("TDS Code"; "TDS Code")
            {
                ApplicationArea = All;
            } */
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        Rec.TESTFIELD("Check Printed", FALSE);
    end;
}