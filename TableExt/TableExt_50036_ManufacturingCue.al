tableextension 50036 ManufacturingCueExt extends "Manufacturing Cue"
{
    fields
    {
        field(50000; "Released Prod. Orders - Block"; Integer)
        {
            CalcFormula = Count("Production Order" WHERE(Status = CONST(Released), Blocked = filter(true)));
            Caption = 'Released Prod. Orders - Blocked';
            FieldClass = FlowField;
        }
    }
}