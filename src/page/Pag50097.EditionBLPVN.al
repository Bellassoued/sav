page 50097 "Edition BL PVN."
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
                      WHERE(Service Type=CONST(Livraison),
                            Num BL=CONST(''),
                            Status Livraison=FILTER(Fiche Crée));

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
                }
                field(VIN;VIN)
                {
                }
                field("Status Livraison";"Status Livraison")
                {
                    Caption = 'Status';
                }
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
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
                field("Num BL";"Num BL")
                {
                    Editable = false;
                }
                field("Num PV";"Num PV")
                {
                    Enabled = false;
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
        area(reporting)
        {
            action("Imprimer bon de livraison ")
            {
                Image = PRINT;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    i : Integer;
                begin
                    MARKEDONLY(TRUE);
                    IF FINDFIRST THEN BEGIN
                      NumClient := "Customer No.";
                      RecSalesSetup.GET;
                      NoSeriesMgt.InitSeries(RecSalesSetup."Num BL PVN",xRec."Num BL",TODAY,NumBL,"No. Series");
                      REPEAT
                        IF NumClient<>"Customer No." THEN BEGIN
                          MARKEDONLY(FALSE);
                          ERROR(TXT50000);
                        END;

                        TESTFIELD("Num BL",'');
                        VALIDATE("Num BL",NumBL);

                        TESTFIELD("Plaque Monté",TRUE);
                        TESTFIELD(Lavage,TRUE);

                        IF NOT CheckVin(VIN,"Customer No.") THEN
                          TESTFIELD("Acceptation Financière",TRUE);

                        //MODIF IF NOT CUSAVManagement.CheckVINIsPaied(VIN) THEN
                        //MODIF  TESTFIELD("Acceptation Financière",TRUE);

                        VALIDATE("Status Livraison","Status Livraison"::Livrée);

                        MODIFY;
                      UNTIL NEXT=0;
                      MARKEDONLY(FALSE);
                    END ELSE ERROR(TXT50001);

                    COMMIT;

                    PreparationVN.RESET;
                    PreparationVN.SETRANGE("Num BL",NumBL);
                    // FOR i := 1 TO 3 DO
                      REPORT.RUN(50088,FALSE,FALSE,PreparationVN);

                    CLEARMARKS;
                end;
            }
        }
    }

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
        RecSalesSetup : Record "311";
        NoSeriesMgt : Codeunit "396";
        NumBL : Code[20];
        NumPV : Code[20];
        PreparationVN : Record "60025";
        BL : Report "50088";
        NoClient : Code[20];
        NumClient : Code[20];
        TXT50000 : Label 'Les VIN sélectionnés n''appartiennent pas au même client';
        TXT50001 : Label 'aucune ligne sélectionné';
        CUSAVManagement : Codeunit "50010";
}

