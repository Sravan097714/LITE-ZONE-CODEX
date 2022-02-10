tableextension 50004 SalesInvoiceHeaderExt extends "Sales Invoice Header"
{
    fields
    {
        field(50000; BRN; Code[30])
        {
            Editable = false;
        }
        field(50001; "Delivery Date"; Date) { }
        field(50002; "Created By"; Code[50])
        {
            Editable = false;
        }

    }
}