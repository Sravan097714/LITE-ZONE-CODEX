pageextension 50075 BankAccLedgerEntries extends "Bank Account Ledger Entries"
{
    layout
    {
        modify("User ID")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Source Code")
        {
            Visible = true;
        }
        modify("Global Dimension 1 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Global Dimension 2 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Dimension Set ID")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Remaining Amount")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Amount (LCY)")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Bal. Account No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Bal. Account Type")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Currency Code")
        {
            Visible = false;
        }

        addlast(Control1)
        {
            field(Positive; Rec.Positive)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Statement Status"; Rec."Statement Status")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Statement No."; Rec."Statement No.")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Statement Line No."; Rec."Statement Line No.")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Check Ledger Entries"; Rec."Check Ledger Entries")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("External Document No."; Rec."External Document No.")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("PV Number"; Rec."PV Number")
            {
                ApplicationArea = All;
            }
            field("Bank Name for Cheque"; "Bank Name for Cheque")
            {
                ApplicationArea = all;
            }
            field("TDS Code"; "TDS Code")
            {
                ApplicationArea = All;
            }
        }
    }
}