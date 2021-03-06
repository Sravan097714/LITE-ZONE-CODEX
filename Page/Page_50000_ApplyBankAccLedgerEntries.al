page 50000 "Apply Bank Acc Ledg Entries 2"
{
    // version NAVW113.00

    Caption = 'Apply Bank Acc. Ledger Entries';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Worksheet;
    SourceTable = "Bank Account Ledger Entry";
    ShowFilter = true;
    LinksAllowed = false;
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(" ")
            {
                field(LineApplied; LineApplied)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Applied';
                    Editable = true;
                    ToolTip = 'Specifies if the bank account ledger entry has been applied to its related bank transaction.';

                    trigger OnValidate()
                    var
                        BankAccEntrySetReconNo: Codeunit BankAccEntrySetReconNo;
                    begin
                        BankAccLedgEntry.COPY(Rec);
                        BankAccEntrySetReconNo.ToggleReconNo(BankAccLedgEntry, BankAccReconLine, ChangeAmount);
                    end;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the document type on the bank account entry. The document type will be Payment, Refund, or the field will be blank.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the document number on the bank account entry.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the description of the bank account entry.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the amount of the entry denominated in the applicable foreign currency.';
                    Visible = AmountVisible;
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total of the ledger entries that represent debits.';
                    Visible = DebitCreditVisible;
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total of the ledger entries that represent credits.';
                    Visible = DebitCreditVisible;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the amount that remains to be applied to. The amount is denominated in the applicable foreign currency.';
                }
                field(Open; Rec.Open)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies whether the amount on the bank account entry has been fully applied to, or if there is a remaining amount that must be applied to.';
                }
                field(Positive; Rec.Positive)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies if the bank ledger entry is positive.';
                    Visible = false;
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the type of account that a balancing entry is posted to, such as BANK for a cash account.';
                    Visible = false;
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the general ledger, customer, vendor, or bank account that the balancing entry is posted to, such as a cash account for cash purchases.';
                    Visible = false;
                }
                field("Statement Status"; Rec."Statement Status")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the statement status of the bank account ledger entry.';
                    Visible = false;
                }
                field("Statement No."; Rec."Statement No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the bank account statement that the ledger entry has been applied to, if the Statement Status is Bank Account Ledger Applied.';
                    Visible = false;
                }
                field("Statement Line No."; Rec."Statement Line No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of the statement line that has been applied to by this ledger entry line.';
                    Visible = false;
                }
                field("Check Ledger Entries"; Rec."Check Ledger Entries")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the check ledger entries that are associated with the bank account ledger entry.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    Editable = false;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    Visible = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    Editable = false;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    Visible = false;
                }
            }
            group("  ")
            {
                field("      "; '')
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Balance; Balance)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Balance';
                    Editable = false;
                    ToolTip = 'Specifies the balance of the bank account since the last posting, including any amount in the Total on Outstanding Checks field.';
                }
                field(CheckBalance; CheckBalance)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Total on Outstanding Checks';
                    Editable = false;
                    ToolTip = 'Specifies the part of the bank account balance that consists of posted check ledger entries. The amount in this field is a subset of the amount in the Balance field under the right pane in the Bank Acc. Reconciliation window.';
                }
                field(BalanceToReconcile; BalanceToReconcile)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Balance To Reconcile';
                    Editable = false;
                    ToolTip = 'Specifies the balance of the bank account since the last posting, excluding any amount in the Total on Outstanding Checks field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        /* LineApplied := IsApplied;
        SetUserInteractions;
        CalcBalance; */

        LineApplied :=
        (Rec."Statement Status" = Rec."Statement Status"::"Bank Acc. Entry Applied") AND
        (Rec."Statement No." = BankAccReconLine."Statement No.") AND
        (Rec."Statement Line No." = BankAccReconLine."Statement Line No.");
    end;

    trigger OnAfterGetRecord()
    begin
        /* LineApplied := IsApplied;
        SetUserInteractions;
        CalcBalance; */

        LineApplied :=
        (Rec."Statement Status" = Rec."Statement Status"::"Bank Acc. Entry Applied") AND
        (Rec."Statement No." = BankAccReconLine."Statement No.") AND
        (Rec."Statement Line No." = BankAccReconLine."Statement Line No.");
    end;

    trigger OnInit()
    begin
        AmountVisible := TRUE;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        //SetUserInteractions;
    end;

    trigger OnOpenPage()
    begin
        SetConrolVisibility;
    end;

    var
        BankAccount: Record "Bank Account";
        StyleTxt: Text;
        LineApplied: Boolean;
        Balance: Decimal;
        CheckBalance: Decimal;
        BalanceToReconcile: Decimal;
        AmountVisible: Boolean;
        DebitCreditVisible: Boolean;
        BankAccReconLine: Record "Bank Acc. Reconciliation Line";
        ChangeAmount: Boolean;
        BankAccLedgEntry: Record "Bank Account Ledger Entry";


    [Scope('Personalization')]
    procedure GetSelectedRecords(var TempBankAccLedgerEntry: Record "Bank Account Ledger Entry" temporary)
    var
        BankAccLedgerEntry: Record "Bank Account Ledger Entry";
    begin
        CurrPage.SETSELECTIONFILTER(BankAccLedgerEntry);
        IF BankAccLedgerEntry.FINDSET THEN
            REPEAT
                TempBankAccLedgerEntry := BankAccLedgerEntry;
                TempBankAccLedgerEntry.INSERT;
            UNTIL BankAccLedgerEntry.NEXT = 0;
    end;

    [Scope('Personalization')]
    procedure SetUserInteractions()
    begin
        StyleTxt := SetStyle;
    end;

    local procedure CalcBalance()
    begin
        IF BankAccount.GET("Bank Account No.") THEN BEGIN
            BankAccount.CALCFIELDS(Balance, "Total on Checks");
            Balance := BankAccount.Balance;
            CheckBalance := BankAccount."Total on Checks";
            BalanceToReconcile := CalcBalanceToReconcile;
        END;
    end;

    [Scope('Personalization')]
    procedure ToggleMatchedFilter(SetFilterOn: Boolean)
    begin
        IF SetFilterOn THEN BEGIN
            SETRANGE("Statement Status", "Statement Status"::Open);
            SETRANGE("Statement No.", '');
            SETRANGE("Statement Line No.", 0);
        END ELSE
            RESET;
        CurrPage.UPDATE;
    end;

    local procedure CalcBalanceToReconcile(): Decimal
    var
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
    begin
        BankAccountLedgerEntry.COPYFILTERS(Rec);
        BankAccountLedgerEntry.CALCSUMS(Amount);
        EXIT(BankAccountLedgerEntry.Amount);
    end;

    local procedure SetConrolVisibility()
    var
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.GET;
        AmountVisible := NOT (GLSetup."Show Amounts" = GLSetup."Show Amounts"::"Debit/Credit Only");
        DebitCreditVisible := NOT (GLSetup."Show Amounts" = GLSetup."Show Amounts"::"Amount Only");
    end;

    procedure SetStmtLine(NewBankAccReconLine: Record "Bank Acc. Reconciliation Line")
    var
    begin
        BankAccReconLine := NewBankAccReconLine;
        ChangeAmount := TRUE;
    end;
}


