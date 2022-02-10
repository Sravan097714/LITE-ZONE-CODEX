table 50002 Attributes
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Attribute Type"; Integer) { }
        field(2; Code; Code[50]) { }
        field(3; Description; Text[250]) { }
    }


    keys
    {
        key(PK; "Attribute Type", Code)
        {
            Clustered = true;
        }
    }
}