pageextension 50004 GLAccountList extends "G/L Account List"
{
    layout
    {
        modify("Account Category")
        {
            Visible = false;
        }
        modify("Reconciliation Account")
        {
            Visible = false;
        }
        modify("Default Deferral Template Code")
        {
            Visible = false;
        }
    }
}