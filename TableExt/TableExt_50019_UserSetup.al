tableextension 50019 UserSetupExt extends "User Setup"
{
    fields
    {
        field(50000; "Hide Unit Cost on Item List"; Boolean) { }
        field(50001; "Hide Unit Price on Item List"; Boolean) { }
        field(50002; "Dis. Posting Button Prod Jnl"; Boolean)
        {
            Caption = 'Disable Posting Button on Prod Jnl';
        }
        field(50003; "Purchase Order Posting"; Option)
        {
            OptionMembers = " ",Receive,Invoice,"Receive and Invoice",All;
        }
        field(50004; "Can Released Purchase Order"; Boolean) { }
        field(50005; "Can Reopen Purchase Order"; Boolean) { }
        field(50006; "Can Close Purchase Order"; Boolean) { }
        field(50007; "Hide field on Ord Confirmation"; Boolean) { }
        field(50008; "Edit Cost on Item Journal"; Boolean) { }
        field(50009; "Edit Cost on Phys Inv Jnl"; Boolean)
        {
            Caption = 'Edit Cost on Physical Inventory Journal';
        }
        field(50010; "Sales Order Posting"; Option)
        {
            OptionMembers = " ",Ship,Invoice,"Ship and Invoice",All;
        }
        field(50011; "Can Post on Production Journal"; Boolean) { }
        field(50012; "Print Sales Order with Price"; Boolean) { }
        field(50013; "Print Sales Order without Price"; Boolean) { }
    }
}