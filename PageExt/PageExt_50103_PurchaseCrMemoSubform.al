pageextension 50103 PurchCrMemoSubformExt extends "Purch. Cr. Memo Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; "Description 2")
            {
                ApplicationArea = All;
            }
        }

        modify("Appl.-to Item Entry")
        {
            Visible = true;
        }

        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Tax Liable")
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }
        modify("Depreciation Book Code")
        {
            Editable = true;
            Visible = true;
        }
    }
}