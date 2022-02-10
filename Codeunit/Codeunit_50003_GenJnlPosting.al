codeunit 50003 GenJnlPosting
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Codeunit, 13, 'OnBeforePostGenJnlLine', '', false, false)]
    local procedure MyProcedureSavePVNumber(VAR GenJournalLine: Record "Gen. Journal Line"; CommitIsSuppressed: Boolean; VAR Posted: Boolean)
    var
        grecGenJnlBatchName: Record "Gen. Journal Batch";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        grecGenJnlBatchName.Reset;
        grecGenJnlBatchName.SetRange("Journal Template Name", GenJournalLine."Journal Template Name");
        grecGenJnlBatchName.SetRange(Name, GenJournalLine."Journal Batch Name");
        grecGenJnlBatchName.Setfilter(grecGenJnlBatchName."PV No. Series", '<>%1', '');
        if grecGenJnlBatchName.FindFirst then
            gcodePVNumber := NoSeriesMgt.GetNextNo(grecGenJnlBatchName."PV No. Series", Today, TRUE)
        else
            Clear(gcodePVNumber);
    end;


    [EventSubscriber(ObjectType::Codeunit, 12, 'OnAfterInitGLEntry', '', false, false)]
    local procedure InsertinGLEntry(VAR GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry."PV Number" := gcodePVNumber;
        GLEntry."Creation Date" := Today;
        GLEntry."Bank Name for Cheque" := GenJournalLine."Bank Name for Cheque";
        GLEntry."TDS Code" := GenJournalLine."TDS Code";
    end;


    [EventSubscriber(ObjectType::Codeunit, 12, 'OnAfterInitBankAccLedgEntry', '', false, false)]
    local procedure InsertinBankAccLedgerEntry(VAR BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        BankAccountLedgerEntry."PV Number" := gcodePVNumber;
        BankAccountLedgerEntry."Bank Name for Cheque" := GenJournalLine."Bank Name for Cheque";
        BankAccountLedgerEntry."TDS Code" := GenJournalLine."TDS Code";
    end;


    [EventSubscriber(ObjectType::Codeunit, 12, 'OnAfterInitVendLedgEntry', '', false, false)]
    local procedure InsertinVendLedgerEntry(VAR VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VendorLedgerEntry."PV Number" := gcodePVNumber;
        VendorLedgerEntry."TDS Code" := GenJournalLine."TDS Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, 12, 'OnAfterInitCustLedgEntry', '', false, false)]
    local procedure InsertinCustLedgerEntry(VAR CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry."Bank Name for Cheque" := GenJournalLine."Bank Name for Cheque";
    end;


    //Phys. Inventory Journal changes
    [EventSubscriber(ObjectType::Report, Report::"Calculate Inventory", 'OnBeforeInsertItemJnlLine', '', false, false)]
    local procedure OnBeforeInsertItemJnlLine(var ItemJournalLine: Record "Item Journal Line"; var InventoryBuffer: Record "Inventory Buffer");
    var
        Item: Record Item;
    begin
        if Item.Get(ItemJournalLine."Item No.") then begin
            ItemJournalLine."Item No.2" := Item."No. 2";
            ItemJournalLine."Shelf No." := Item."Shelf No.";
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertPhysInvtLedgEntry', '', false, false)]
    local procedure OnBeforeInsertPhysInvtLedgEntry(var PhysInventoryLedgerEntry: Record "Phys. Inventory Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        PhysInventoryLedgerEntry."Item No.2" := ItemJournalLine."Item No.2";
        PhysInventoryLedgerEntry."Shelf No." := ItemJournalLine."Shelf No.";
        PhysInventoryLedgerEntry."Qty Modified" := ItemJournalLine."Qty. Phys. Inventory modified";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]
    local procedure OnBeforeInsertItemLedgEntry(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; TransferItem: Boolean; OldItemLedgEntry: Record "Item Ledger Entry")
    begin
        ItemLedgerEntry."Item No.2" := ItemJournalLine."Item No.2";
        ItemLedgerEntry."Shelf No." := ItemJournalLine."Shelf No.";
        ItemLedgerEntry."Qty Modified" := ItemJournalLine."Qty. Phys. Inventory modified";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertValueEntry', '', false, false)]
    local procedure OnBeforeInsertValueEntry(var ValueEntry: Record "Value Entry"; ItemJournalLine: Record "Item Journal Line"; var ItemLedgerEntry: Record "Item Ledger Entry"; var ValueEntryNo: Integer; var InventoryPostingToGL: Codeunit "Inventory Posting To G/L"; CalledFromAdjustment: Boolean)
    begin
        ValueEntry."Item No.2" := ItemJournalLine."Item No.2";
        ValueEntry."Shelf No." := ItemJournalLine."Shelf No.";
        ValueEntry."Qty Modified" := ItemJournalLine."Qty. Phys. Inventory modified";
    end;

    var
        gcodePVNumber: Code[20];
}