tableextension 50022 BankAccLedgerEntryExt extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50000; "PV Number"; Code[20]) { }
        field(50001; "Bank Name for Cheque"; Text[30]) { }
        field(50002; "TDS Code"; Code[50]) { }
    }
}