pageextension 50066 FixedAssetGLJournal extends "Fixed Asset G/L Journal"
{
    layout
    {
        // Add changes to page layout here
        modify("Document Type")
        {
            Visible = false;
        }

        modify("External Document No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("FA Posting Type")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Debit Amount")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Credit Amount")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;

        }
        modify("Bal. Gen. Posting Type")
        {
            Visible = false;
        }
        modify("Bal. Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        modify("Bal. Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Depr. until FA Posting Date")
        {
            Visible = false;
        }
        modify("Depr. Acquisition Cost")
        {
            Visible = false;
        }
        modify("Budgeted FA No.")
        {
            Visible = false;
        }
        modify("FA Reclassification Entry")
        {
            Visible = false;
        }
        modify("FA Error Entry No.")
        {
            Visible = false;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        modify("Bal. Account Type")
        {
            Visible = false;
        }
        modify("Bal. Account No.")
        {
            Visible = false;
        }

        modify("VAT Prod. Posting Group")
        {
            Visible = false;
        }

        movebefore("Account Type"; "FA Posting Type")

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
            field("Posting Group"; Rec."Posting Group")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
    }
}