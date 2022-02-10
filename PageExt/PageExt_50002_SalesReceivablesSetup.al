pageextension 50002 SalesReceivablesSetup extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            field("Doc. Posting Date as WORKDATE"; rec."Doc. Posting Date as WORKDATE")
            {
                ApplicationArea = All;
            }
            field("Use Available Inventory Only"; rec."Use Available Inventory Only")
            {
                ApplicationArea = All;
            }
        }
    }
}