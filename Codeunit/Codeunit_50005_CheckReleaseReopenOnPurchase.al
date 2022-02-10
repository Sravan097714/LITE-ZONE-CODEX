codeunit 50017 CheckReleaseReopenOnPurchase
{

    [EventSubscriber(ObjectType::Codeunit, 415, 'OnBeforeManualReleasePurchaseDoc', '', false, false)]
    local procedure OnBeforeManualReleasePurchaseDoc(VAR PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean)
    var
        grecUserSetup: Record "User Setup";
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then begin
            grecUserSetup.Reset();
            grecUserSetup.SetRange("User ID", UserId);
            if grecUserSetup.FindFirst then begin
                if grecUserSetup."Can released Purchase Order" then begin
                    PurchaseHeader."Date Time Released" := CurrentDateTime();
                    PurchaseHeader."Released By" := UserId();
                    PurchaseHeader."Date Time Reopened" := 0DT;
                    PurchaseHeader."Reopened By" := '';
                end else
                    error('You do not have access to release purchase orders.')
            end else
                error('You do not have access to release purchase orders.');
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, 415, 'OnBeforeManualReopenPurchaseDoc', '', false, false)]
    local procedure OnBeforeManualReopenPurchaseDoc(VAR PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean)
    var
        grecUserSetup: Record "User Setup";
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then begin
            grecUserSetup.Reset();
            grecUserSetup.SetRange("User ID", UserId);
            if grecUserSetup.FindFirst then begin
                if grecUserSetup."Can reopen Purchase Order" then begin
                    if PurchaseHeader.Status = PurchaseHeader.Status::Released then begin
                        PurchaseHeader."Date Time Released" := 0DT;
                        PurchaseHeader."Released By" := '';
                        PurchaseHeader."Date Time Reopened" := CurrentDateTime();
                        PurchaseHeader."Reopened By" := UserId();
                    end;
                end else
                    error('You do not have access to reopen purchase orders.');
            end else
                error('You do not have access to reopen purchase orders.');
        end;
    end;
}