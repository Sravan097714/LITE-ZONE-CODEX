pageextension 50005 GLAccountCard extends "G/L Account Card"
{
    layout
    {

        modify("Account Category")
        {
            Visible = false;
        }
        modify("No. of Blank Lines")
        {
            Visible = false;
        }
        modify("New Page")
        {
            Visible = false;
        }
        modify("Search Name")
        {
            Visible = false;
        }
        modify("Reconciliation Account")
        {
            Visible = false;
        }
        modify("Automatic Ext. Texts")
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = false;
        }
        modify("Omit Default Descr. in Jnl.")
        {
            Visible = false;
        }
        modify("Default Deferral Template Code")
        {
            Visible = false;
        }
        modify("Default IC Partner G/L Acc. No")
        {
            Visible = false;
        }
        modify("Consol. Translation Method")
        {
            Visible = false;
        }
        modify("Cost Accounting")
        {
            Visible = false;
        }
        modify("Exchange Rate Adjustment")
        {
            Visible = false;
        }
        addlast(General)
        {
            field("Budgeted Amount"; Rec."Budgeted Amount")
            {

            }
            /* field("Remaining Budget"; "Remaining Budget")
            {

            }
            field("Budgeted Amount for Current Year"; "Budgeted Amount for Current Year")
            {
                trigger OnDrillDown()
                begin
                    gintYearCode := DATE2DMY(Today, 3);

                    gtextStartdate := '01/01/' + Format(gintYearCode);
                    Evaluate(gdateStartDate, gtextStartdate);

                    gtextEnddate := '31/12/' + Format(gintYearCode);
                    Evaluate(gdateEndDate, gtextStartdate);

                    DateFilterCustomize := 'gtextStartdate..gtextEnddate';
                end;
            } */
        }

    }


    var
        gdateStartDate: Date;
        gtextStartdate: Text;
        gdateEndDate: Date;
        gtextEnddate: Text;
        gintYearCode: Integer;
        gtextdatefilter: Text;
}