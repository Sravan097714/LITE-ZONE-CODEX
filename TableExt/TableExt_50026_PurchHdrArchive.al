tableextension 50026 PurchHdrArchiveExt extends "Purchase Header Archive"
{
    fields
    {
        field(50000; "BRN"; Code[30])
        {
            Editable = false;
        }
        field(50001; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(50002; "Date Time Released"; DateTime)
        {
            Editable = false;
        }
        field(50003; "Released By"; text[50])
        {
            Editable = false;
        }
        field(50004; "Date Time Reopened"; DateTime)
        {
            Editable = false;
        }
        field(50005; "Reopened By"; text[50])
        {
            Editable = false;
        }
        field(50006; "Cancelled By"; Code[50])
        {
            Editable = false;
        }
        field(50007; "Date Cancelled"; Date)
        {
            Editable = false;
        }
        field(50008; "Time Cancelled"; Time)
        {
            Editable = false;
        }
        field(50009; "Comment 2"; text[200])
        {
            Caption = 'Comment';
            Editable = false;
        }
        field(50010; "Production Order"; code[20])
        {
            TableRelation = "Production Order"."No.";
            Editable = false;
        }
    }
}