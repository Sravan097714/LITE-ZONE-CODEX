page 50010 "Item Ledger Entry - Edit Mode"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Item Ledger Entry";
    Permissions = tabledata "Item Ledger Entry" = rm;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; "Entry No.") { ApplicationArea = All; }
                field("Posting Date"; "Posting Date") { ApplicationArea = All; }
                field("Document No."; "Document No.") { ApplicationArea = All; }
                field("Item No."; "Item No.") { ApplicationArea = All; }
                field("Location Code"; "Location Code") { ApplicationArea = All; }
                field("Entry Type"; "Entry Type") { ApplicationArea = All; }
                field("Document Type"; "Document Type") { ApplicationArea = All; }
                field(Quantity; Quantity) { ApplicationArea = All; }
                field("Invoiced Quantity"; "Invoiced Quantity") { ApplicationArea = All; }
                field("Remaining Quantity"; "Remaining Quantity") { ApplicationArea = All; }
                field("Sales Amount (Actual)"; "Sales Amount (Actual)") { ApplicationArea = All; }
                field("Cost Amount (Actual)"; "Cost Amount (Actual)") { ApplicationArea = All; }
                field(Open; Open) { ApplicationArea = All; }
            }
        }
    }
}