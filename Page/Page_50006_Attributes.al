page 50006 Attributes
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Attributes;

    layout
    {
        area(Content)
        {
            repeater(Attributes)
            {
                field("Attribute Type"; "Attribute Type")
                {
                    ApplicationArea = All;
                }
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}