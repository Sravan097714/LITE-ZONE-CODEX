tableextension 50012 SalesReceivablesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "Doc. Posting Date as WORKDATE"; Code[20]) { }
        field(50001; "Use Available Inventory Only"; Boolean) { }
    }
}