pageextension 50091 ReleasedProdOrdExt extends "Released Production Order"
{
    layout
    {
        addlast(General)
        {
            field("Saled Order No."; "Sales Order No.")
            {
                ApplicationArea = All;
            }
            field(Delete; Delete) { ApplicationArea = All; }
        }

        /* modify(Blocked)
        {
            trigger OnAfterValidate()
            var
                grecProdOrdComponent: Record "Prod. Order Component";
            begin
                if Blocked then begin
                    grecProdOrdComponent.Reset();
                    grecProdOrdComponent.SetRange("Prod. Order No.", "No.");
                    if grecProdOrdComponent.FindFirst() then begin
                        repeat
                            if grecProdOrdComponent."Act. Consumption (Qty)" <> grecProdOrdComponent."Expected Quantity" then
                                Error('Qty Issued and Expected Quantity are not the same for item no. %1', grecProdOrdComponent."Item No.");
                        until grecProdOrdComponent.Next() = 0;
                    end;
                end;
            end;
        } */
        moveafter("No."; "Source No.")
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Location Code" := 'ADMN';
    end;
}