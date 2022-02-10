pageextension 50012 ItemListExt extends "Item List"
{
    layout
    {
        addlast(Control1)
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = All;
            }
            field("Unit Cost - Posted to GL"; Rec."Unit Cost - Posted to GL")
            {
                ApplicationArea = All;
                Editable = gboolUnitCost;
            }
            field("No. 2"; "No. 2")
            {
                ApplicationArea = All;
            }
            field("Description 2"; "Description 2")
            {
                ApplicationArea = All;
            }
            field("Qty. on Prod. Order"; "Qty. on Prod. Order")
            {
                ApplicationArea = All;
            }
            field("Reserved Qty. on Inventory"; "Reserved Qty. on Inventory")
            {
                ApplicationArea = All;
            }
            field("Qty. on Sales Order"; "Qty. on Sales Order")
            {
                ApplicationArea = All;
            }
            field("Reserved Qty. on Sales Orders"; "Reserved Qty. on Sales Orders")
            {
                ApplicationArea = All;
            }
            field("Qty. on Purch. Order"; "Qty. on Purch. Order")
            {
                ApplicationArea = All;
            }
            field("Reserved Qty. on Purch. Orders"; "Reserved Qty. on Purch. Orders")
            {
                ApplicationArea = All;
            }
            field(Revaluation; Revaluation)
            {
                ApplicationArea = All;
            }
            field("Purchasing Code"; "Purchasing Code")
            {
                Visible = false;
            }
            field("Over-Receipt Code"; "Over-Receipt Code")
            {
                Visible = false;
            }
            field("Expiration Calculation"; "Expiration Calculation")
            {
                Visible = false;
            }
            field("Product Group Code 2"; "Product Group Code 2") { ApplicationArea = All; }
            field("Type "; "Item Type") { ApplicationArea = All; }
            field(Colour; Colour) { ApplicationArea = All; }
            field(Finish; Finish) { ApplicationArea = All; }
            field(Material; Material) { ApplicationArea = All; }
            field(Dimensions; Dimensions) { ApplicationArea = All; }
            field(Lampholder; Lampholder) { ApplicationArea = All; }
            field(Wattage; Wattage) { ApplicationArea = All; }
            field("ATTRIBUTE 8"; "ATTRIBUTE 8") { ApplicationArea = All; }
            field("ATTRIBUTE 9"; "ATTRIBUTE 9") { ApplicationArea = All; }
            field("Rounding Precision"; "Rounding Precision") { ApplicationArea = All; }


        }
        addafter("Reserved Qty. on Purch. Orders")
        {
            field("Qty. on Component Lines"; Rec."Qty. on Component Lines") { ApplicationArea = all; }
        }

        addafter(InventoryField)
        {
            field(Availaibility; Availaibility) { ApplicationArea = ALl; }
        }

        addbefore(Control1901314507)
        {
            part(ItemPicture; "Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = FIELD("No."),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                              "Location Filter" = FIELD("Location Filter"),
                              "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                              "Variant Filter" = FIELD("Variant Filter");
            }
        }
        modify("Item Category Code")
        {
            Visible = true;
        }
        modify("Vendor Item No.")
        {
            Visible = true;
        }
        modify("Unit Cost")
        {
            Visible = gboolUnitCost;
        }
        modify("Unit Price")
        {
            Visible = gboolUnitPrice;
        }
        modify("Replenishment System")
        {
            Editable = true;
            Visible = true;
        }
        modify("Vendor No.")
        {
            Editable = true;
            Visible = true;
        }
        modify("Production BOM No.")
        {
            Editable = true;
            Visible = true;
            ApplicationArea = ALl;
        }
        modify("Routing No.")
        {
            Editable = true;
            Visible = true;
            ApplicationArea = ALl;
        }
        modify("Cost is Adjusted")
        {
            Editable = true;
            Visible = true;
            ApplicationArea = All;
        }
        modify("Substitutes Exist")
        {
            Editable = false;
            ApplicationArea = All;
        }
        modify("Assembly BOM")
        {
            Visible = false;
        }
        modify("Default Deferral Template Code")
        {
            Visible = false;
        }
        modify("Shelf No.")
        {
            Visible = true;
        }
    }


    trigger OnOpenPage()
    var
        grecUserSetup: Record "User Setup";

    begin
        clear(gboolUnitCost);
        Clear(gboolUnitPrice);
        if grecUserSetup.get(UserId) then begin
            if not grecUserSetup."Hide Unit Cost on Item List" then
                gboolUnitCost := true;
            if not grecUserSetup."Hide Unit Price on Item List" then
                gboolUnitPrice := true;
        end;
        CurrPage.Editable(true);
    end;


    trigger OnAfterGetRecord()
    var
        grecValueEntry: Record "Value Entry";
        gintItemLedgerEntryNo: Integer;
        gdecUnitCost: Decimal;
        gdecTotalCostPerUnit: Decimal;
    begin
        Clear(gintItemLedgerEntryNo);
        Clear(gdecUnitCost);
        Clear(gdecTotalCostPerUnit);
        grecValueEntry.Reset();
        grecValueEntry.SetCurrentKey("Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code");
        grecValueEntry.SetRange("Document Type", grecValueEntry."Document Type"::"Purchase Receipt");
        grecValueEntry.SetRange("Item Charge No.", '');
        grecValueEntry.SetRange("Item No.", "No.");
        if grecValueEntry.FindLast then begin
            gintItemLedgerEntryNo := grecValueEntry."Item Ledger Entry No.";
            gdecUnitCost := grecValueEntry."Cost per Unit";
        end;

        clear(gdecTotalCostPerUnit);
        grecValueEntry.SetFilter("Item Charge No.", '<>%1', '');
        grecValueEntry.SetRange("Item Ledger Entry No.", gintItemLedgerEntryNo);
        if grecValueEntry.FindSet() then begin
            repeat
                gdecTotalCostPerUnit += grecValueEntry."Cost per Unit";
            until grecValueEntry.Next() = 0;
        end;

        grecValueEntry.SetRange("Item Charge No.", '');
        if grecValueEntry.FindSet() then begin
            repeat
                gdecTotalCostPerUnit += grecValueEntry."Cost per Unit";
            until grecValueEntry.Next() = 0;
        end else
            gdecTotalCostPerUnit += gdecUnitCost;
        "Last Purchase Price" := gdecTotalCostPerUnit;

        CalcFields(Inventory, "Reserved Qty. on Inventory");
        Availaibility := Inventory - "Reserved Qty. on Inventory";
    end;


    var
        gboolUnitCost: Boolean;
        gboolUnitPrice: Boolean;
}