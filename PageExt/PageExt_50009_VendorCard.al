pageextension 50009 VendorExt extends "Vendor Card"
{
    layout
    {
        modify(Address)
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Address 2")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(County)
        {
            Visible = false;
        }
        modify(Receiving)
        {
            Visible = false;
        }
        modify(City)
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(Contact)
        {
            Visible = true;
        }
        modify("Country/Region Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Balance Due (LCY)")
        {
            Visible = false;
        }
        modify("Document Sending Profile")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("IC Partner Code")
        {
            Visible = false;
        }
        modify("Tax Liable")
        {
            Visible = false;
        }
        modify("Purchaser Code")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Disable Search by Name")
        {
            Visible = false;
        }
        modify("Our Account No.")
        {
            Visible = false;
        }
        modify("Language Code")
        {
            Visible = false;
        }
        modify("Pay-to Vendor No.")
        {
            Visible = false;
        }
        modify("Invoice Disc. Code")
        {
            Visible = false;
        }
        modify("Prices Including VAT")
        {
            Visible = false;
        }
        modify(Priority)
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

        modify("Partner Type")
        {
            Visible = false;
        }
        modify("Cash Flow Payment Terms Code")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = true;
        }
        movelast(General; "Location Code")
        modify("Shipment Method Code")
        {
            Visible = false;
        }
        modify("Lead Time Calculation")
        {
            Visible = false;
        }
        modify("Base Calendar Code")
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Privacy Blocked")
        {
            Visible = false;
        }
        modify("Primary Contact No.")
        {
            Visible = false;
        }
        modify("Customized Calendar")
        {
            Visible = false;
        }
        modify(GLN)
        {
            Visible = false;
        }
        modify("Prepayment %")
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
                grecVATBusPostingGrp.SetRange(Type, grecVATBusPostingGrp.Type::Vendor);
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

        /*  addafter(Blocked)
         {
             field(Balance; Rec.Balance)
             {
                 Editable = false;
                 ApplicationArea = All;
             }
         } */
        addlast(General)
        {
            field(BRN; Rec.BRN)
            {
                ApplicationArea = All;
            }
            field(NID; NID) { ApplicationArea = all; }
        }
        moveafter(BRN; "VAT Registration No.")
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        grecPurchPayableSetup: Record "Purchases & Payables Setup";
    begin
        grecPurchPayableSetup.Get();
        if grecPurchPayableSetup."Vendor Mandatory Field" then begin
            if "No." = '' then
                Error('No. is mandatory and must have a value.');
            if Name = '' then
                Error('Name is mandatory and must have a value.');
            if "Vendor Posting Group" = '' then
                Error('Vendor Posting Group is mandatory and must have a value.');
            if "Gen. Bus. Posting Group" = '' then
                Error('Gen. Bus. Posting Group is mandatory and must have a value.');
            if "VAT Bus. Posting Group" = '' then
                Error('VAT Bus. Posting Group is mandatory and must have a value.');
        end;
    end;
}