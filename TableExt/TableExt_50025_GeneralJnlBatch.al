tableextension 50025 GenJnlBatchExt extends "Gen. Journal Batch"
{
    fields
    {
        field(50000; "PV No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
    }
}