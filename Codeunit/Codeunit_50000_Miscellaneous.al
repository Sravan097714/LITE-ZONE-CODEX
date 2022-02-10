codeunit 50000 Miscellaneous
{
    trigger OnRun()
    var
        OrderPlannnig: Page "Order Planning";
    begin
    end;

    [EventSubscriber(ObjectType::Table, 36, 'OnAfterCopySellToCustomerAddressFieldsFromCustomer', '', false, false)]
    local procedure OnAfterCopySellToCustomerAddressFieldsFromCustomer(VAR SalesHeader: Record "Sales Header"; SellToCustomer: Record Customer; CurrentFieldNo: Integer)
    var
        grecCustomer: Record Customer;
    begin
        if grecCustomer.get(SellToCustomer."No.") then
            SalesHeader.BRN := grecCustomer.BRN;
    end;


    [EventSubscriber(ObjectType::Table, 38, 'OnAfterCopyBuyFromVendorFieldsFromVendor', '', false, false)]
    local procedure OnAfterCopyBuyFromVendorFieldsFromVendor(VAR PurchaseHeader: Record "Purchase Header"; Vendor: Record Vendor)
    var
        grecVendor: Record Vendor;
    begin
        if grecVendor.get(Vendor."No.") then
            PurchaseHeader.BRN := grecVendor.BRN;
    end;


    [EventSubscriber(ObjectType::Codeunit, 99000792, 'OnAfterCreateProdOrderFromSalesLine', '', false, false)]
    procedure OnAfterCreateProdOrderFromSalesLine(var ProdOrder: Record "Production Order"; SalesLine: Record "Sales Line")
    begin
        ProdOrder."Sales Order No." := SalesLine."Document No.";
    end;


    [EventSubscriber(ObjectType::Table, 83, 'OnBeforeVerifyReservedQty', '', false, false)]
    local procedure OnBeforeVerifyReservedQty(var ItemJournalLine: Record "Item Journal Line"; xItemJournalLine: Record "Item Journal Line"; CalledByFieldNo: Integer)
    var
        grecItemJnlBatch: Record "Item Journal Batch";
    begin
        if grecItemJnlBatch.Get(ItemJournalLine."Journal Template Name", ItemJournalLine."Journal Batch Name") then begin
            if grecItemJnlBatch."Gen. Prod Posting Group" <> '' then
                ItemJournalLine."Gen. Prod. Posting Group" := grecItemJnlBatch."Gen. Prod Posting Group";
        end;

        if ItemJournalLine."Item No." = '' then
            ItemJournalLine."Gen. Prod. Posting Group" := '';
    end;


    /* [EventSubscriber(ObjectType::Codeunit, 23, 'OnPostLinesOnAfterPostLine', '', false, false)]
    local procedure OnPostLinesOnAfterPostLine(var ItemJournalLine: Record "Item Journal Line"; var SuppressCommit: Boolean)
    begin
        ItemJournalLine."Qty Issued" := ItemJournalLine.Quantity;
    end; */


    [EventSubscriber(ObjectType::Codeunit, 260, 'OnBeforeSendEmail', '', false, false)]
    local procedure OnBeforeSendEmail(var TempEmailItem: Record "Email Item" temporary; var IsFromPostedDoc: Boolean; var PostedDocNo: Code[20]; var HideDialog: Boolean; var ReportUsage: Integer; var EmailSentSuccesfully: Boolean; var IsHandled: Boolean; EmailDocName: Text[250]; SenderUserID: Code[50]; EmailScenario: Enum "Email Scenario")
    var
        txtCRLF: array[2] of Text;
    begin
        txtCRLF[1] := '10';
        txtCRLF[2] := '12';

        TempEmailItem.SetBodyText('Dear Sir/Madam,' + '<br><br>' + 'Kindly find attached your electronic invoice.' + '<br><br>' + 'Kind Regards,');
    end;


    [EventSubscriber(ObjectType::Codeunit, 23, 'OnPostLinesOnAfterPostLine', '', false, false)]
    local procedure OnPostLinesOnAfterPostLine(var ItemJournalLine: Record "Item Journal Line"; var SuppressCommit: Boolean)
    var
        grecProdOrderComponent: Record "Prod. Order Component";
        grecProdOrderComponent2: Record "Prod. Order Component";
        gintLineNo: Integer;
        grecItemLedgerEntry: Record "Item Ledger Entry";
    begin
        if (ItemJournalLine."Entry Type" = ItemJournalLine."Entry Type"::Consumption) and (ItemJournalLine."Prod. Order Comp. Line No." = 0) then begin
            gintLineNo := 0;
            grecProdOrderComponent2.Reset();
            grecProdOrderComponent2.SetRange("Prod. Order No.", ItemJournalLine."Order No.");
            grecProdOrderComponent2.SetRange("Prod. Order Line No.", ItemJournalLine."Order Line No.");
            if grecProdOrderComponent2.FindLast() then
                gintLineNo := grecProdOrderComponent2."Line No." + 10000
            else
                gintLineNo += 10000;


            grecProdOrderComponent.Init();
            grecProdOrderComponent."Line No." := gintLineNo;
            grecProdOrderComponent.Status := grecProdOrderComponent.Status::Released;
            grecProdOrderComponent."Prod. Order No." := ItemJournalLine."Order No.";
            grecProdOrderComponent."Prod. Order Line No." := ItemJournalLine."Order Line No.";
            grecProdOrderComponent.Validate("Item No.", ItemJournalLine."Item No.");
            grecProdOrderComponent."Location Code" := 'ADMN';
            grecProdOrderComponent.Insert;


            grecItemLedgerEntry.reset;
            grecItemLedgerEntry.SetCurrentKey("Entry No.");
            grecItemLedgerEntry.SetRange("Entry Type", grecItemLedgerEntry."Entry Type"::Consumption);
            grecItemLedgerEntry.SetRange("Document No.", ItemJournalLine."Order No.");
            grecItemLedgerEntry.SetRange("Item No.", ItemJournalLine."Item No.");
            if grecItemLedgerEntry.FindSet then begin
                repeat
                    grecItemLedgerEntry."Prod. Order Comp. Line No." := grecProdOrderComponent."Line No.";
                    grecItemLedgerEntry.Modify;
                until grecItemLedgerEntry.Next = 0;
            end;
        end;
    end;


    [EventSubscriber(ObjectType::Report, 99001015, 'OnBeforeReqWkshLineInsert', '', false, false)]
    local procedure OnBeforeReqWkshLineInsert(var RequisitionLine: Record "Requisition Line"; ProdOrderLine: Record "Prod. Order Line")
    begin
        RequisitionLine."Location Code" := 'ADMN';
    end;


    [EventSubscriber(ObjectType::Report, 5899, 'OnAfterInitItemJnlLine', '', false, false)]
    local procedure OnAfterInitItemJnlLine(var ItemJournalLine: Record "Item Journal Line")
    begin
        ItemJournalLine."Location Code" := 'ADMN';
    end;


    [EventSubscriber(ObjectType::Codeunit, 23, 'OnPostLinesOnBeforePostLine', '', false, false)]
    local procedure OnPostLinesOnBeforePostLine(var ItemJournalLine: Record "Item Journal Line"; var SuppressCommit: Boolean)
    begin
        if ItemJournalLine."Location Code" = '' then
            Error('Location Code can not be blank on line %1', ItemJournalLine."Line No.");
    end;


    [EventSubscriber(ObjectType::Codeunit, 333, 'OnAfterFinalizeOrderHeader', '', false, false)]
    local procedure OnAfterFinalizeOrderHeader(var PurchHeader: Record "Purchase Header"; var ReqLine: Record "Requisition Line")
    begin
        PurchHeader."Comment 2" := ReqLine.Comment;
        PurchHeader."Production Order" := ReqLine."Production Order";
        PurchHeader.Modify();
    end;


    [EventSubscriber(ObjectType::table, 83, 'OnBeforeTestItemFields', '', false, false)]
    local procedure OnBeforeTestItemFields(var ItemJournalLine: Record "Item Journal Line"; ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]; var IsHandled: Boolean)
    begin
        //LocationCode := 'ADMN';
        //IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, 99000837, 'OnTransferPOLineToItemJnlLineOnBeforeHandleItemTrackingOutput', '', false, false)]
    local procedure OnTransferPOLineToItemJnlLineOnBeforeHandleItemTrackingOutput(var OldProdOrderLine: Record "Prod. Order Line"; var NewItemJnlLine: Record "Item Journal Line"; var OldReservEntry: Record "Reservation Entry"; var IsHandled: Boolean)
    begin
        OldProdOrderLine."Location Code" := 'ADMN';
        OldProdOrderLine.Modify;
    end;
}