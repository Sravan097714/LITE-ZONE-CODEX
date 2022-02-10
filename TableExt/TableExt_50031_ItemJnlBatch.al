tableextension 50031 ItemJnlBatchExt extends "Item Journal Batch"
{
    fields
    {
        field(50000; "Gen. Prod Posting Group"; code[20])
        {
            TableRelation = "Gen. Product Posting Group";
        }
    }
}