page 50003 "Adminstrative Tasks"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Permissions = tabledata "Sales Invoice Header" = rim, tabledata "Accounting Period" = rim;


    layout
    {
        area(Content)
        {
            group("Filter")
            {
                field("Document No."; gtextDocNo)
                {
                    ApplicationArea = All;
                }
                field("Item No."; gtextItemNo)
                {
                    ApplicationArea = All;
                }
                field("Entry Type"; goptEntryType)
                {
                    ApplicationArea = All;
                }
                /* field("Order No."; gtextOrderNo)
                {
                    ApplicationArea = All;
                } */
                field("Posting Date"; gdatePostingDate)
                {
                    ApplicationArea = All;
                }
                field("Prod Order Line No"; gtextProdOrderLineNo)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Update Payment terms Code - Customer")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    grecCustomer: Record Customer;
                begin
                    grecCustomer.Reset();
                    grecCustomer.SetRange("No.");
                    if grecCustomer.FindSet then begin
                        repeat
                            grecCustomer."Payment Terms Code" := '30D';
                            grecCustomer.Modify();
                        until grecCustomer.Next = 0;
                        Message('Payment Terms Code updated for all customers.');
                    end;
                end;
            }


            action("Update Payment terms Code - Vendor")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    grecVendor: Record Vendor;
                begin
                    grecVendor.Reset();
                    grecVendor.SetRange("No.");
                    if grecVendor.FindSet then begin
                        repeat
                            grecVendor."Payment Terms Code" := '30D';
                            grecVendor.Modify();
                        until grecVendor.Next = 0;
                        Message('Payment Terms Code updated for all vendors.');
                    end;
                end;
            }


            action("Update Global Dimension - HO")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    grecGLEntry: Record "G/L Entry";
                    grecCustLedgEntry: Record "Cust. Ledger Entry";
                    grecDetailedCustLedgerEntry: Record "Detailed Cust. Ledg. Entry";
                    grecBankAccLedgEntry: Record "Bank Account Ledger Entry";
                begin
                    grecGLEntry.Reset();
                    grecGLEntry.SetFilter("Document No.", gtextDocNo);
                    grecGLEntry.ModifyAll("Global Dimension 2 Code", 'HO');

                    grecCustLedgEntry.Reset();
                    grecCustLedgEntry.SetFilter("Document No.", gtextDocNo);
                    grecCustLedgEntry.ModifyAll("Global Dimension 2 Code", 'HO');

                    grecDetailedCustLedgerEntry.Reset();
                    grecDetailedCustLedgerEntry.SetFilter("Document No.", gtextDocNo);
                    grecDetailedCustLedgerEntry.ModifyAll("Initial Entry Global Dim. 2", 'HO');

                    grecBankAccLedgEntry.Reset();
                    grecBankAccLedgEntry.SetFilter("Document No.", gtextDocNo);
                    grecBankAccLedgEntry.ModifyAll("Global Dimension 2 Code", 'HO');

                    Message('Global Dimension 2 code has been updated.');
                end;
            }


            action("Update Global Dimension - MEMBER SUBSCRIP")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    grecGLEntry: Record "G/L Entry";
                    grecCustLedgEntry: Record "Cust. Ledger Entry";
                    grecDetailedCustLedgerEntry: Record "Detailed Cust. Ledg. Entry";
                    grecBankAccLedgEntry: Record "Bank Account Ledger Entry";
                begin
                    grecGLEntry.Reset();
                    grecGLEntry.SetFilter("Document No.", gtextDocNo);
                    grecGLEntry.ModifyAll("Global Dimension 2 Code", 'MEMBER SUBSCRIP');

                    grecCustLedgEntry.Reset();
                    grecCustLedgEntry.SetFilter("Document No.", gtextDocNo);
                    grecCustLedgEntry.ModifyAll("Global Dimension 2 Code", 'MEMBER SUBSCRIP');

                    grecDetailedCustLedgerEntry.Reset();
                    grecDetailedCustLedgerEntry.SetFilter("Document No.", gtextDocNo);
                    grecDetailedCustLedgerEntry.ModifyAll("Initial Entry Global Dim. 2", 'MEMBER SUBSCRIP');

                    grecBankAccLedgEntry.Reset();
                    grecBankAccLedgEntry.SetFilter("Document No.", gtextDocNo);
                    grecBankAccLedgEntry.ModifyAll("Global Dimension 2 Code", 'MEMBER SUBSCRIP');

                    Message('Global Dimension 2 code has been updated.');
                end;
            }


            action("Clear Cancelled Info")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    grecPurchHdrArchives: Record "Purchase Header Archive";
                begin
                    grecPurchHdrArchives.Reset();
                    grecPurchHdrArchives.SetRange("No.");
                    if grecPurchHdrArchives.FindFirst() then begin
                        grecPurchHdrArchives.ModifyAll("Cancelled By", '');
                        grecPurchHdrArchives.ModifyAll("Date Cancelled", 0D);
                        grecPurchHdrArchives.ModifyAll("Time Cancelled", 0T);
                    end;
                    Message('Done.');
                end;
            }

            action("Accounting Periods Admin")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = AccountingPeriods;

                trigger OnAction()
                var
                    gpageAccPeriodAdmin: Page "Accounting Periods Admin";
                begin
                    gpageAccPeriodAdmin.Run();
                end;
            }

            action("Payment Journal Admin")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = PaymentJournal;

                trigger OnAction()
                var
                    gpagePaymentJnlAdmin: Page "Payment Journal Admin";
                begin
                    gpagePaymentJnlAdmin.Run();
                end;
            }

            action("Clear No. Printed")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ClearLog;

                trigger OnAction()
                var
                    grecSalesInvHdr: Record "Sales Invoice Header";
                begin
                    grecSalesInvHdr.Reset();
                    grecSalesInvHdr.SetCurrentKey("No.");
                    grecSalesInvHdr.SetFilter("No.", gtextDocNo);
                    if grecSalesInvHdr.FindSet then begin
                        repeat
                            grecSalesInvHdr."No. Printed" := 0;
                            grecSalesInvHdr.Modify;
                        until grecSalesInvHdr.Next = 0;
                        Message('Field "No. Printed" has been cleared on the posted sales invoices.');
                    end;
                end;
            }

            action("Clear Table Item Category")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ClearLog;

                trigger OnAction()
                var
                    grecItemCategory: Record "Item Category";
                begin
                    if confirm('Do you want to clear table Item Categories', true, false) then begin
                        grecItemCategory.DeleteAll();
                        Message('All data has been cleared.');
                    end;
                end;
            }

            action("Clear Item Table")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ClearLog;

                trigger OnAction()
                var
                    grecItemCategory: Record Item;
                begin
                    if confirm('Do you want to clear table Item', true, false) then begin
                        grecItemCategory.DeleteAll();
                        Message('All data has been cleared.');
                    end;
                end;
            }

            action("Clear Table Customer")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ClearLog;

                trigger OnAction()
                var
                    grecItemCategory: Record Customer;
                begin
                    if confirm('Do you want to clear table Customer', true, false) then begin
                        grecItemCategory.DeleteAll();
                        Message('All data has been cleared.');
                    end;
                end;
            }

            action("Clear Table Vendor")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ClearLog;

                trigger OnAction()
                var
                    grecItemCategory: Record Vendor;
                begin
                    if confirm('Do you want to clear table Vendor', true, false) then begin
                        grecItemCategory.DeleteAll();
                        Message('All data has been cleared.');
                    end;
                end;
            }

            action("Clear Table Production BoM Header")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ClearLog;

                trigger OnAction()
                var
                    grecItemCategory: Record "Production BOM Header";
                begin
                    if confirm('Do you want to clear table Production BoM Header', true, false) then begin
                        grecItemCategory.DeleteAll();
                        Message('All data has been cleared.');
                    end;
                end;
            }

            action("Clear Table Production BoM Line")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ClearLog;

                trigger OnAction()
                var
                    grecItemCategory: Record "Production BOM Line";
                begin
                    if confirm('Do you want to clear table Production BoM Line', true, false) then begin
                        grecItemCategory.DeleteAll();
                        Message('All data has been cleared.');
                    end;
                end;
            }
            action("Clear Table Routing Header")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ClearLog;

                trigger OnAction()
                var
                    grecItemCategory: Record "Routing Header";
                begin
                    if confirm('Do you want to clear table Routing Header', true, false) then begin
                        grecItemCategory.DeleteAll();
                        Message('All data has been cleared.');
                    end;
                end;
            }

            action("Clear Table Routing Line")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ClearLog;

                trigger OnAction()
                var
                    grecItemCategory: Record "Routing Line";
                begin
                    if confirm('Do you want to clear table Routing Line', true, false) then begin
                        grecItemCategory.DeleteAll();
                        Message('All data has been cleared.');
                    end;
                end;
            }

            action("Import Item Picture")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = ClearLog;

                trigger OnAction()
                var
                    grecItem: Record Item;
                begin
                    if confirm('Do you want to import item picture', true, false) then begin
                        grecItem.reset;
                        grecItem.SetRange("No.");
                        if grecItem.FindSet then begin
                            repeat
                                if file.Exists('C:\ItemPicture\' + grecItem."No. 2" + '.bmp') then begin
                                    grecItem.Picture.ImportFile('C:\ItemPicture\' + grecItem."No. 2" + '.BMP', 'Item Picture' + format(grecItem."No. 2"));
                                    grecItem.Modify;
                                end;
                            until grecItem.Next = 0;
                            Message('Picture Import completed.');
                        end;
                    end;
                end;
            }


            /* action("Update ILE for Prod Ord Line No.")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = UpdateDescription;

                trigger OnAction()
                var
                    grecItemLedgerEntry: Record "Item Ledger Entry";
                begin
                    if confirm('Do you want to update Item Ledger Entry Prod Ord Line No.?', true, false) then begin
                        grecItemLedgerEntry.reset;
                        grecItemLedgerEntry.SetRange("Document No.", gtextDocNo);
                        grecItemLedgerEntry.SetRange("Item No.", gtextItemNo);
                        grecItemLedgerEntry.SetRange("Entry Type", goptEntryType);
                        //grecItemLedgerEntry.SetRange("Order Line No.", gtextOrderNo);
                        grecItemLedgerEntry.SetRange("Posting Date", gdatePostingDate);
                        if grecItemLedgerEntry.FindSet() then begin
                            repeat
                                //if grecItemLedgerEntry."Prod. Order Comp. Line No." = 0 then begin
                                grecItemLedgerEntry."Prod. Order Comp. Line No." := gtextProdOrderLineNo;
                                grecItemLedgerEntry.Modify;
                            //end
                            until grecItemLedgerEntry.Next = 0;
                            Message('Update Done.');
                        end;
                    end;
                end;
            }
 */
            action("Update Prod Ord Comp Line No.")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = UpdateDescription;

                trigger OnAction()
                var
                    grecProdOrderComponent: Record "Prod. Order Component";
                    grecItemLedgerEntry: Record "Item Ledger Entry";
                begin
                    if confirm('Do you want to update Item Ledger Entry  - Prod Ord Comp Line No.?', true, false) then begin
                        grecProdOrderComponent.reset;
                        grecProdOrderComponent.SetCurrentKey(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.");
                        grecProdOrderComponent.SetRange("Prod. Order No.");
                        if grecProdOrderComponent.FindSet then begin
                            repeat
                                grecItemLedgerEntry.reset;
                                grecItemLedgerEntry.SetCurrentKey("Entry No.");
                                grecItemLedgerEntry.SetRange("Entry Type", grecItemLedgerEntry."Entry Type"::Consumption);
                                grecItemLedgerEntry.SetRange("Document No.", grecProdOrderComponent."Prod. Order No.");
                                grecItemLedgerEntry.SetRange("Item No.", grecProdOrderComponent."Item No.");
                                if grecItemLedgerEntry.FindSet then begin
                                    repeat
                                        grecItemLedgerEntry."Prod. Order Comp. Line No." := grecProdOrderComponent."Line No.";
                                        grecItemLedgerEntry.Modify;
                                    until grecItemLedgerEntry.Next = 0;
                                end;
                            until grecProdOrderComponent.Next = 0;
                            Message('Updates completed.');
                        end;
                    end;
                end;
            }

            action("Create Prod Ord Line Components")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = UpdateDescription;

                trigger OnAction()
                var
                    grecProdOrderComponent: Record "Prod. Order Component";
                    grecProdOrderComponent2: Record "Prod. Order Component";
                    grecProdOrderComponent3: Record "Prod. Order Component";
                    grecItemLedgerEntry: Record "Item Ledger Entry";
                    gintLineNo: Integer;
                    gtextOrderNo: Text;
                    grecProdOrder: Record "Production Order";
                begin
                    Clear(gtextOrderNo);
                    if confirm('Do you want to create Prod Ord Line Component?', true, false) then begin
                        grecItemLedgerEntry.reset;
                        grecItemLedgerEntry.SetCurrentKey("Order Type", "Order No.", "Order Line No.", "Entry Type", "Prod. Order Comp. Line No.");
                        grecItemLedgerEntry.SetRange("Entry Type", grecItemLedgerEntry."Entry Type"::Consumption);
                        //grecItemLedgerEntry.Setfilter("Order No.", '%1|%2', 'WO00049', 'WO00091');
                        grecItemLedgerEntry.SetRange("Prod. Order Comp. Line No.", 0);
                        if grecItemLedgerEntry.FindSet then begin
                            repeat

                                if grecProdOrder.Get(grecProdOrder.Status::Released, grecItemLedgerEntry."Order No.") then begin
                                    if grecItemLedgerEntry."Order No." <> gtextOrderNo then begin
                                        Clear(gintLineNo);
                                        grecProdOrderComponent2.Reset();
                                        grecProdOrderComponent2.SetRange("Prod. Order No.", grecItemLedgerEntry."Order No.");
                                        grecProdOrderComponent2.SetRange("Prod. Order Line No.", grecItemLedgerEntry."Order Line No.");
                                        if grecProdOrderComponent2.FindLast() then
                                            gintLineNo := grecProdOrderComponent2."Line No." + 10000;
                                        gtextOrderNo := grecItemLedgerEntry."Order No.";
                                    end else
                                        gintLineNo += 10000;


                                    grecProdOrderComponent3.Reset();
                                    grecProdOrderComponent3.SetRange("Prod. Order No.", grecItemLedgerEntry."Order No.");
                                    grecProdOrderComponent3.SetRange("Prod. Order Line No.", grecItemLedgerEntry."Order Line No.");
                                    grecProdOrderComponent3.SetRange("Item No.", grecItemLedgerEntry."Item No.");
                                    if not grecProdOrderComponent3.FindFirst then begin

                                        grecProdOrderComponent.Init();
                                        grecProdOrderComponent."Line No." := gintLineNo;
                                        grecProdOrderComponent.Status := grecProdOrderComponent.Status::Released;
                                        grecProdOrderComponent."Prod. Order No." := grecItemLedgerEntry."Order No.";
                                        grecProdOrderComponent."Prod. Order Line No." := grecItemLedgerEntry."Order Line No.";
                                        grecProdOrderComponent.Validate("Item No.", grecItemLedgerEntry."Item No.");
                                        grecProdOrderComponent."Location Code" := 'ADMN';
                                        grecProdOrderComponent.Insert;
                                    end;
                                end;

                            until grecItemLedgerEntry.Next = 0;
                        end;
                        Message('Updates completed.');
                    end;
                end;
            }


            action("Update Location Code")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = UpdateDescription;

                trigger OnAction()
                var
                    grecItemLedgerEntry: Record "Item Ledger Entry";
                    grecValueEntry: Record "Value Entry";
                begin
                    if confirm('Do you want to update location code', true, false) then begin
                        grecItemLedgerEntry.Reset();
                        grecItemLedgerEntry.SetRange("Location Code", '');
                        if grecItemLedgerEntry.FindFirst() then
                            grecItemLedgerEntry.ModifyAll("Location Code", 'ADMN');

                        grecValueEntry.Reset();
                        grecValueEntry.SetRange("Location Code", '');
                        if grecValueEntry.FindFirst() then
                            grecValueEntry.ModifyAll("Location Code", 'ADMN');
                        Message('Updates completed.');
                    end;
                end;
            }

            action("Update Location Code On Reserve Entry")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = UpdateDescription;

                trigger OnAction()
                var
                    grecReservationEntry: Record "Reservation Entry";
                begin
                    if confirm('Do you want to update location code', true, false) then begin
                        grecReservationEntry.Reset();
                        grecReservationEntry.SetRange("Location Code", '');
                        if grecReservationEntry.FindFirst() then
                            grecReservationEntry.ModifyAll("Location Code", 'ADMN');
                        Message('Updates completed.');
                    end;
                end;
            }
        }
    }

    var
        gtextDocNo: Text;
        gtextItemNo: Text;
        goptEntryType: Enum "Item Ledger Entry Type";
        gtextOrderNo: Text;
        gdatePostingDate: Date;
        gtextProdOrderLineNo: Integer;

        gpageConsumptionJnl: Page "production Journal";
}
