pageextension 50095 ProductionBOMListExt extends "Production BOM List"
{
    layout
    {
        addafter("No.")
        {
            field("Item No."; "Item No.")
            {
                ApplicationArea = All;
            }
        }
    }
}