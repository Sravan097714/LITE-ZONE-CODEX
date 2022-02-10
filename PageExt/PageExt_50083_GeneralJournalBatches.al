pageextension 50083 GeneralJournalBatches extends "General Journal Batches"
{
    layout
    {
        modify("Reason Code")
        {
            Visible = false;
        }
        modify("Copy VAT Setup to Jnl. Lines")
        {
            Visible = false;
        }
        modify("Allow VAT Difference")
        {
            Visible = false;
        }
        modify("Suggest Balancing Amount")
        {
            Visible = false;
        }
        modify("No. Series")
        {
            Visible = true;
        }
        modify("Posting No. Series")
        {
            Visible = true;
        }
        modify("Allow Payment Export")
        {
            Visible = false;
        }
        modify(BackgroundErrorCheck)
        {
            Visible = false;
        }
        modify("Copy to Posted Jnl. Lines")
        {
            Visible = false;
        }

        addlast(Control1)
        {
            field("PV No. Series"; Rec."PV No. Series")
            {
                ApplicationArea = All;
            }
        }
    }
}