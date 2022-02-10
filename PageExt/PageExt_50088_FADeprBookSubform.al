pageextension 50088 FADeprBookSubform extends "FA Depreciation Books Subform"
{
    layout
    {
        modify("Declining-Balance %")
        {
            Visible = false;
        }
        addlast(Control1)
        {
            field("Acquisition Cost"; "Acquisition Cost")
            {
                ApplicationArea = All;
            }
            field("Disposal Date"; "Disposal Date")
            {
                ApplicationArea = All;
            }
            field(Depreciation; Depreciation)
            {
                ApplicationArea = all;
            }
        }
    }
}