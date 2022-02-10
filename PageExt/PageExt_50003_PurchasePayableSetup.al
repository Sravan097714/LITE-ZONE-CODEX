pageextension 50003 PurchasePayableSetup extends "Purchases & Payables Setup"
{
    layout
    {
        addlast(General)
        {
            field("Doc. Posting Date as WORKDATE"; rec."Doc. Posting Date as WORKDATE")
            {
                ApplicationArea = All;
            }
            field("Vendor Mandatory Field"; "Vendor Mandatory Field")
            {
                ApplicationArea = All;
            }
            field("Threshold Goods & Services Rpt"; "Threshold Goods & Services Rpt") { ApplicationArea = All; }
        }
    }
}