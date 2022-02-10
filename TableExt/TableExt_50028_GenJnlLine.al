tableextension 50028 GenJnlLineExt extends "Gen. Journal Line"
{

    fields
    {
        field(50000; "Bank Name for Cheque"; Text[30]) { }
        field(50001; "TDS Code"; Code[50])
        {
            TableRelation = "New Categories".Code where("Table Name" = filter('Payment Journal'), "Field Name" = filter('TDS'));
        }
    }

    trigger OnBeforeInsert()
    begin
        if ("Journal Template Name" = 'CASH RECE') or ("Journal Template Name" = 'PAYMENTS') then
            "Document Type" := "Document Type"::Payment;
    end;

    trigger OnInsert()
    begin
        if ("Journal Template Name" = 'CASH RECE') or ("Journal Template Name" = 'PAYMENTS') then
            "Document Type" := "Document Type"::Payment;
    end;
}