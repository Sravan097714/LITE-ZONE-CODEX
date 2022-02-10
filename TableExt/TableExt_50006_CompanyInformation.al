tableextension 50006 CompanyInfoExt extends "Company Information"
{
    fields
    {
        field(50000; BRN; Text[20]) { }
        field(50001; "Email 2"; Text[80])
        {
            Caption = 'PO Email Address';
        }
        field(50002; "VAT Payer Tax"; Text[20]) { }
        field(50003; "VAT Payer Full Name"; Text[50]) { }
        field(50004; "Mobile Number"; Text[30]) { }
        field(50005; "Name Of Declarant"; Text[100]) { }
        field(50009; "MRA VAT Email Address"; Text[80]) { }
        field(50010; "Postal Address"; Text[50]) { }
        field(50011; "Sales Invoice Email"; Text[80]) { }
        field(50012; "Order Confirmation Email"; Text[80]) { }
    }
}