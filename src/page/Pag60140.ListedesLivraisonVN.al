page 60140 "Liste des Livraison VN"
{
    // version Preparation VN

    Caption = 'Liste des Livraison VN';
    CardPageID = "Fiche Livraison VN";
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    PopulateAllFields = true;
    RefreshOnActivate = true;
    SourceTable = Table60025;
    SourceTableView = SORTING(Preparation No)
                      WHERE(Service Type=CONST(Livraison));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Preparation No";"Preparation No")
                {
                }
                field(VIN;VIN)
                {
                    StyleExpr = Style;
                }
                field("Status Livraison";"Status Livraison")
                {
                    Caption = 'Status';
                }
                field("Vehicle No.";"Vehicle No.")
                {
                }
                field("Service Item Description";"Service Item Description")
                {
                }
                field("Creation date";"Creation date")
                {
                }
                field("Heure creation";"Heure creation")
                {
                }
                field("Date rendez vous";"Date rendez vous")
                {
                }
                field("Created By";"Created By")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Date Livraison";"Date Livraison")
                {
                }
                field(Name;Name)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        //KK
        IF CheckVin(VIN,"Customer No.") THEN
          Style := 'Favorable'
        ELSE Style := 'Attention';
        //END KK
    end;

    trigger OnAfterGetRecord();
    begin
        //KK
        IF CheckVin(VIN,"Customer No.") THEN
          Style := 'Favorable'
        ELSE Style := 'Attention';
        //END KK
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;
    end;

    var
        UserMgt : Codeunit "5700";
        Style : Text;
}

