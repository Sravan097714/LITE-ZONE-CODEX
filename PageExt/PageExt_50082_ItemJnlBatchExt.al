pageextension 50082 ItemJnlBatchesPgExt extends "Item Journal Batches"
{
    layout
    {
        addlast(Control1)
        {
            field("Gen. Prod Posting Group"; "Gen. Prod Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }
}