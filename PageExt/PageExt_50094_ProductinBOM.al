pageextension 50094 ProductionBOMExt extends "Production BOM"
{
    layout
    {
        addafter("No.")
        {
            field("Item No."; "Item No.")
            {
                ApplicationArea = All;

                trigger OnValidate()
                var
                    grecItem: Record Item;
                begin
                    if grecItem.Get("No.") then
                        Description := grecItem.Description;
                end;
            }
        }
    }
}