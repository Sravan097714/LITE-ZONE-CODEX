tableextension 50035 ProdOrderLineExt extends "Prod. Order Line"
{
    procedure ShowReservation2()
    var
        Reservation: Page Reservation;
        IsHandled: Boolean;
    begin
        TestField("Item No.");
        Clear(Reservation);
        Reservation.SetReservSource(Rec);
        Reservation.Run();
    end;



    procedure ShowRouting2()
    var
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
        ProdOrderRoutingPAGE: Page "Prod. Order Routing";
        CalcProdOrder: Codeunit "Calculate Prod. Order";
    begin
        ProdOrderRoutingLine.SetRange(Status, Status);
        ProdOrderRoutingLine.SetRange("Prod. Order No.", "Prod. Order No.");
        ProdOrderRoutingLine.SetRange("Routing Reference No.", "Routing Reference No.");
        ProdOrderRoutingLine.SetRange("Routing No.", "Routing No.");

        if ProdOrderRoutingLine.FindSet then;
        ProdOrderRoutingPAGE.SetTableView(ProdOrderRoutingLine);
        ProdOrderRoutingPAGE.Run;

        //PAGE.RunModal(PAGE::"Prod. Order Routing", ProdOrderRoutingLine);
        CalcProdOrder.FindAndSetProdOrderLineBinCodeFromProdRoutingLines(Status, "Prod. Order No.", "Line No.");
    end;
}