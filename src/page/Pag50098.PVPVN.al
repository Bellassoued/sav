page 50098 "PV PVN."
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
                            Status Livraison=FILTER(Livrée),
                            Type Client=FILTER(A));

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
                field("Num PV";"Num PV")
                {
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
            action("Imprimer PV")
            {
                Image = PriceWorksheet;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    MARKEDONLY(TRUE);
                    IF FINDFIRST THEN BEGIN
                      NumClient := "Customer No.";
                      RecSalesSetup.GET;
                      REPEAT
                        IF NumClient<>"Customer No." THEN BEGIN
                          MARKEDONLY(FALSE);
                          ERROR(TXT50000);
                        END;
                      UNTIL NEXT=0;

                      REPORT.RUN(50089,TRUE,TRUE,Rec);

                      MARKEDONLY(FALSE);
                    END ELSE ERROR(TXT50001);
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
        RecCustomer : Record "18";
}

