pageextension 50086 VATBusPostingGrpExt extends "VAT Business Posting Groups"
{
    layout
    {
        addafter(Description)
        {
            field(Type; Type)
            {
                ApplicationArea = All;
            }
        }

    }
}