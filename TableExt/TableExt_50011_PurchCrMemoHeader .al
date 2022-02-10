tableextension 50011 PurchCrMemoHeaderExt extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(50000; BRN; Code[30])
        {
            Editable = false;
        }
        field(50001; "Created By"; Code[50])
        {
            Editable = false;
        }
    }
}