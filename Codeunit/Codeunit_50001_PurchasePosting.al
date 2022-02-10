codeunit 50001 "Purchase Posting"
{
    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePostLines', '', false, false)]
    Procedure ValidateVATPostingGroup(VAR PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header"; PreviewMode: Boolean; CommitIsSupressed: Boolean)
    begin
        if PurchLine.findset() then begin
            repeat
                IF (PurchLine.Type <> PurchLine.Type::" ") and (PurchLine."No." <> '') then
                    PurchLine.TestField("Vat Prod. Posting Group");
            until PurchLine.Next() = 0;
        end;
    end;


    procedure OnConfirmPurchPost(Var PurchaseHeader: Record "Purchase Header"): Boolean
    begin
        with PurchaseHeader do begin
            IF PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order THEN begin
                if PurchaseHeader.Status <> PurchaseHeader.Status::Released then
                    Error('Purchase Order is not released. You cannot proceed.');
                IF UserSetup.GET(USERID) THEN BEGIN
                    CASE UserSetup."Purchase Order Posting" OF
                        UserSetup."Purchase Order Posting"::" ":
                            ERROR('Does not have permission to post. Contact administator to change permission.');

                        UserSetup."Purchase Order Posting"::Receive:
                            BEGIN
                                Selection := STRMENU(TextReceive, 1);
                                IF Selection = 0 THEN
                                    exit(false);
                                Receive := Selection IN [1, 1];
                                Invoice := false;
                            END;

                        UserSetup."Purchase Order Posting"::Invoice:
                            BEGIN
                                Selection := STRMENU(TextInvoice, 1);
                                IF Selection = 0 THEN
                                    exit(false);
                                Invoice := Selection IN [1, 1];
                                Receive := false;
                            END;

                        UserSetup."Purchase Order Posting"::"Receive and Invoice":
                            BEGIN
                                Selection := STRMENU(TextReceiveInvoice, 1);
                                IF Selection = 0 THEN
                                    exit(false);
                                Receive := TRUE;
                                Invoice := TRUE;
                            END;
                        UserSetup."Purchase Order Posting"::All:
                            BEGIN
                                Selection := STRMENU(ReceiveInvoiceQst, 3);
                                IF Selection = 0 THEN
                                    exit(false);
                                Receive := Selection IN [1, 3];
                                Invoice := Selection IN [2, 3];
                            END;
                    END;
                END;
                exit(true);
            End;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, 91, 'OnBeforeConfirmPost', '', false, false)]
    procedure ChangePostSelection(VAR PurchaseHeader: Record "Purchase Header"; VAR HideDialog: Boolean; VAR IsHandled: Boolean; VAR DefaultOption: Integer)
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then begin
            HideDialog := true;
            IF not OnConfirmPurchPost(PurchaseHeader) then
                IsHandled := true;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, 92, 'OnBeforeConfirmPost', '', false, false)]
    procedure ChangePurchPostSeletion(VAR PurchaseHeader: Record "Purchase Header"; VAR HideDialog: Boolean; VAR IsHandled: Boolean)
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then begin
            HideDialog := true;
            IF Not OnConfirmPurchPost(PurchaseHeader) then
                IsHandled := true;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePostPurchaseDoc', '', false, false)]
    local procedure CheckPostingDesc(VAR Sender: Codeunit "Purch.-Post"; VAR PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; CommitIsSupressed: Boolean)
    var
        gtextPostingDescError: TextConst ENU = 'Please insert Posting Description.';
    begin
        IF PurchaseHeader."Posting Description" = '' then
            Error(gtextPostingDescError);
    end;


    var
        Selection: Integer;
        UserSetup: Record "User Setup";
        TextReceive: Label '&Receive';
        TextInvoice: Label '&Invoice';
        TextReceiveInvoice: Label 'Receive &and Invoice';
        ReceiveInvoiceQst: Label '&Receive,&Invoice,Receive &and Invoice';
        ReleasePurchaseDocCU: Codeunit "Release Purchase Document";
        PurchaseLine: Record "Purchase Line";
        GLSetup: Record "General Ledger Setup";
}