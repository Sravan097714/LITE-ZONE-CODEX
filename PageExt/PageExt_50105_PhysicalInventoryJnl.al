pageextension 50105 PhysicalInventoryJnl extends "Phys. Inventory Journal"
{
    layout
    {
        addfirst(Control1)
        {
            field("Line No."; "Line No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify("Salespers./Purch. Code")
        {
            Visible = false;
        }
        modify("Unit Amount")
        {
            Visible = false;
        }
        modify("Applies-to Entry")
        {
            Visible = false;
        }
        modify(ShortcutDimCode3)
        {
            Visible = false;
        }
        modify(ShortcutDimCode4)
        {
            Visible = false;
        }
        modify(ShortcutDimCode5)
        {
            Visible = false;
        }
        modify(ShortcutDimCode6)
        {
            Visible = false;
        }
        modify("Posting Date")
        {
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        modify("Entry Type")
        {
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        modify("Document No.")
        {
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        modify("Item No.")
        {
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        modify(Description)
        {
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        modify("Location Code")
        {
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        modify("Qty. (Calculated)")
        {
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        modify("Qty. (Phys. Inventory)")
        {
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        modify(Quantity)
        {
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        modify(Amount)
        {
            Editable = gboolEditCost;
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        modify("Unit Cost")
        {
            Editable = gboolEditCost;
            StyleExpr = gboolStyleExp;
            Style = StrongAccent;
        }
        addafter("Item No.")
        {
            field("Item No.2"; Rec."Item No.2")
            {
                ApplicationArea = all;
            }
            field("Shelf No."; Rec."Shelf No.")
            {
                ApplicationArea = all;
            }
        }
        addafter("Qty. (Phys. Inventory)")
        {
            field("Qty. Phys. Inventory modified"; Rec."Qty. Phys. Inventory modified")
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Qty Modified';
            }
        }
    }

    trigger OnOpenPage()
    begin
        gboolEditCost := false;
        if grecUserSetup.Get(UserId) then begin
            if grecUserSetup."Edit Cost on Phys Inv Jnl" then
                gboolEditCost := true;
        end;
    end;


    trigger OnModifyRecord(): Boolean
    begin
        if "Qty. (Phys. Inventory)" <> xRec."Qty. (Phys. Inventory)" then begin
            "Qty. Phys. Inventory modified" := true;
        end;

        if "Qty. Phys. Inventory modified" then
            gboolStyleExp := true
        else
            gboolStyleExp := false;
    end;


    trigger OnAfterGetRecord()
    begin
        if "Qty. Phys. Inventory modified" then
            gboolStyleExp := true
        else
            gboolStyleExp := false;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if "Qty. Phys. Inventory modified" then
            gboolStyleExp := true
        else
            gboolStyleExp := false;
    end;

    var
        grecUserSetup: Record "User Setup";
        gboolEditCost: Boolean;
        gboolStyleExp: Boolean;
}