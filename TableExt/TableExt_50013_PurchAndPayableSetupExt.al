tableextension 50013 PurchAndPayableSetupExt extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "Doc. Posting Date as WORKDATE"; Code[20]) { }
        field(50001; "Vendor Mandatory Field"; Boolean) { }
        field(50002; "Threshold Goods & Services Rpt"; Decimal) { }
    }
}