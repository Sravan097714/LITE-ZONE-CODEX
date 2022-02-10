table 50000 "New Categories"
{
    LookupPageId = 50001;

    fields
    {
        field(1; "Table Name"; text[30]) { }
        field(2; "Field Name"; Text[100]) { }
        field(3; Code; Code[50]) { }
        field(4; Description; Text[150]) { }
    }

    keys
    {
        key(PK; "Table Name", "Field Name", Code)
        {
            Clustered = true;
        }
    }
}