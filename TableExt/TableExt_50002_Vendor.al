tableextension 50002 VendorExt extends Vendor
{
    fields
    {
        field(50000; BRN; Text[30]) { }
        field(50001; NID; Text[25]) { }
    }

    trigger OnInsert()
    begin
        "Location Code" := 'ADMN';
    end;
}