pageextension 50007 CustomerExt extends "Customer Card"
{
    layout
    {
        modify("IC Partner Code")
        {
            Visible = false;
        }
        modify("Balance Due (LCY)")
        {
            Visible = false;
        }
        modify("Privacy Blocked")
        {
            Visible = false;
        }
        modify("Salesperson Code")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Service Zone Code")
        {
            Visible = false;
        }
        modify("Document Sending Profile")
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Disable Search by Name")
        {
            Visible = false;
        }
        modify("Language Code")
        {
            Visible = false;
        }
        modify(GLN)
        {
            Visible = false;
        }
        modify("Copy Sell-to Addr. to Qte From")
        {
            Visible = false;
        }
        modify("Customer Disc. Group")
        {
            Visible = false;
        }
        modify("Customer Price Group")
        {
            Visible = false;
        }
        modify("Allow Line Disc.")
        {
            Visible = false;
        }
        modify("Invoice Disc. Code")
        {
            Visible = false;
        }
        modify("Ship-to Code")
        {
            Visible = false;
        }
        modify("Prices Including VAT")
        {
            Visible = false;
        }
        modify("Prepayment %")
        {
            Visible = false;
        }
        modify("Partner Type")
        {
            Visible = false;
        }
        modify("Reminder Terms Code")
        {
            Visible = false;
        }
        modify("Fin. Charge Terms Code")
        {
            Visible = false;
        }
        modify("Cash Flow Payment Terms Code")
        {
            Visible = false;
        }
        modify("Print Statements")
        {
            Visible = false;
        }
        modify("Last Statement No.")
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
        modify("Block Payment Tolerance")
        {
            Visible = false;
        }
        modify("Preferred Bank Account Code")
        {
            Visible = false;
        }
        modify(Shipping)
        {
            Visible = false;
        }
        modify(TotalSales2)
        {
            Visible = false;
        }
        modify(AdjCustProfit)
        {
            Visible = false;
        }
        modify(AdjProfitPct)
        {
            Visible = false;
        }
        modify("CustSalesLCY - CustProfit - AdjmtCostLCY")
        {
            Visible = false;
        }
        modify("Primary Contact No.")
        {
            Visible = false;
        }
        modify("Shipment Method Code")
        {
            Visible = true;
            Caption = 'MRU Post Code';
        }
        modify("Shipping Agent Code")
        {
            Visible = false;
        }
        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }
        modify("Shipping Time")
        {
            Visible = false;
        }
        modify("Base Calendar Code")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = true;
        }
        movelast(General; "Location Code")
        modify("Combine Shipments")
        {
            Visible = false;
        }
        modify(Reserve)
        {
            Visible = false;
        }
        modify("Shipping Advice")
        {
            Visible = false;
        }
        modify("VAT Bus. Posting Group")
        {
            trigger OnLookup(var Text: Text): Boolean
            var
                grecVATBusPostingGrp: Record "VAT Business Posting Group";
                gpageVatBusPostingGrp: Page "VAT Business Posting Groups";
            begin
                Clear(gpageVatBusPostingGrp);
                grecVATBusPostingGrp.Reset();
                grecVATBusPostingGrp.SetRange(Type, grecVATBusPostingGrp.Type::Customer);
                if grecVATBusPostingGrp.FindFirst() then begin
                    gpageVatBusPostingGrp.SetRecord(grecVATBusPostingGrp);
                    gpageVatBusPostingGrp.SetTableView(grecVATBusPostingGrp);
                    gpageVatBusPostingGrp.LookupMode(true);
                    if gpageVatBusPostingGrp.RunModal() = Action::LookupOK then begin
                        gpageVatBusPostingGrp.GetRecord(grecVATBusPostingGrp);
                        Rec."VAT Bus. Posting Group" := grecVATBusPostingGrp.Code;
                    end;
                end;
            end;
        }
        modify(Statistics)
        {
            Visible = false;
        }
        modify("Shipment Method")
        {
            Visible = false;
        }
        modify("Use GLN in Electronic Document")
        {
            Visible = false;
        }
        modify(County)
        {
            Visible = false;
        }
        modify(PriceAndLineDisc)
        {
            Visible = false;
        }
        modify("Customized Calendar")
        {
            Visible = false;
        }
        modify(PricesandDiscounts)
        {
            Visible = false;
        }
        movelast(Invoicing; "Currency Code")
        /* addafter(Name)
        {
            field("Balance "; Rec.Balance)
            {
                ApplicationArea = All;
            }
        } */

        addafter("VAT Registration No.")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                Visible = false;
                ApplicationArea = All;
            }
        }


        addlast(General)
        {
            field(BRN; Rec.BRN)
            {
                ApplicationArea = all;
            }
        }
        moveafter(BRN; "VAT Registration No.")

    }
}