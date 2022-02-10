pageextension 50011 FixedAssetCardExt extends "Fixed Asset Card"
{
    layout
    {
        modify("No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Budgeted Asset")
        {
            Visible = false;
        }
        modify("Main Asset/Component")
        {
            Visible = false;
        }
        modify("Component of Main Asset")
        {
            Visible = false;
        }
        modify(Inactive)
        {
            Visible = false;
        }
        modify(Acquired)
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = false;
        }
        modify("Vendor No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Depreciation Book")
        {
            Visible = false;
        }
        modify(BookValue)
        {
            Visible = true;
        }
        modify(DepreciationTableCode)
        {
            Visible = false;
        }
        modify(UseHalfYearConvention)
        {
            Visible = false;
        }
        modify(AddMoreDeprBooks)
        {
            Visible = true;
        }
        modify(DepreciationBook)
        {
            Visible = true;
        }
        modify(FAPostingGroup)
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Maintenance Vendor No.")
        {
            Visible = false;
        }
        modify("Under Maintenance")
        {
            Visible = false;
        }
        modify("Next Service Date")
        {
            Visible = false;
        }
        modify("Warranty Date")
        {
            Visible = false;
        }
        modify(Insured)
        {
            Visible = false;
        }

        addlast(General)
        {
            field("Global Dimension 1 Code"; "Global Dimension 1 Code")
            {
                ApplicationArea = all;
            }
        }
    }

    /* trigger OnAfterGetRecord()
    begin
        FADeprBookNew.SetRange("FA No.", Rec."No.");
        if FADeprBookNew.FindFirst then begin
            FADeprBookNew.CalcFields("Acquisition Cost");
            FADeprBookNew.CalcFields(Depreciation);
            FADeprBookNew.CalcFields("Book Value");
        end;
    end;
 */

    var
        myInt: Integer;
        FADeprBook: Record 5612;
        FADeprBookNew: Record 5612;
}
