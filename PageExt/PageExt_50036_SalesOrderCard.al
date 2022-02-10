pageextension 50036 SalesOrderCardExt extends "Sales Order"
{
    layout
    {
        modify("Sell-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Sell-to Phone No.")
        {
            Visible = false;
        }
        modify("Sell-to E-Mail")
        {
            Visible = false;
        }
        modify("Document Date")
        {
            Visible = false;
        }
        modify("Requested Delivery Date")
        {
            Visible = true;
        }
        modify("Sell-to Contact No.")
        {
            Visible = false;
        }
        modify("Sell-to County")
        {
            Visible = false;
        }
        modify("Work Description")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = true;
        }
        movelast(General; "Location Code")
        modify("No. of Archived Versions")
        {
            Visible = false;
        }
        modify(Control1900201301)
        {
            Visible = false;
        }
        modify(SelectedPayments)
        {
            Visible = false;
        }
        modify("Shipping and Billing")
        {
            Visible = false;
        }
        modify("Promised Delivery Date")
        {
            Visible = false;
        }
        modify("Your Reference")
        {
            Visible = false;
        }
        modify("Salesperson Code")
        {
            Visible = true;
        }
        modify("Campaign No.")
        {
            Visible = false;
        }
        modify("Opportunity No.")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify("Prices Including VAT")
        {
            Visible = false;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Payment Method Code")
        {
            Visible = false;
        }
        modify("Payment Terms Code")
        {
            Visible = false;
        }
        modify("EU 3-Party Trade")
        {
            Visible = false;
        }
        modify("Payment Discount %")
        {
            Visible = false;
        }
        modify("Pmt. Discount Date")
        {
            Visible = false;
        }
        modify("Direct Debit Mandate ID")
        {
            Visible = false;
        }
        modify("Shipping Agent Code")
        {
            Visible = false;
        }
        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }
        modify("Package Tracking No.")
        {
            Visible = false;
        }
        modify("Bill-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Shipment Date")
        {
            Visible = false;
        }
        modify("Late Order Shipping")
        {
            Visible = false;
        }
        modify("Outbound Whse. Handling Time")
        {
            Visible = false;
        }
        modify("Shipping Time")
        {
            Visible = false;
        }
        modify("Shipping Advice")
        {
            Visible = false;
        }
        modify("Foreign Trade")
        {
            Visible = false;
        }
        modify("Posting Description")
        {
            Visible = true;
            ApplicationArea = All;
        }
        moveafter("Sell-to Customer Name"; "Posting Description")

        addlast(General)
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
                PromotedCategory = Category11;
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
                PromotedCategory = Category11;
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
        grepOrderWithoutCost: Report "Sales Order without Cost";
        grepOrderWithCost: Report "Sales Order";
        grecUserSetup: Record "User Setup";
        gboolVisibleWithCost: Boolean;
        gboolVisibleWithoutCost: Boolean;
        gpageSalesOrder: Page "Sales Order";
}