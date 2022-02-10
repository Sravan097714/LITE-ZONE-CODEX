report 50023 "Item List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report\Layout\ItemList.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = sorting("No.");
            column(CompAddr1; CompAddr[1]) { }
            column(CompAddr2; CompAddr[2]) { }
            column(CompAddr3; CompAddr[3]) { }
            column(CompAddr4; CompAddr[4]) { }


            column(ItemA1; ItemA[1]) { }
            column(ItemA2; ItemA[2]) { }
            column(ItemA3; ItemA[3]) { }
            column(ItemA4; ItemA[4]) { }
            column(ItemA5; ItemA[5]) { }
            column(ItemA6; ItemA[6]) { }


            column(ItemNo1; ItemNo[1]) { }
            column(ItemNo2; ItemNo[2]) { }
            column(ItemNo3; ItemNo[3]) { }
            column(ItemNo4; ItemNo[4]) { }
            column(ItemNo5; ItemNo[5]) { }
            column(ItemNo6; ItemNo[6]) { }


            column(ItemDesc1; ItemDesc[1]) { }
            column(ItemDesc2; ItemDesc[2]) { }
            column(ItemDesc3; ItemDesc[3]) { }
            column(ItemDesc4; ItemDesc[4]) { }
            column(ItemDesc5; ItemDesc[5]) { }
            column(ItemDesc6; ItemDesc[6]) { }


            column(ItemList1; ItemList[1].Picture) { }
            column(ItemList2; ItemList[2].Picture) { }
            column(ItemList3; ItemList[3].Picture) { }
            column(ItemList4; ItemList[4].Picture) { }
            column(ItemList5; ItemList[5].Picture) { }
            column(ItemList6; ItemList[6].Picture) { }


            trigger OnAfterGetRecord()
            begin
                FOR i := 1 TO 6 DO BEGIN
                    Item.SETFILTER("No.", ItemList[i]."No.");
                    Item.SETRANGE("No.", ItemList[i]."No.");
                    IF Item.FIND('-') THEN BEGIN
                        ItemList[i].GET(ItemList[i]."No.");
                        Item.GET(ItemList[i]."No.");
                        ItemNo[i] := Item."No.";
                        ItemDesc[i] := Item.Description;
                        IF (i = 1) THEN BEGIN
                            ItemA[i] := 'Item 1';
                        END ELSE BEGIN
                            IF (i = 2) THEN BEGIN
                                ItemA[i] := 'Item 2';
                            END ELSE BEGIN
                                IF (i = 3) THEN BEGIN
                                    ItemA[i] := 'Item 3';
                                END ELSE BEGIN
                                    IF (i = 4) THEN BEGIN
                                        ItemA[i] := 'Item 4';
                                    END ELSE BEGIN
                                        IF (i = 5) THEN BEGIN
                                            ItemA[i] := 'Item 5';
                                        END ELSE BEGIN
                                            IF (i = 6) THEN BEGIN
                                                ItemA[i] := 'Item 6';
                                            END;
                                        END;
                                    END;
                                END;
                            END;
                        END;
                        //ItemList[i].CALCFIELDS(Picture);
                    END;
                END;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field("Item 1"; ItemList[1]."No.")
                    {
                        ApplicationArea = All;
                        TableRelation = Item;
                    }
                    field("Item 2"; ItemList[2]."No.")
                    {
                        ApplicationArea = All;
                        TableRelation = Item;
                    }
                    field("Item 3"; ItemList[3]."No.")
                    {
                        ApplicationArea = All;
                        TableRelation = Item;
                    }
                    field("Item 4"; ItemList[4]."No.")
                    {
                        ApplicationArea = All;
                        TableRelation = Item;
                    }
                    field("Item 5"; ItemList[5]."No.")
                    {
                        ApplicationArea = All;
                        TableRelation = Item;
                    }
                    field("Item 6"; ItemList[6]."No.")
                    {
                        ApplicationArea = All;
                        TableRelation = Item;
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        CompInfo.GET;
        CompAddr[1] := CompInfo.Name;
        CompAddr[2] := CompInfo.Address;
        CompAddr[3] := CompInfo."Address 2";
        CompAddr[4] := CompInfo.City;
        COMPRESSARRAY(CompAddr);
    end;


    var
        CompInfo: Record "Company Information";
        CompAddr: Array[4] of Text;
        ItemA: array[6] of Text;
        ItemList: array[6] of Record Item;
        ItemNo: array[6] of Text;
        ItemDesc: array[6] of Text;
        i: Integer;
}