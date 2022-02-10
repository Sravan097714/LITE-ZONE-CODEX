codeunit 50002 "Sales Posting"
{
    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforePostLines', '', false, false)]
    Procedure ValidateVATProdPostingGroup(VAR SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    begin
        if SalesLine.findset() then
            repeat
                IF (SalesLine.Type <> SalesLine.Type::" ") and (SalesLine."No." <> '') then
                    SalesLine.TestField("Vat Prod. Posting Group");

            until SalesLine.Next() = 0;
    end;


    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforePostSalesDoc', '', false, false)]
    local procedure CheckPostingDesc(VAR Sender: Codeunit "Sales-Post"; VAR SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    var
        gtextPostingDescError: TextConst ENU = 'Please insert Posting Description.';
    begin
        IF SalesHeader."Posting Description" = '' then
            Error(gtextPostingDescError);
    end;



    [EventSubscriber(ObjectType::Codeunit, 81, 'OnBeforeConfirmSalesPost', '', false, false)]
    procedure ChangePostSelection(VAR SalesHeader: Record "Sales Header"; VAR HideDialog: Boolean; VAR IsHandled: Boolean; VAR DefaultOption: Integer)
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            HideDialog := true;
            IF not OnConfirmSalesPost(SalesHeader) then
                IsHandled := true;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, 82, 'OnBeforeConfirmPost', '', false, false)]
    procedure ChangeSalesPostSeletion(VAR SalesHeader: Record "Sales Header"; VAR HideDialog: Boolean; VAR IsHandled: Boolean)
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            HideDialog := true;
            IF Not OnConfirmSalesPost(SalesHeader) then
                IsHandled := true;
        end;
    end;


    procedure OnConfirmSalesPost(Var SalesHeader: Record "Sales Header"): Boolean
    var
        Selection: Integer;
        UserSetup: Record "User Setup";
        TextReceive: Label '&Ship';
        TextInvoice: Label '&Invoice';
        TextReceiveInvoice: Label 'Ship &and Invoice';
        ReceiveInvoiceQst: Label '&Ship,&Invoice,Ship &and Invoice';

    begin
        with SalesHeader do begin
            IF SalesHeader."Document Type" = SalesHeader."Document Type"::Order THEN begin
                if SalesHeader.Status <> SalesHeader.Status::Released then
                    Error('Sales Order is not released. You cannot proceed.');
                IF UserSetup.GET(USERID) THEN BEGIN
                    CASE UserSetup."Sales Order Posting" OF
                        UserSetup."Sales Order Posting"::" ":
                            ERROR('Does not have permission to post. Contact administator to change permission.');

                        UserSetup."Sales Order Posting"::Ship:
                            BEGIN
                                Selection := STRMENU(TextReceive, 1);
                                IF Selection = 0 THEN
                                    exit(false);
                                Ship := Selection IN [1, 1];
                                Invoice := false;
                            END;

                        UserSetup."Sales Order Posting"::Invoice:
                            BEGIN
                                Selection := STRMENU(TextInvoice, 1);
                                IF Selection = 0 THEN
                                    exit(false);
                                Invoice := Selection IN [1, 1];
                                Ship := false;
                            END;

                        UserSetup."Sales Order Posting"::"Ship and Invoice":
                            BEGIN
                                Selection := STRMENU(TextReceiveInvoice, 1);
                                IF Selection = 0 THEN
                                    exit(false);
                                Ship := TRUE;
                                Invoice := TRUE;
                            END;
                        UserSetup."Sales Order Posting"::All:
                            BEGIN
                                Selection := STRMENU(ReceiveInvoiceQst, 3);
                                IF Selection = 0 THEN
                                    exit(false);
                                Ship := Selection IN [1, 3];
                                Invoice := Selection IN [2, 3];
                            END;
                    END;
                END;
                exit(true);
            End;
        end;
    end;
}