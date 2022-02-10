pageextension 50121 RevaluatonJnlExt extends "Revaluation Journal"
{
    layout
    {
        addfirst(Control1)
        {
            field("Line No."; "Line No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify(ShortcutDimCode3)
        {
            Visible = false;
        }
        addafter("Gen. Bus. Posting Group")
        {
            field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Location Code" := 'ADMN';
    end;
}