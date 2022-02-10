pageextension 50010 FixedAssetList extends "Fixed Asset List"
{
    layout
    {
        modify(Acquired)
        {
            Visible = false;
        }
        modify("Vendor No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        addlast(Control1)
        {
            field(Blocked; Rec.Blocked)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Serial No."; Rec."Serial No.")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("FA Posting Group"; Rec."FA Posting Group")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
    }
}