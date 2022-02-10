pageextension 50000 UserSetup extends "User Setup"
{
    layout
    {
        modify("Register Time")
        {
            Visible = false;
        }
        modify("Salespers./Purch. Code")
        {
            Visible = false;
        }
        modify("Sales Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Purchase Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Time Sheet Admin.")
        {
            Visible = false;
        }
        modify(Email)
        {
            Visible = false;
        }
        modify("Service Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify(PhoneNo)
        {
            Visible = false;
        }

        addlast(Control1)
        {
            field("Hide Unit Cost on Item List"; Rec."Hide Unit Cost on Item List")
            {
                ApplicationArea = All;
            }
            field("Hide Unit Price on Item List"; Rec."Hide Unit Price on Item List")
            {
                ApplicationArea = All;
            }
            field("Dis. Posting Button Prod Jnl"; Rec."Dis. Posting Button Prod Jnl")
            {
                ApplicationArea = All;
            }
            field("Purchase Order Posting"; Rec."Purchase Order Posting")
            {
                ApplicationArea = All;
            }
            field("Sales Order Posting"; "Sales Order Posting")
            {
                ApplicationArea = All;
            }
            field("Can released Purchase Order"; Rec."Can Released Purchase Order")
            {
                ApplicationArea = All;
            }
            field("Can reopen Purchase Order"; Rec."Can Reopen Purchase Order")
            {
                ApplicationArea = All;
            }
            field("Can Close Purchase Order"; Rec."Can Close Purchase Order")
            {
                ApplicationArea = All;
            }
            field("Hide field on Ord Confirmation"; "Hide field on Ord Confirmation")
            {
                ApplicationArea = All;
            }
            field("Edit Cost on Item Journal"; "Edit Cost on Item Journal")
            {
                ApplicationArea = All;
            }
            field("Edit Cost on Phys Inv Jnl"; "Edit Cost on Phys Inv Jnl")
            {
                ApplicationArea = All;
            }
            field("Can Post on Production Journal"; "Can Post on Production Journal") { ApplicationArea = All; }
            field("Print Sales Order with Price"; "Print Sales Order with Price") { ApplicationArea = All; }
            field("Print Sales Order without Price"; "Print Sales Order without Price") { ApplicationArea = All; }
        }
    }
}