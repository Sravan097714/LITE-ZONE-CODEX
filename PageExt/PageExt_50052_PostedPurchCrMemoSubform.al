pageextension 50052 PostedPurchCrMemoSubformExt extends "Posted Purch. Cr. Memo Subform"
{
    layout
    {
        modify(FilteredTypeField)
        {
            Visible = false;
        }
        modify("Cross-Reference No.")
        {
            Visible = false;
        }
        modify("Return Reason Code")
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
        modify("Total Amount Excl. VAT")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Total Amount Incl. VAT")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Deferral Code")
        {
            Visible = false;
        }
        modify("Unit Price (LCY)")
        {
            Visible = false;
        }
        modify("Line Discount Amount")
        {
            Visible = true;
            ApplicationArea = All;
        }

        modify("Unit of Measure Code")
        {
            Visible = false;
        }


        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }

        addafter(Quantity)
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
            {
                Editable = false;
                ApplicationArea = All;

            }
            field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
            {
                Visible = true;
                ApplicationArea = All;
            }
        }

        addlast(Control1)
        {
            field("Location Code"; Rec."Location Code")
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }
}