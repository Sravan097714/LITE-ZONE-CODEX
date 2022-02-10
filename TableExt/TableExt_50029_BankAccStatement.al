tableextension 50029 MyExtension extends "Bank Account Statement"
{
    trigger OnBeforeDelete()
    begin
        Error('This document cannot be deleted.');
    end;
}
