pageextension 50001 CompanyInfoExt extends "Company Information"
{
    layout
    {
        addlast(General)
        {
            field(BRN; Rec.BRN)
            {
                ApplicationArea = All;
            }
            field("Email 2"; Rec."Email 2")
            {
                ApplicationArea = All;
            }
            field("Order Confirmation Email"; "Order Confirmation Email")
            {
                ApplicationArea = All;
            }
            field("Sales Invoice Email"; "Sales Invoice Email")
            {
                ApplicationArea = All;
            }
            field("VAT Payer Tax"; "VAT Payer Tax")
            {
                ApplicationArea = All;
            }
            field("VAT Payer Full Name"; "VAT Payer Full Name")
            {
                ApplicationArea = All;
            }
            field("Mobile Number"; "Mobile Number")
            {
                ApplicationArea = All;
            }
            field("Name Of Declarant"; "Name Of Declarant")
            {
                ApplicationArea = All;
            }
            field("MRA VAT Email Address"; "MRA VAT Email Address")
            {
                ApplicationArea = All;
            }
            field("Postal Address"; "Postal Address")
            {
                ApplicationArea = All;
            }
        }
    }
}