pageextension 50106 ManufacturingSetupExt extends "Manufacturing Setup"
{
    layout
    {
        addlast(General)
        {
            field("Auto Reserve"; "Auto Reserve") { ApplicationArea = All; }
        }
    }
}