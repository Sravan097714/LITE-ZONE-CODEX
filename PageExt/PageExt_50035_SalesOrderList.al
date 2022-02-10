pageextension 50035 SalesOrderListExt extends "Sales Order List"
{
    layout
    {
        modify("Sell-to Country/Region Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Sell-to Post Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Sell-to Contact")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Document Date")
        {
            Visible = false;
        }
        modify("Completely Shipped")
        {
            Visible = false;
        }
        modify("Amt. Ship. Not Inv. (LCY)")
        {
            Visible = false;
        }
        modify("Amt. Ship. Not Inv. (LCY) Base")
        {
            Visible = false;
        }
        modify("Posting Date")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        addlast(Control1)
        {
            field(BRN; Rec.BRN)
            {
                ApplicationArea = All;
            }
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = All;
            }
        }
        modify(Control1)
        {
            FreezeColumn = "Sell-to Customer Name";
        }
    }


    actions
    {
        modify("Print Confirmation")
        {
            Visible = false;
        }
        addafter("Print Confirmation")
        {
            action("Print Order Confirmation with Price")
            {
                ApplicationArea = All;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category8;
                Visible = gboolVisibleWithCost;

                trigger OnAction()
                begin
                    grecSalesOrder.Reset();
                    grecSalesOrder.SetRange("No.", "No.");
                    if grecSalesOrder.FindFirst() then begin
                        grepOrderWithCost.SetTableView(grecSalesOrder);
                        grepOrderWithCost.Run();
                    end
                end;
            }

            action("Print Order Confirmation without Price")
            {
                ApplicationArea = All;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category8;
                Visible = gboolVisibleWithoutCost;

                trigger OnAction()
                begin
                    grecSalesOrder.Reset();
                    grecSalesOrder.SetRange("No.", "No.");
                    if grecSalesOrder.FindFirst() then begin
                        grepOrderWithoutCost.SetTableView(grecSalesOrder);
                        grepOrderWithoutCost.Run();
                    end
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        clear(gboolVisibleWithCost);
        clear(gboolVisibleWithoutCost);
        if grecUserSetup.Get(UserId) then begin
            gboolVisibleWithCost := grecUserSetup."Print Sales Order with Price";
            gboolVisibleWithoutCost := grecUserSetup."Print Sales Order without Price";
        end;
    end;

    var
        grecSalesOrder: Record "Sales Header";
        grepOrderWithoutCost: Report 50029;
        grepOrderWithCost: Report 50019;
        grecUserSetup: Record "User Setup";
        gboolVisibleWithCost: Boolean;
        gboolVisibleWithoutCost: Boolean;
}
