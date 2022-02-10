report 50022 "Prod. Order - Job Card 2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report\Layout\ProdOrderJobCardNEW.rdl';
    AdditionalSearchTerms = 'production order - job card,work order job card';
    ApplicationArea = Manufacturing;
    Caption = 'Prod. Order - Job Card 2';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Status, "No.");
            RequestFilterFields = Status, "No.", "Source Type", "Source No.";
            column(Status_ProdOrder; Status) { }
            column(No_ProdOrder; "No.") { }
            column(Saled_Order_No_; "Sales Order No.") { }
            column(Due_Date; format("Due Date")) { }
            column(Quantity; Quantity) { }
            column(Description; Description) { }
            column(Source_No_; "Source No.") { }
            column(ItemPicture; Item.Picture) { }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(TodayFormatted; Format(Today, 0, 4)) { }
                column(CompanyName; COMPANYPROPERTY.DisplayName) { }
                column(ProdOrderTableCaptionFilt; "Production Order".TableCaption + ':' + ProdOrderFilter) { }
                column(ProdOrderFilter; ProdOrderFilter) { }
                column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl) { }
                column(ProdOrderJobCardCaption; ProdOrderJobCardCaptionLbl) { }
            }
            dataitem("Prod. Order Routing Line"; "Prod. Order Routing Line")
            {
                DataItemLinkReference = "Production Order";
                DataItemLink = Status = FIELD(Status), "Prod. Order No." = FIELD("No.");
                DataItemTableView = SORTING(Status, "Prod. Order No.", "Routing Reference No.", "Routing No.", "Operation No.");
                column(RtngNo_ProdOrderRtngLine; "Routing No.")
                {
                    IncludeCaption = true;
                }
                column(OPNo_ProdOrderRtngLine; "Operation No.")
                {
                    IncludeCaption = true;
                }
                column(Type_ProdOrderRtngLine; Type)
                {
                    IncludeCaption = true;
                }
                column(No_ProdOrderRtngLine; "No.")
                {
                    IncludeCaption = true;
                }
                column(Desc; "Prod. Order Routing Line".Description) { }
                column(RunTime; "Prod. Order Routing Line"."Run Time") { }
                column(TotalTime; "Prod. Order Routing Line"."Run Time" * "Production Order".Quantity) { }
                column(StrtTim_ProdOrderRtngLine; "Starting Time")
                {
                    IncludeCaption = true;
                }
                column(StrtDt_ProdOrderRtngLine; Format("Starting Date")) { }
                column(EndTime_ProdOrderRtngLine; "Ending Time")
                {
                    IncludeCaption = true;
                }
                column(EndDate_ProdOrderRtngLine; Format("Ending Date")) { }
                column(ExpCapNd_ProdOrderRtngLine; "Expected Capacity Need") { }
                column(Desc_ProdOrder; "Production Order".Description) { }
                column(SourceNo_ProdOrder; "Production Order"."Source No.") { }
                column(ProdOrdrRtngLineRTUOMCode; CapacityUoM) { }
                column(PrdOrdNo_ProdOrderRtngLine; "Prod. Order No.")
                {
                    IncludeCaption = true;
                }
                column(ProdOrderRtngLnStrtDtCapt; ProdOrderRtngLnStrtDtCaptLbl) { }
                column(ProdOrdRtngLnEndDatCapt; ProdOrdRtngLnEndDatCaptLbl) { }
                column(ProdOrdRtngLnExpcCapNdCpt; ProdOrdRtngLnExpcCapNdCptLbl) { }
                column(PrecalcTimesCaption; PrecalcTimesCaptionLbl) { }
                column(ProdOrderSourceNoCapt; ProdOrderSourceNoCaptLbl) { }
                column(OutputCaption; OutputCaptionLbl) { }
                column(ScrapCaption; ScrapCaptionLbl) { }
                column(DateCaption; DateCaptionLbl) { }
                column(ByCaption; ByCaptionLbl) { }
                column(EmptyStringCaption; EmptyStringCaptionLbl) { }
                column(gdecRunTime; gdecRunTime) { }

                trigger OnAfterGetRecord()
                var
                    WorkCenter: Record "Work Center";
                    CalendarMgt: Codeunit "Shop Calendar Management";
                begin
                    WorkCenter.Get("Work Center No.");
                    CapacityUoM := WorkCenter."Unit of Measure Code";
                    "Expected Capacity Need" := "Expected Capacity Need" / CalendarMgt.TimeFactor(CapacityUoM);


                    clear(gdecRunTime);
                    grecCapacityLedgerEntry.Reset();
                    grecCapacityLedgerEntry.SetRange("Order No.", "Prod. Order No.");
                    grecCapacityLedgerEntry.SetRange("No.", "No.");
                    if grecCapacityLedgerEntry.FindFirst then
                        gdecRunTime := grecCapacityLedgerEntry."Run Time";

                end;
            }
            dataitem("Prod. Order Component"; "Prod. Order Component")
            {
                //DataItemLink = Status = FIELD(Status), "Prod. Order No." = FIELD("No.");
                //DataItemTableView = SORTING(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.");

                DataItemLinkReference = "Production Order";
                DataItemLink = "Prod. Order No." = FIELD("No.");
                //DataItemTableView = SORTING(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.") WHERE(Status = CONST(Released)); //KTM 27/01/22
                DataItemTableView = SORTING(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.") WHERE(Status = filter(Released | "Firm Planned"));

                column(Prod__Order_Line_No_; "Prod. Order Line No.") { }
                column(Position_ProdOrderComp; Position)
                {
                    IncludeCaption = true;
                }
                column(Position2_ProdOrderComp; "Position 2")
                {
                    IncludeCaption = true;
                }
                column(LdTimOffset_ProdOrderComp; "Lead-Time Offset")
                {
                    IncludeCaption = true;
                }
                column(ExpectedQty_ProdOrderComp; format("Expected Quantity"))
                {
                    //IncludeCaption = true;
                }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Qty_Issued; format(gdecQtyIssued)) { }
                column(ItemNo_ProdOrderComp; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(OrderNo_ProdOrderComp; "Prod. Order No.") { }
                column(MaterialRequirementsCapt; MaterialRequirementsCaptLbl) { }
                column(ItemDesc; Item.Description) { }
                column(ItemNo; "Prod. Order Component"."Item No.") { }
                column(ItemShelf; Item."Shelf No.") { }

                trigger OnAfterGetRecord()
                begin
                    IF Item.GET("Prod. Order Component"."Item No.") THEN;

                    CalcFields("Qty Issued");
                    gdecQtyIssued := "Qty Issued" * -1;
                end;
            }

            trigger OnAfterGetRecord()
            var
                ProdOrderRoutingLine: Record "Prod. Order Routing Line";
            begin
                ProdOrderRoutingLine.SetRange(Status, Status);
                ProdOrderRoutingLine.SetRange("Prod. Order No.", "No.");
                if not ProdOrderRoutingLine.FindFirst then
                    CurrReport.Skip();

                if Item.Get("Source No.") then;
            end;

            trigger OnPreDataItem()
            begin
                ProdOrderFilter := GetFilters;
            end;
        }
    }

    var
        ProdOrderFilter: Text;
        CapacityUoM: Code[10];
        CurrReportPageNoCaptionLbl: Label 'Page';
        ProdOrderJobCardCaptionLbl: Label 'Prod. Order - Job Card';
        ProdOrderRtngLnStrtDtCaptLbl: Label 'Starting Date';
        ProdOrdRtngLnEndDatCaptLbl: Label 'Ending Date';
        ProdOrdRtngLnExpcCapNdCptLbl: Label 'Time Needed';
        PrecalcTimesCaptionLbl: Label 'Precalc. Times';
        ProdOrderSourceNoCaptLbl: Label 'Item No.';
        OutputCaptionLbl: Label 'Output';
        ScrapCaptionLbl: Label 'Scrap';
        DateCaptionLbl: Label 'Date';
        ByCaptionLbl: Label 'By';
        EmptyStringCaptionLbl: Label '___________';
        MaterialRequirementsCaptLbl: Label 'Material Requirements';
        InComponent: Boolean;
        Item: Record Item;
        gdecQtyIssued: Decimal;

        grecCapacityLedgerEntry: Record "Capacity Ledger Entry";
        gdecRunTime: Decimal;
}

