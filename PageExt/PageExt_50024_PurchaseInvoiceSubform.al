pageextension 50024 PurchaseInvoiceSubformExt extends "Purch. Invoice Subform"
{
    layout
    {
        modify(Type)
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Line No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(FilteredTypeField)
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = true;
        }
        modify("Qty. Assigned")
        {
            Visible = true;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = true;
        }

        addafter(Quantity)
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = all;
            }
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Unit of Measure Code")
        {
            Visible = true;
        }

        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                Editable = true;
                ApplicationArea = All;
            }
        }

        movefirst(PurchDetailLine; "Line No.")
        moveafter("Gen. Prod. Posting Group"; "VAT Prod. Posting Group")

        modify("Depreciation Book Code")
        {
            Editable = true;
            Visible = true;
        }
    }

}