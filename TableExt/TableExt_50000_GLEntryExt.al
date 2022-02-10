tableextension 50000 GLEntryExt extends "G/L Entry"
{
    fields
    {
        field(50000; "Creation Date"; Date) { }
        field(50001; "PV Number"; Code[20]) { }
        field(50002; "Bank Name for Cheque"; Text[30]) { }
        field(50003; "TDS Code"; Code[50]) { }
        field(50004; "Dimension Code 1"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Set Entry"."Dimension Code" where("Dimension Set ID" = field("Dimension Set ID"), "Dimension Code" = filter('VEHICLE')));
        }

        field(50005; "Dimension Value Code 1"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"), "Dimension Code" = filter('VEHICLE')));
        }

        field(50006; "Dimension Code 2"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Set Entry"."Dimension Code" where("Dimension Set ID" = field("Dimension Set ID"), "Dimension Code" = filter('CREDIT CARD')));
        }

        field(50007; "Dimension Value Code 2"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"), "Dimension Code" = filter('CREDIT CARD')));
        }
        field(50008; "Source Name"; Text[100]) { }
    }


    var
        dimsetentry: Record 480;
}