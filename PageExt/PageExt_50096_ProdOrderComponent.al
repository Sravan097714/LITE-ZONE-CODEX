pageextension 50096 ProdOrderComponentExt extends "Prod. Order Components"
{
    layout
    {
        modify("Reserved Quantity")
        {
            Editable = true;
            Visible = true;
        }

        modify("Bin Code")
        {
            Visible = false;
        }

        modify("Location Code")
        {
            Visible = true;
        }

        addlast(Control1)
        {
            field("Act. Consumption (Qty)"; "Act. Consumption (Qty)")
            {
                ApplicationArea = All;
                Caption = 'Issued Qty';
            }
        }

        modify("Item No.")
        {
            trigger OnAfterValidate()
            begin
                "Location Code" := 'ADMN';
                Modify;
            end;
        }

    }

    actions
    {
        modify("&Print")
        {
            Visible = false;
        }

        addafter("&Print")
        {
            action(Print)
            {
                ApplicationArea = Manufacturing;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                var
                    ProdOrderComp: Record "Prod. Order Component";
                begin
                    ProdOrderComp.Copy(Rec);
                    REPORT.RunModal(REPORT::"Prod. Order - Picking List 2", true, true, ProdOrderComp);
                end;
            }

        }
    }
}
