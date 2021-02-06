page 60382 "Manquant PVN INCADEA"
{
    PageType = List;
    SourceTable = Table50089;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(VIN;VIN)
                {
                }
                field(Article;Article)
                {
                }
                field(Quantité;Quantité)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Crées Ordre de préparation")
            {
                Image = PostedShipment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    RecPreparationVN : Record "60025";
                    LRecServiceHeader : Record "5900";
                    LRecServiceLine : Record "5902";
                    LRecServiceLineInsert : Record "5902";
                    LRecServiceItemLine : Record "5901";
                begin
                    //TESTFIELD("Statut PVN","Statut PVN"::"Préparation lancée");
                    TESTFIELD(VIN);
                    TESTFIELD(Article);
                    //IF (Emplacement=Emplacement::"Chez Aures Auto") THEN
                    //BEGIN
                      CLEAR(RecPreparationVN);
                      RecPreparationVN.SETRANGE(VIN,VIN);
                      //RecPreparationVN.SETRANGE(RecPreparationVN."Service Type",RecPreparationVN."Service Type"::"Préparation");
                      RecPreparationVN.SETRANGE("Preparation No","No Préparation");
                      IF NOT RecPreparationVN.FINDFIRST THEN
                      BEGIN
                         // IF CONFIRM(TXT50000)THEN
                          BEGIN
                              CLEAR(RecPreparationVN);
                              RecPreparationVN."Service Type":=RecPreparationVN."Service Type"::Préparation;
                              RecPreparationVN.FctSetAncientManquant(TRUE);
                              RecPreparationVN.VALIDATE(VIN,VIN);
                              IF RecPreparationVN.INSERT(TRUE) THEN
                              BEGIN
                                  CuSAVManagement.CreateServOrderFromPrpVN(RecPreparationVN);
                                  LRecServiceHeader.RESET;
                                  LRecServiceHeader.SETRANGE("Reception No",RecPreparationVN."Preparation No");
                                  LRecServiceHeader.FINDFIRST;
                                  LRecServiceItemLine.RESET;
                                  LRecServiceItemLine.SETRANGE("Document Type",LRecServiceHeader."Document Type");
                                  LRecServiceItemLine.SETRANGE("Document No.",LRecServiceHeader."No.");
                                  LRecServiceItemLine.FINDFIRST;
                                  LRecServiceLine.RESET;
                                  LRecServiceLine.SETRANGE("Document Type",LRecServiceHeader."Document Type");
                                  LRecServiceLine.SETRANGE("Document No.",LRecServiceHeader."No.");
                                  IF LRecServiceLine.FINDSET THEN BEGIN
                                    LRecServiceLine.DELETEALL;
                                    LRecServiceLineInsert.INIT;
                                    LRecServiceLineInsert.VALIDATE("Document Type",LRecServiceHeader."Document Type");
                                    LRecServiceLineInsert.VALIDATE("Document No.",LRecServiceHeader."No.");
                                    LRecServiceLineInsert.VALIDATE(Type,LRecServiceLineInsert.Type::Item);
                                    LRecServiceLineInsert.VALIDATE("No.",Article);
                                    LRecServiceLineInsert.VALIDATE(Quantity,Quantité);
                                    LRecServiceLineInsert.VALIDATE("Service Item No.",LRecServiceItemLine."Service Item No.");
                                    LRecServiceLineInsert.VALIDATE("Service Item Line No.",LRecServiceItemLine."Line No.");
                                    LRecServiceLineInsert.INSERT(TRUE);
                                  END;
                                  PAGE.RUN(PAGE::"Fiche Preparation VN",RecPreparationVN);
                                  "No Préparation" := RecPreparationVN."Preparation No";
                                  //"Statut PVN" := "Statut PVN"::"Ordre de préparation crée";
                                  //"Début PVN"   :=CURRENTDATETIME;
                                  MODIFY;

                              END;
                          END;
                     // END ELSE ERROR(TXT50001,RecPreparationVN."Preparation No","Serial No.");
                    END ELSE PAGE.RUN(PAGE::"Fiche Preparation VN",RecPreparationVN);
                end;
            }
        }
    }

    var
        CuSAVManagement : Codeunit "50010";
        GRecServiceItemLine : Record "5901";
}

