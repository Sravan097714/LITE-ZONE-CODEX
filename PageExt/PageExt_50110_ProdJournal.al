pageextension 50110 ProdJnlExt extends "Production Journal"
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
        modify(Quantity)
        {
            Caption = 'Qty To Assign';
        }
        addafter(Quantity)
        {
            field("Expected Qty"; "Expected Qty") { ApplicationArea = All; }
            field("Qty Issued"; "Qty Issued") { ApplicationArea = All; }
        }
        modify("Location Code")
        {
            Visible = true;
        }
        modify(ShortcutDimCode3)
        {
            Visible = false;
        }

        modify("Applies-from Entry")
        {
            Visible = true;
        }
        modify("Applies-to Entry")
        {
            Visible = true;
        }
        modify("Unit of Measure Code")
        {
            Visible = true;

        }
    }

    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                if grecUserSetup.get(UserId) then begin
                    if grecUserSetup."Can Post on Production Journal" then
                        Error('You do not have access to post this journal.');
                end;
            end;

            trigger OnAfterAction()
            begin

            end;
        }

        modify("Post and &Print")
        {
            trigger OnBeforeAction()
            begin
                if grecUserSetup.get(UserId) then begin
                    if grecUserSetup."Can Post on Production Journal" then
                        Error('You do not have access to post this journal.');
                end;
            end;
        }

        addlast(processing)
        {
            group(Filter)
            {
                action("Select All Output Lines")
                {
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedIsBig = true;
                    Image = OutputJournal;

                    trigger OnAction()
                    var
                        grecItemJnlLine: Record "Item Journal Line";
                    begin
                        grecItemJnlLine.Reset();
                        grecItemJnlLine.SetRange("Document No.", Rec."Document No.");
                        grecItemJnlLine.SetRange("Entry Type", grecItemJnlLine."Entry Type"::Output);
                        if grecItemJnlLine.FindSet() then
                            grecItemJnlLine.MarkedOnly(true);
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Location Code" := 'ADMN';
    end;

    var
        grecUserSetup: Record "User Setup";
}