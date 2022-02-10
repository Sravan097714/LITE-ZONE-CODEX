pageextension 50071 ItemLedgerEntries extends "Item Ledger Entries"
{
    layout
    {
        modify("Cost Amount (Non-Invtbl.)")
        {
            Visible = false;
        }
        modify("Global Dimension 1 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Global Dimension 2 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Order No.")
        {
            Visible = true;
        }
        modify("Order Line No.")
        {
            Visible = true;
        }
        modify("Prod. Order Comp. Line No.")
        {
            Visible = true;
        }
        addafter(Description)
        {
            field("Item No.2"; Rec."Item No.2")
            {
                ApplicationArea = all;
            }
            field("Shelf No."; Rec."Shelf No.")
            {
                ApplicationArea = all;
            }
            field("Qty Modified"; Rec."Qty Modified")
            {
                ApplicationArea = all;
            }
        }
        addafter("Entry No.")
        {
            field("Source No."; Rec."Source No.")
            {
                ApplicationArea = all;
            }
        }
    }
}