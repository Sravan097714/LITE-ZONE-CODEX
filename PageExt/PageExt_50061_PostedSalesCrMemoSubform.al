pageextension 50061 PostedSalesCrMemoSubformExt extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        // Add changes to page layout here
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
        modify("Tax Area Code")
        {
            Visible = false;
        }
        addlast(Control1)
        {
            field("Location Code"; "Location Code") { ApplicationArea = All; }
        }
        modify(Type)
        {
            Visible = true;
            ApplicationArea = All;
        }
        addbefore(Type)
        {
            field("Line No."; "Line No.") { ApplicationArea = All; }
        }

        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Unit Cost (LCY)")
        {
            Visible = false;
        }
        modify("Line Discount Amount")
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
            Visible = true;
            ApplicationArea = All;
        }
        modify("Deferral Code")
        {
            Visible = false;
        }

        modify("Unit of Measure Code")
        {
            Visible = false;
        }

        modify("Appl.-from Item Entry") { Visible = true; }
        modify("Appl.-to Item Entry") { Visible = true; }

        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                Editable = true;
                ApplicationArea = All;
            }
        }

        addafter(Quantity)
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = all;
            }
            field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = all;
            }
        }

        addlast(Control1)
        {
            field(Amount; Rec.Amount)
            {
                ApplicationArea = All;
            }
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = All;
            }
        }
    }

}