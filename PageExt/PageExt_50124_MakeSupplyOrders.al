pageextension 50124 MakeSupplyOrderExt extends "Make Supply Orders"
{
    trigger OnAfterGetRecord()
    begin
        "Make Orders" := "Make Orders"::"The Active Line";
        "Create Purchase Order" := "Create Purchase Order"::"Copy to Req. Wksh";
        "Create Production Order" := "Create Production Order"::" ";
        "Create Transfer Order" := "Create Transfer Order"::" ";
        "Create Assembly Order" := "Create Assembly Order"::" ";
    end;

    var
        myInt: Integer;
}