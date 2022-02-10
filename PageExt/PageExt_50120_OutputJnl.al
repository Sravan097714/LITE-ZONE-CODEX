pageextension 50120 OutputJnlExt extends "Output Journal"
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
        modify("Location Code")
        {
            Visible = true;
        }
    }


    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Location Code" := 'ADMN';
    end;
}