pageextension 50125 ProdPlannerActivitiesExt extends "Production Planner Activities"
{
    layout
    {
        addlast("Production Orders")
        {
            field("Released Prod. Orders - Block"; "Released Prod. Orders - Block")
            {
                ApplicationArea = Manufacturing;
                DrillDownPageID = "Released Production Orders";
            }
        }
    }
}