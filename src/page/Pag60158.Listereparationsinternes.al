page 60158 "Liste reparations internes"
{
    // version SAV Automobile

    CaptionML = ENU='Reception Internal repair list',
                FRA='Liste reparations internes';
    CardPageID = "Fiche Réparation interne";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60008;
    SourceTableView = SORTING(Reception No)
                      ORDER(Ascending)
                      WHERE(Service Type=CONST(Internal Repair));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reception No";"Reception No")
                {
                }
                field("Vehicle No.";"Vehicle No.")
                {
                }
                field(VIN;VIN)
                {
                }
                field(Name;Name)
                {
                }
                field("Status SR";"Status SR")
                {
                    Caption = 'Status';
                }
                field(Priority;Priority)
                {
                }
                field("Service Item No.";"Service Item No.")
                {
                }
                field("Service Item Description";"Service Item Description")
                {
                }
                field("Creation date";"Creation date")
                {
                }
                field("Heur creation";"Heur creation")
                {
                }
                field("Created By";"Created By")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin

        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;

        FILTERGROUP(2);
        SETRANGE("Service Type","Service Type"::"Internal Repair");
        FILTERGROUP(0);
    end;

    var
        UserMgt : Codeunit "5700";
}

