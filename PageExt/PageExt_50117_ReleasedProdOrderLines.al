pageextension 50117 ReleasedProdOrderLines extends "Released Prod. Order Lines"
{
    layout
    {
        modify("Location Code")
        {
            Visible = true;
        }
    }

    actions
    {
        modify(ReservationEntries)
        {
            trigger OnBeforeAction()
            begin
                ShowReservation2();
                Error('');
            end;
        }


        modify(Routing)
        {
            trigger OnBeforeAction()
            begin
                ShowRouting2();
                Error('');
            end;
        }
    }

    trigger OnAfterGetRecord()
    var
        grecCapacityLedgerEntry: Record "Capacity Ledger Entry";
        gdecOutputQty: Decimal;
    begin
        grecCapacityLedgerEntry.Reset();
        grecCapacityLedgerEntry.SetCurrentKey("Entry No.");
        grecCapacityLedgerEntry.SetRange("Order Type", grecCapacityLedgerEntry."Order Type"::Production);
        grecCapacityLedgerEntry.SetRange("Document No.", "Prod. Order No.");
        if grecCapacityLedgerEntry.FindSet then begin
            repeat
                gdecOutputQty += grecCapacityLedgerEntry."Output Quantity";
            until grecCapacityLedgerEntry.Next = 0;
            rec."Finished Quantity" := gdecOutputQty;
            rec.Modify;
        end;
    end;
}