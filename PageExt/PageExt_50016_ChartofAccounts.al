pageextension 50016 ChartofAccounts extends "Chart of Accounts"
{
    layout
    {
        modify("Cost Type No.")
        {
            Visible = false;
        }
        modify("Default Deferral Template Code")
        {
            Visible = false;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Account Category")
        {
            Visible = false;
        }
        modify("Account Subcategory Descript.")
        {
            Visible = false;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Direct Posting")
        {
            Visible = true;
            ApplicationArea = All;
        }
    }
}