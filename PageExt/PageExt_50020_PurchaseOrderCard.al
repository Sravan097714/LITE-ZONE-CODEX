pageextension 50020 PurchOrderCardExt extends "Purchase Order"
{
    layout
    {
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }
        modify("Document Date")
        {
            Visible = true;
        }
        modify("Purchaser Code")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Liable")
        {
            Visible = false;
        }
        modify("No. of Archived Versions")
        {
            Visible = false;
        }
        modify("Vendor Order No.")
        {
            Caption = 'Reason for Closing Purchase Order';
        }
        modify("Vendor Shipment No.")
        {
            Visible = false;
        }
        modify("Buy-from County")
        {
            Visible = false;
        }
        modify("Buy-from Contact No.")
        {
            Visible = false;
        }
        modify("Order Address Code")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Currency Code")
        {
            Visible = true;
        }
        modify("Payment Method Code")
        {
            Visible = false;
        }
        movelast(General; "Currency Code")
        modify("Shipping and Payment")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = true;
        }
        movelast(General; "Location Code")
        modify("Foreign Trade")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify("Expected Receipt Date")
        {
            Visible = false;
        }
        modify("Prices Including VAT")
        {
            Visible = false;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Payment Terms Code")
        {
            Visible = false;
        }
        modify("Payment Discount %")
        {
            Visible = false;
        }
        modify("Pmt. Discount Date")
        {
            Visible = false;
        }
        modify("Shipment Method Code")
        {
            Visible = false;
        }
        modify("Payment Reference")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("On Hold")
        {
            Visible = false;
        }
        modify("Inbound Whse. Handling Time")
        {
            Visible = false;
        }
        modify("Lead Time Calculation")
        {
            Visible = false;
        }
        modify("Requested Receipt Date")
        {
            Visible = false;
        }
        modify("Promised Receipt Date")
        {
            Visible = false;
        }
        modify("Posting Description")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(Prepayment)
        {
            Visible = false;
        }
        modify("Transaction Specification")
        {
            Visible = false;
        }
        modify("Transaction Type")
        {
            Visible = false;
        }
        modify("Transport Method")
        {
            Visible = false;
        }
        modify("Entry Point")
        {
            Visible = false;
        }
        modify("Area")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify("Quote No.")
        {
            Visible = false;
        }

        addlast(General)
        {
            field(BRN; Rec.BRN)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = All;
            }
            field("Released By"; Rec."Released By")
            {
                ApplicationArea = All;
            }
            field("Date Time Released"; Rec."Date Time Released")
            {
                ApplicationArea = All;
            }
            field("Reopened By"; Rec."Reopened By")
            {
                ApplicationArea = All;
            }
            field("Date Time Reopened"; Rec."Date Time Reopened")
            {
                ApplicationArea = All;
            }
            field("No. Printed"; "No. Printed")
            {
                ApplicationArea = All;
            }
            field("Comment 2"; "Comment 2") { ApplicationArea = All; }
            field("Production Order"; "Production Order") { ApplicationArea = All; }
        }


        addlast("Invoice Details")
        {
            field("Pay-to Vendor No."; "Pay-to Vendor No.") { ApplicationArea = All; }
        }
        moveafter("Pay-to Vendor No."; "Pay-to Name")
        moveafter("Pay-to Vendor No."; "Pay-to Address")
        moveafter("Pay-to Vendor No."; "Pay-to Address 2")

        moveafter("Order Date"; "Posting Date")
        moveafter("Posting Date"; "Due Date")

        movebefore("Order Date"; "Location Code")
        movebefore("Location Code"; "Currency Code")
        moveafter("Due Date"; "Vendor Invoice No.")
    }

    actions
    {
        modify("&Print")
        {
            trigger OnBeforeAction()
            var
                gtextError: TextConst ENU = 'Purchase Order should be released before printing.';
            begin
                if Rec.Status <> Rec.Status::Released then
                    error(gtextError);
            end;
        }

        addlast("O&rder")
        {
            action("Close Purchase Order")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category8;
                Image = Cancel;

                trigger OnAction()
                var
                    gcuArchivePO: Codeunit ArchivePurchOrder;
                begin
                    if grecUserSetup.Get(UserId) then begin
                        if grecUserSetup."Can Close Purchase Order" then begin
                            IF Rec."Vendor Order No." = '' then
                                ERROR(gtextVendorOrderNo);
                            IF Confirm(gtextConfirm, true, Rec."No.") then begin
                                grecPurchLine.Reset();
                                grecPurchLine.SetRange("Document No.", Rec."No.");
                                if grecPurchLine.FindSet() then begin
                                    repeat
                                        if grecPurchLine."Quantity Received" <> grecPurchLine."Quantity Invoiced" then
                                            Error(gtextError1, grecPurchLine."Line No.");
                                    until grecPurchLine.Next() = 0;
                                end;

                                gcuArchivePO.CheckifCancelled(true);
                                gcuArchiveManagement.StorePurchDocument(Rec, false);
                                gcuArchivePO.ClearCancelled();
                                gcodePurchNo := Rec."No.";

                                grecPurchLine2.Reset();
                                grecPurchLine2.SetRange("Document No.", Rec."No.");
                                grecPurchLine2.DeleteAll();

                                if grecPurchHdr.get(grecPurchHdr."Document Type"::Order, Rec."No.") then
                                    grecPurchHdr.Delete();

                                Message(gtextArchive, Rec."No.");
                            end;
                        end else
                            Error('You do not have permission to Close Purchase Order.');
                    end else
                        Error('You do not have permission to Close Purchase Order.');
                end;
            }
        }
    }

    var
        grecPurchLine: Record "Purchase Line";
        gtextConfirm: TextConst ENU = 'Do you want to close Purchase Order No. %1?';
        gtextError1: TextConst ENU = 'Fields "Qty Received" and "Qty Invoiced" are not the same on Line No. %1.';
        gcuArchiveManagement: Codeunit ArchiveManagement;
        gtextArchive: TextConst ENU = 'The Purchase Order No. %1 has been closed.';
        gtextVendorOrderNo: TextConst ENU = 'Please insert Reason for Closing Purchase Order.';
        gcodePurchNo: Code[20];
        grecPurchHdr: Record "Purchase Header";
        grecPurchLine2: Record "Purchase Line";
        grecUserSetup: Record "User Setup";
}