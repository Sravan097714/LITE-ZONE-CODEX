report 50030 "Run Adjust Cost Item Entries"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;
    UseRequestPage = false;

    trigger OnPreReport()
    var
        grepAdjustCost: Report "Adjust Cost - Item Entries";
    begin
        grepAdjustCost.SetPostToGL(true);
        grepAdjustCost.Run();
    end;
}