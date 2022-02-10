pageextension 50079 GeneralLedgerEntries extends "General Ledger Entries"
{
    layout
    {
        modify("Global Dimension 1 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Global Dimension 2 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Debit Amount")
        {
            Visible = true;
            ApplicationArea = All;
        }

        modify("Credit Amount")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("VAT Amount")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("User ID")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Source Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Dimension Set ID")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("G/L Account Name")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(Quantity)
        {
            Visible = true;
            ApplicationArea = All;
        }
        moveafter("G/L Account No."; "G/L Account Name")

        addlast(Control1)
        {
            field("Creation Date"; Rec."Creation Date")
            {
                ApplicationArea = All;
            }
            field("PV Number"; Rec."PV Number")
            {
                ApplicationArea = All;
            }
            field("Bank Name for Cheque"; "Bank Name for Cheque")
            {
                ApplicationArea = All;
            }
            /*  field("TDS Code"; "TDS Code")
             {
                 ApplicationArea = All;
             } */

            //field("Dimension Code 1"; "Dimension Code 1") { ApplicationArea = All; }
            field(Vehicle; "Dimension Value Code 1")
            {
                ApplicationArea = All;
                Caption = 'Vehicle';
            }
            //field("Dimension Code 2"; "Dimension Code 2") { ApplicationArea = All; }
            field("Credit Card"; "Dimension Value Code 2")
            {
                ApplicationArea = All;
                Caption = 'Credit Card';
            }
        }

        addafter("Source Code")
        {
            field("Source Type"; "Source Type") { ApplicationArea = All; }
            field("Source No."; "Source No.") { ApplicationArea = All; }
            field("Source Name"; "Source Name") { ApplicationArea = All; }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if "Source Name" = '' then begin
            if "Source Type" = "Source Type"::"Bank Account" then begin
                if grecBankAcc.get("Source No.") then
                    "Source Name" := grecBankAcc.Name;
            end;

            if "Source Type" = "Source Type"::Customer then begin
                if grecCustomer.get("Source No.") then
                    "Source Name" := grecCustomer.Name;
            end;

            if "Source Type" = "Source Type"::Vendor then begin
                if grecVendor.get("Source No.") then
                    "Source Name" := grecVendor.Name;
            end;

            if "Source Type" = "Source Type"::"Fixed Asset" then begin
                if grecFixedAsset.get("Source No.") then
                    "Source Name" := grecFixedAsset.Description;
            end;
            Modify();
        end;
    end;


    var
        grecBankAcc: Record "Bank Account";
        grecCustomer: Record Customer;
        grecVendor: Record Vendor;
        grecFixedAsset: Record "Fixed Asset";
}