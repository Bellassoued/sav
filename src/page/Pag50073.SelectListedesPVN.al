page 50073 "Select Liste des PVN"
{
    // version Preparation VN

    Caption = 'liste des Preparation VN';
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60025;
    SourceTableView = SORTING(Preparation No)
                      WHERE(Service Type=CONST(Préparation),
                            Existe Fiche Livraison=CONST(No),
                            Demandé=CONST(No));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sélectionner";MARK)
                {
                }
                field("Preparation No";"Preparation No")
                {
                    Editable = false;
                }
                field(VIN;VIN)
                {
                    Editable = false;
                }
                field("Status Préparation";"Status Préparation")
                {
                    Editable = false;
                }
                field("Vehicle No.";"Vehicle No.")
                {
                    Editable = false;
                }
                field("Service Item Description";"Service Item Description")
                {
                    Editable = false;
                }
                field("Creation date";"Creation date")
                {
                    Editable = false;
                }
                field("Heure creation";"Heure creation")
                {
                    Editable = false;
                }
                field("Date de préparation souhaité";"Date de préparation souhaité")
                {
                    Editable = false;
                }
                field("Date de préparation prévu";"Date de préparation prévu")
                {
                    Editable = false;
                }
                field("Created By";"Created By")
                {
                    Editable = false;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Editable = false;
                }
                field("Existe Fiche Livraison";"Existe Fiche Livraison")
                {
                    Editable = false;
                }
                field("N° Matriculation";"N° Matriculation")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sélectionner")
            {
                Image = SelectEntries;
                Promoted = true;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+g';

                trigger OnAction();
                var
                    Rec338LOCAL : Record "338" temporary;
                begin
                    MARK(NOT MARK);
                end;
            }
            action("Tous Sélectionner")
            {
                Image = SelectField;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    IF FINDSET THEN
                    REPEAT
                      MARK(NOT MARK)
                    UNTIL NEXT = 0;
                end;
            }
            action("Filtrer sur Sélectionner")
            {
                Image = FilterLines;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    MARKEDONLY(NOT MARKEDONLY)
                end;
            }
            action("Supprimer la sélection")
            {
                Image = Delete;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    CLEARMARKS
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        CurrPage.LOOKUPMODE(TRUE);

        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;

        FILTERGROUP(2);
        SETRANGE("Service Type","Service Type"::Préparation);
        SETRANGE("Status Préparation","Status Préparation"::"Véhicule Préparée");
        SETRANGE("Existe Fiche Livraison",FALSE) ;
        SETRANGE(Accepté,FALSE);
        SETRANGE("CheckListe Validée",TRUE);
        SETFILTER("N° Matriculation",'<> ''''');
        FILTERGROUP(0);
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    var
        NoSeries : Code[20];
    begin
        IF CloseAction IN [ACTION::OK] THEN BEGIN
          MARKEDONLY(TRUE);
          ServiceMgtSetup.GET;
          ServiceMgtSetup.TESTFIELD("PVN Orderer VIN Nos.");
          NoSeriesMgt.InitSeries(ServiceMgtSetup."PVN Orderer VIN Nos.",ServiceMgtSetup."PVN Orderer VIN Nos.",TODAY,NoSeries,ServiceMgtSetup."PVN Orderer VIN Nos.");
          MODIFYALL("No Demande VIN",NoSeries);
          MODIFYALL("Date Demande",CURRENTDATETIME);
          MODIFYALL(Demandé,TRUE);
        END;
    end;

    var
        UserMgt : Codeunit "5700";
        DemandeVisible : Boolean;
        ServiceMgtSetup : Record "5911";
        NoSeriesMgt : Codeunit "396";
}

