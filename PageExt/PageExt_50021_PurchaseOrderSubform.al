pageextension 50021 PurchaseOrderSubformExt extends "Purchase Order Subform"
{
    layout
    {
        modify(Type)
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Line No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Location Code")
        {
            Visible = true;
        }
        modify("No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(FilteredTypeField)
        {
            Visible = false;
        }
        modify("Line Discount %")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Promised Receipt Date")
        {
            Visible = false;
        }
        modify("Requested Receipt Date")
        {
            Visible = false;
        }
        modify("Drop Shipment")
        {
            Visible = false;
        }
        modify("Variant Code")
        {
            Visible = false;
        }
        modify("Blanket Order Line No.")
        {
            Visible = false;

        }
        modify("Blanket Order No.")
        {
            Visible = false;

        }
        modify("Bin Code")
        {
            Visible = false;
        }

        modify("Line Discount Amount")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Reserved Quantity")
        {
            Editable = true;
            ApplicationArea = All;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Qty. Assigned")
        {
            Visible = false;
        }
        modify("Planned Receipt Date")
        {
            Visible = false;
        }
        modify("Expected Receipt Date")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Unit of Measure Code")
        {
            Visible = true;
        }
        moveafter(Quantity; "Unit of Measure Code")
        modify("Prod. Order No.")
        {
            Editable = true;
            ApplicationArea = All;
            Visible = true;
        }
        modify("Work Center No.")
        {
            Editable = true;
            ApplicationArea = All;
        }
        modify("Over-Receipt Code")
        {
            Visible = false;
        }
        modify("Over-Receipt Quantity")
        {
            Visible = false;
        }
        modify("Direct Unit Cost")
        {
            trigger OnAfterValidate()
            var
                PurchLineRec: Record "Purchase Line";
                PurchaseLine: Record "Purchase Line";
                grecGLAccount: Record "G/L Account";
                PurchAmount: Decimal;
                OrigBudget: Decimal;
                gtextBudgetError: Label 'Purchase order line with %1 %2 exceeds remaining budgeted amount.';
                grecPurchHdr: Record "Purchase Header";
                gdecRemainingBudget: Decimal;
            begin
                /* if ("Document Type" = "Document Type"::Order) then begin
                    Clear(PurchAmount);
                    IF Type = Type::"G/L Account" then begin
                        PurchaseLine.RESET;
                        PurchaseLine.SETRANGE("Document Type", "Document Type"::Order);
                        PurchaseLine.SETRANGE(Type, Type::"G/L Account");
                        PurchaseLine.SETRANGE("No.", "No.");
                        IF PurchaseLine.FINDSET THEN BEGIN
                            REPEAT
                                if grecPurchHdr.get(PurchaseLine."Document Type", PurchaseLine."Document No.") then begin
                                    if grecPurchHdr."Prices Including VAT" then
                                        PurchAmount += PurchaseLine."Total Amount Excl VAT"
                                    else
                                        PurchAmount += PurchaseLine."Line Amount";
                                end;
                            UNTIL PurchaseLine.NEXT = 0;
                        END;

                        PurchaseLine.RESET;
                        PurchaseLine.SETRANGE("Document Type", "Document Type"::Order);
                        PurchaseLine.SETRANGE(Type, Type::"Fixed Asset");
                        PurchaseLine.SETRANGE("FA Aquisition", Rec."No.");
                        IF PurchaseLine.FINDSET THEN BEGIN
                            REPEAT
                                if grecPurchHdr.get(PurchaseLine."Document Type", PurchaseLine."Document No.") then begin
                                    if grecPurchHdr."Prices Including VAT" then
                                        PurchAmount += PurchaseLine."Total Amount Excl VAT"
                                    else
                                        PurchAmount += PurchaseLine."Line Amount";
                                end;
                            UNTIL PurchaseLine.NEXT = 0;
                        END;

                        PurchaseLine.RESET;
                        PurchaseLine.SETRANGE("Document Type", "Document Type"::Order);
                        PurchaseLine.SETRANGE(Type, Type::"Fixed Asset");
                        PurchaseLine.SETRANGE("FA Aquisition 2", Rec."No.");
                        IF PurchaseLine.FINDSET THEN BEGIN
                            REPEAT
                                if grecPurchHdr.get(PurchaseLine."Document Type", PurchaseLine."Document No.") then begin
                                    if grecPurchHdr."Prices Including VAT" then
                                        PurchAmount += PurchaseLine."Total Amount Excl VAT"
                                    else
                                        PurchAmount += PurchaseLine."Line Amount";
                                end;
                            UNTIL PurchaseLine.NEXT = 0;
                        END;
                    end;


                    IF Type = Type::"Fixed Asset" then begin
                        PurchaseLine.RESET;
                        PurchaseLine.SETRANGE("Document Type", "Document Type"::Order);
                        PurchaseLine.SETRANGE(Type, Type::"G/L Account");
                        PurchaseLine.SETFILTER("No.", '%1|%2', Rec."FA Aquisition", Rec."FA Aquisition 2");
                        IF PurchaseLine.FINDSET THEN BEGIN
                            REPEAT
                                if grecPurchHdr.get(PurchaseLine."Document Type", PurchaseLine."Document No.") then begin
                                    if grecPurchHdr."Prices Including VAT" then
                                        PurchAmount += PurchaseLine."Total Amount Excl VAT"
                                    else
                                        PurchAmount += PurchaseLine."Line Amount";
                                end;
                            UNTIL PurchaseLine.NEXT = 0;
                        END;

                        PurchaseLine.RESET;
                        PurchaseLine.SETRANGE("Document Type", "Document Type"::Order);
                        PurchaseLine.SETRANGE(Type, Type::"Fixed Asset");
                        PurchaseLine.SETFILTER("FA Aquisition", '%1|%2', Rec."FA Aquisition", Rec."FA Aquisition 2");
                        PurchaseLine.SETFILTER("FA Aquisition 2", '%1|%2', Rec."FA Aquisition", Rec."FA Aquisition 2");
                        IF PurchaseLine.FINDSET THEN BEGIN
                            REPEAT
                                if grecPurchHdr.get(PurchaseLine."Document Type", PurchaseLine."Document No.") then begin
                                    if grecPurchHdr."Prices Including VAT" then
                                        PurchAmount += PurchaseLine."Total Amount Excl VAT"
                                    else
                                        PurchAmount += PurchaseLine."Line Amount";
                                end;
                            UNTIL PurchaseLine.NEXT = 0;
                        END;
                    end;


                    if PurchAmount <> 0 then
                        PurchAmount := Round(PurchAmount, 0.01, '>');


                    clear(gdecRemainingBudget);
                    IF Type = Type::"G/L Account" then begin
                        grecBudgetByDepartment.Reset();
                        grecBudgetByDepartment.SetRange("G/L Account No.", "No.");
                        grecBudgetByDepartment.SetRange(Department, "Shortcut Dimension 1 Code");
                        if grecBudgetByDepartment.FindFirst() then begin
                            gdecRemainingBudget := grecBudgetByDepartment."Remaining Amount" - PurchAmount;
                        end;
                    end;

                    IF Type = Type::"Fixed Asset" then begin
                        grecBudgetByDepartment.Reset();
                        grecBudgetByDepartment.SetFilter("G/L Account No.", '%1|%2', "FA Aquisition", "FA Aquisition 2");
                        grecBudgetByDepartment.SetRange(Department, "Shortcut Dimension 1 Code");
                        if grecBudgetByDepartment.FindFirst() then begin
                            repeat
                                gdecRemainingBudget += grecBudgetByDepartment."Remaining Amount";
                            until grecBudgetByDepartment.Next = 0;
                            gdecRemainingBudget -= PurchAmount;
                        end;
                    end;

                    PurchAmount += ("Direct Unit Cost" * Quantity);

                    IF PurchAmount > OrigBudget THEN
                        Message(gtextBudgetError, Type, "No.");
                end;
             */
            end;
        }


        addafter("No.")
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = all;
            }
        }

        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                Editable = true;
                ApplicationArea = All;
            }
        }
        addlast(Control1)
        {
            field("Depreciation Book Code"; "Depreciation Book Code")
            {
                ApplicationArea = all;
                Editable = true;
            }
        }

        movefirst(Control1; "Line No.")
        moveafter("Gen. Prod. Posting Group"; "VAT Prod. Posting Group")
        moveafter("Line Discount %"; "Line Discount Amount")

    }
}