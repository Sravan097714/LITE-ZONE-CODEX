pageextension 50013 ItemCard extends "Item Card"
{
    layout
    {
        modify("Over-Receipt Code")
        {
            Visible = false;
        }
        modify(Blocked)
        {
            Visible = false;
        }
        modify(Type)
        {
            Visible = true;
        }
        modify("Last Date Modified")
        {
            Visible = false;
        }
        modify(GTIN)
        {
            Visible = false;
        }
        modify("Service Item Group")
        {
            Visible = false;
        }
        modify("Automatic Ext. Texts")
        {
            Visible = false;
        }
        modify("Common Item No.")
        {
            Visible = false;
        }
        modify("Shelf No.")
        {
            Visible = true;
        }
        modify("Created From Nonstock Item")
        {
            Visible = false;
        }
        modify("Search Description")
        {
            Visible = false;
        }
        modify("Qty. on Prod. Order")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Qty. on Component Lines")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Qty. on Sales Order")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Qty. on Service Order")
        {
            Visible = false;
        }
        modify("Qty. on Job Order")
        {
            Visible = false;
        }
        modify("Qty. on Assembly Order")
        {
            Visible = false;
        }
        modify("Qty. on Asm. Component")
        {
            Visible = false;
        }
        modify(StockoutWarningDefaultYes)
        {
            Visible = false;
        }
        modify(StockoutWarningDefaultNo)
        {
            Visible = false;
        }
        modify("Net Weight")
        {
            Visible = false;
        }
        modify("Gross Weight")
        {
            Visible = false;
        }
        modify("Unit Volume")
        {
            Visible = false;
        }
        modify("Costing Method")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify("Standard Cost")
        {
            Visible = false;
        }
        modify("Indirect Cost %")
        {
            Visible = false;
        }
        modify("Last Direct Cost")
        {
            Visible = false;
        }
        modify("Cost is Adjusted")
        {
            Visible = true;
        }
        modify("Cost is Posted to G/L")
        {
            Visible = false;
        }
        modify(SpecialPurchPricesAndDiscountsTxt)
        {
            Visible = false;
        }
        modify("Default Deferral Template Code")
        {
            Visible = false;
        }
        modify(ForeignTrade)
        {
            Visible = false;
        }
        modify(CalcUnitPriceExclVAT)
        {
            Visible = false;
        }
        modify("Price Includes VAT")
        {
            Visible = false;
        }
        modify("Price/Profit Calculation")
        {
            Visible = false;
        }
        modify("Profit %")
        {
            Visible = false;
        }
        modify(SpecialPricesAndDiscountsTxt)
        {
            Visible = false;
        }
        modify("Allow Invoice Disc.")
        {
            Visible = false;
        }
        modify("Include Inventory")
        {
            Visible = true;
        }
        modify("Item Disc. Group")
        {
            Visible = false;
        }
        modify("Sales Unit of Measure")
        {
            Visible = true;
        }
        modify("Sales Blocked")
        {
            Visible = false;
        }

        modify("VAT Bus. Posting Gr. (Price)")
        {
            Visible = false;
        }
        modify("Replenishment System")
        {
            Visible = true;
        }
        modify(Planning)
        {
            Visible = false;
        }
        modify(PreventNegInventoryDefaultNo)
        {
            Visible = false;
        }
        modify(Warehouse)
        {
            Visible = false;
        }
        modify("Net Invoiced Qty.")
        {
            Visible = false;
        }
        modify("Unit Cost")
        {
            Visible = gboolUnitCost;
        }
        modify("Unit Price")
        {
            Visible = gboolUnitPrice;
        }
        modify("Lead Time Calculation")
        {
            Visible = false;
        }
        modify("Purchasing Blocked")
        {
            Visible = false;
        }
        modify("Rounding Precision")
        {
            Visible = true;
            Editable = true;
        }
        modify("Flushing Method")
        {
            Visible = false;
        }
        modify("Overhead Rate")
        {
            Visible = false;
        }
        modify("Scrap %")
        {
            Visible = false;
        }
        modify("Lot Size")
        {
            Visible = false;
        }
        modify(Replenishment_Assembly)
        {
            Visible = false;
        }
        modify("Reordering Policy")
        {
            Visible = true;
        }
        modify("Purchasing Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Purch. Unit of Measure")
        {
            Visible = true;
        }
        addlast(Item)
        {
            field("No. 2"; "No. 2")
            {
                ApplicationArea = All;
            }
            field("Description 2"; "Description 2")
            {
                ApplicationArea = All;
            }
            field("Unit Cost - Posted to GL"; "Unit Cost - Posted to GL")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("Substitutes Exist"; "Substitutes Exist")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("Stockout Warning"; "Stockout Warning") { ApplicationArea = All; }
            field("Prevent Negative Inventory"; "Prevent Negative Inventory") { ApplicationArea = All; }
            field("Assembly BOM"; "Assembly BOM") { ApplicationArea = ALl; }
            field("Alternative Item No."; "Alternative Item No.") { ApplicationArea = All; }
        }
        addafter(Inventory)
        {
            field(Availaibility; Availaibility)
            {
                ApplicationArea = All;
            }
        }
        addafter("Item Category Code")
        {
            field("Product Group Code 2"; "Product Group Code 2") { ApplicationArea = All; }
        }
        moveafter("Assembly BOM"; "Include Inventory")
        moveafter("Include Inventory"; "Vendor Item No.")

        /* modify("Item Category Code")
        {
            trigger OnLookup(var Text: Text): Boolean
            var
                grecItemCategory: Record "Item Category";
                gpageItemCategory: Page "Item Categories";
            begin
                Clear(gpageItemCategory);
                grecItemCategory.Reset();
                if rec."Parent Category" <> '' then
                    grecItemCategory.SetRange("Parent Category", Rec."Parent Category");
                if grecItemCategory.FindFirst() then begin
                    gpageItemCategory.SetRecord(grecItemCategory);
                    gpageItemCategory.SetTableView(grecItemCategory);
                    gpageItemCategory.LookupMode(true);
                    if gpageItemCategory.RunModal() = Action::LookupOK then begin
                        gpageItemCategory.GetRecord(grecItemCategory);
                        "Item Category Code" := grecItemCategory.Code;
                    end;
                end;
            end;
        } */

        modify("Routing No.")
        {
            trigger OnAfterValidate()
            begin
                if "Routing No." <> '' then begin
                    if "Routing No." <> "No." then
                        Message('Routing No. is not the same as Item No.');
                end;
            end;
        }

        modify("Production BOM No.")
        {
            trigger OnAfterValidate()
            begin
                if "Production BOM No." <> '' then begin
                    if "Production BOM No." <> "No." then
                        Message('Production BoM No. is not the same as Item No.');
                end;
            end;
        }

        addafter("Vendor No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = All;
            }
        }

        addlast("Prices & Sales")
        {
            field("Ext. Shelf Description"; Rec."Ext. Shelf Description")
            {
                ApplicationArea = All;
            }
            field("Reserved Qty. on Inventory"; "Reserved Qty. on Inventory")
            {
                ApplicationArea = All;
            }
            field("Reserved Qty. on Sales Orders"; "Reserved Qty. on Sales Orders")
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
            field("Last Purchase Price"; "Last Purchase Price")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify(Reserve)
        {
            Visible = true;
            Editable = true;
            ApplicationArea = All;
        }
        moveafter("Assembly BOM"; Reserve)
        modify("Qty. on Purch. Order")
        {
            Visible = true;
            Editable = true;
            ApplicationArea = All;
        }
        modify(ItemTracking)
        {
            Visible = false;
        }
        modify("Vendor No.")
        {
            Visible = true;
            trigger OnAfterValidate()
            var
                grecVendor: Record Vendor;
            begin
                if grecVendor.get("Vendor No.") then
                    "Vendor Name" := grecVendor.Name;
            end;
        }

        addafter(Item)
        {
            group(Attributes)
            {
                field("Type "; "Item Type")
                {
                    ApplicationArea = All;
                    LookupPageId = 50006;
                }
                field(Colour; Colour)
                {
                    ApplicationArea = All;
                    LookupPageId = 50006;
                }
                field(Finish; Finish)
                {
                    ApplicationArea = All;
                    LookupPageId = 50006;
                }
                field(Material; Material)
                {
                    ApplicationArea = All;
                    LookupPageId = 50006;
                }
                field(Dimensions; Dimensions)
                {
                    ApplicationArea = All;
                    LookupPageId = 50006;
                }
                field(Lampholder; Lampholder)
                {
                    ApplicationArea = All;
                    LookupPageId = 50006;
                }
                field(Wattage; Wattage)
                {
                    ApplicationArea = All;
                    LookupPageId = 50006;
                }
                field("ATTRIBUTE 8"; "ATTRIBUTE 8")
                {
                    ApplicationArea = All;
                    LookupPageId = 50006;
                }
                field("ATTRIBUTE 9"; "ATTRIBUTE 9")
                {
                    ApplicationArea = All;
                    LookupPageId = 50006;
                }
            }
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


    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        grecInventorySetup: Record "Inventory Setup";
    begin
        grecInventorySetup.Get();
        if grecInventorySetup."Item Mandatory Field" then begin
            if "No." = '' then
                Error('No. is mandatory and must have a value.');
            if Description = '' then
                Error('Description is mandatory and must have a value.');
            if "Base Unit of Measure" = '' then
                Error('Base Unit of Measure is mandatory and must have a value.');
            if "Inventory Posting Group" = '' then
                Error('Inventory Posting Group is mandatory and must have a value.');
            if "Gen. Prod. Posting Group" = '' then
                Error('Gen. Prod. Posting Group is mandatory and must have a value.');
            if "VAT Prod. Posting Group" = '' then
                Error('VAT Prod. Posting Group is mandatory and must have a value.');
            if "Rounding Precision" = 0 then
                Error('Rounding Precision is mandatory and must have a value.');
            if "Reordering Policy" = "Reordering Policy"::" " then
                Error('"Reordering Policy" is mandatory and must have a value.');
        end;
    end;

    var
        gboolUnitCost: Boolean;
        gboolUnitPrice: Boolean;
        grecInventorySetup: Record "Inventory Setup";
}