tableextension 50001 CustExt extends Customer
{
    fields
    {
        field(50000; BRN; Text[30]) { }
    }

    trigger OnInsert()
    begin
        "Location Code" := 'ADMN';
    end;
}