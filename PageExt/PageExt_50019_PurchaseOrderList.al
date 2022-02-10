pageextension 50019 PurchOrderListExt extends "Purchase Order List"
{
    layout
    {
        modify(Control1)
        {
            FreezeColumn = "Buy-from Vendor Name";
        }
        modify("No.")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Vendor Authorization No.")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify("Document Date")
        {
            Visible = true;
        }
        modify(Amount)
        {
            Visible = false;
        }
        modify("Amount Including VAT")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Currency Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        moveafter("Shortcut Dimension 1 Code"; "Currency Code")
        moveafter("Buy-from Vendor Name"; "Posting Description")

        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify(Status)
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Posting Description")
        {
            Visible = true;
            ApplicationArea = All;
        }
        addafter("Buy-from Vendor Name")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
            field("Vendor Invoice No."; Rec."Vendor Invoice No.")
            {
                ApplicationArea = All;
            }
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
            field("Released By"; Rec."Released By")
            {
                ApplicationArea = All;
            }
            field("Date Time Released"; Rec."Date Time Released")
            {
                ApplicationArea = All;
            }
            field("Reopened By"; Rec."Reopened By")
            {
                ApplicationArea = All;
            }
            field("Date Time Reopened"; Rec."Date Time Reopened")
            {
                ApplicationArea = All;
            }
            field("No. Printed"; "No. Printed")
            {
                ApplicationArea = All;
            }
            field("Comment 2"; "Comment 2") { ApplicationArea = All; }
            field("Production Order"; "Production Order") { ApplicationArea = All; }
        }

    }


    actions
    {
        modify(Print)
        {
            trigger OnBeforeAction()
            var
                gtextError: TextConst ENU = 'Purchase Order should be released before printing.';
            begin
                if Rec.Status <> Rec.Status::Released then
                    error(gtextError);
            end;
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("Prices Including VAT", false);
    end;

    var
        grecUserSetup: Record "User Setup";
}