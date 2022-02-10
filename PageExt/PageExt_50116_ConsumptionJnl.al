pageextension 50116 ConsumptionJnl extends "Consumption Journal"
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
            ApplicationArea = All;
        }

        modify("Order No.")
        {
            trigger OnAfterValidate()
            begin
                "Location Code" := 'ADMN';
            end;
        }
        modify("Item No.")
        {
            trigger OnAfterValidate()
            begin
                "Location Code" := 'ADMN';
            end;
        }
    }
}