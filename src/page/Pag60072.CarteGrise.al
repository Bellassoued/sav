page 60072 "Carte Grise"
{
    // version MAZDA13

    PageType = Document;
    SourceTable = Table60015;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("N° Bordereau";"N° Bordereau")
                {
                }
                field(Statut;Statut)
                {
                    Editable = false;
                }
                field("Date Création";"Date Création")
                {
                }
                field("Date Emission";"Date Emission")
                {
                }
                field("Nbre Carte Grise";"Nbre Carte Grise")
                {
                }
            }
            part(;60073)
            {
                SubPageLink = N° Bordereau=FIELD(N° Bordereau);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group()
            {
                action("Extraire VINs ")
                {
                    Image = Export;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        Rec336Temp : Record "336" temporary;
                    begin
                        //Rec336Temp.DELETEALL;
                        //Rec336Temp.INIT;
                        //Rec336Temp."Entry No." := 10000;
                        //Rec336Temp."Item No."  := "Modèle Véhicule";
                        //Rec336Temp."Location Code"  := "Location Code";
                        //Rec336Temp."Variant Code"  := "Code Variant";
                        //Rec336Temp.INSERT;
                        TESTFIELD("N° Bordereau");

                        ItemTrackingDataCollection.AssistEditLotSerialNoMAZDA2(Rec336Temp,TRUE,1,0,1000000,Rec);
                    end;
                }
                action("Envoyer Bordereau")
                {
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecSalesReceivablesSetup : Record "311";
                    begin
                        TESTFIELD(Statut,Statut::Encours);
                        TESTFIELD("Date Emission");
                        //SM 061217
                        RecLigneCarteGrise.RESET;
                        RecLigneCarteGrise.SETRANGE("N° Bordereau","N° Bordereau");
                        RecLigneCarteGrise.SETRANGE(Statut,RecLigneCarteGrise.Statut::Reçue);
                        IF NOT RecLigneCarteGrise.ISEMPTY THEN
                          ERROR(TXT50000);
                        //END SM
                        //SM MAZDA856
                        /*RecSalesReceivablesSetup.GET;
                        //SM OLD IF RecSalesReceivablesSetup."Contrôle Envoie Carte Grise" THEN BEGIN
                          RecLigneCarteGrise2.RESET;
                          RecLigneCarteGrise2.SETRANGE("N° Bordereau","N° Bordereau");
                          //ADD KK 11042016
                        //OLD KT 2107  RecLigneCarteGrise2.SETRANGE("Autorisé Envoie CG",FALSE);
                        
                          IF RecLigneCarteGrise2.FINDSET THEN BEGIN
                            REPEAT
                              //OLD RecLigneCarteGrise2.UpdateCustomerPaymentStatus();
                              RecLigneCarteGrise2."Date Heure Depôt":=CREATEDATETIME(Rec."Date Emission",Rec."Time Emission");
                        
                              RecLigneCarteGrise2.MODIFY;
                            UNTIL RecLigneCarteGrise2.NEXT = 0;
                          END;
                          */
                         /* SM 060917 TMP
                         RecLigneCarteGrise2.RESET;
                          RecLigneCarteGrise2.SETRANGE("N° Bordereau","N° Bordereau");
                          RecLigneCarteGrise2.SETRANGE("Payment Status",RecLigneCarteGrise2."Payment Status"::"Non Soldé",RecLigneCarteGrise2."Payment Status"::Soldé);
                          //ADD KK 11042016
                          RecLigneCarteGrise2.SETRANGE("Autorisé Envoie CG",FALSE);
                          IF NOT RecLigneCarteGrise2.ISEMPTY THEN
                            ERROR(TXT50001);*/
                        //SM OLD END;
                        
                        //END SM
                        
                        Statut := Statut::Envoyé;
                        "Date Emission" := WORKDATE;
                        //SM MAZDA13.3
                        "Time Emission" := TIME;
                        //END SM
                        MODIFY;
                        
                        RecLigneCarteGrise.RESET;
                        RecLigneCarteGrise.SETRANGE("N° Bordereau","N° Bordereau");
                        IF RecLigneCarteGrise.FINDSET THEN BEGIN
                          REPEAT
                            RecLigneCarteGrise.Statut:=RecLigneCarteGrise.Statut::Envoyé;
                            //Old KT 121017 RecLigneCarteGrise.MODIFYALL(Statut,RecLigneCarteGrise.Statut::Envoyé);
                            //SM 130917
                            RecLigneCarteGrise."Date Heure Depôt":=CREATEDATETIME(Rec."Date Emission",Rec."Time Emission");
                            RecLigneCarteGrise.MODIFY;
                            //Old KT 121017 RecLigneCarteGrise.MODIFYALL("Date Heure Depôt",CREATEDATETIME(Rec."Date Emission",Rec."Time Emission"));
                            GRecServiceItem.RESET;
                            GRecServiceItem.SETRANGE("Serial No.",RecLigneCarteGrise.VIN);
                            IF GRecServiceItem.FINDSET THEN BEGIN
                              //GRecServiceItem."Depot C.Grise":=CREATEDATETIME(Rec."Date Emission",Rec."Time Emission");
                              GRecServiceItem.MODIFYALL("Depot C.Grise",CREATEDATETIME(Rec."Date Emission",Rec."Time Emission"));
                            END;
                          UNTIL RecLigneCarteGrise.NEXT=0;
                        END;
                        
                        //END SM

                    end;
                }
                action("Annuler Envoi Bordereau")
                {
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        TESTFIELD(Statut,Statut::Envoyé);
                        RecLigneCarteGrise.RESET;
                        RecLigneCarteGrise.SETRANGE("N° Bordereau","N° Bordereau");
                        RecLigneCarteGrise.SETRANGE(Statut,RecLigneCarteGrise.Statut::Reçue);//"CHQ Préparé"//SM 061217
                        IF NOT RecLigneCarteGrise.ISEMPTY THEN
                          ERROR(TXT50000);

                        Statut := Statut::Encours;
                        "Date Emission" := 0D;
                        //SM MAZDA13.3
                        "Time Emission" := 0T;
                        //END SM

                        MODIFY;
                        RecLigneCarteGrise.RESET;
                        RecLigneCarteGrise.SETRANGE("N° Bordereau","N° Bordereau");
                        RecLigneCarteGrise.MODIFYALL(Statut,RecLigneCarteGrise.Statut::Encours);
                    end;
                }
                action("Imprimer Bordereau")
                {
                    Image = PrintVoucher;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunPageOnRec = true;

                    trigger OnAction();
                    begin
                        RecCarteGriseEntete.RESET;
                        RecCarteGriseEntete.SETRANGE("N° Bordereau",Rec."N° Bordereau");
                        RepBoredereauCarteGrise2.SETTABLEVIEW(RecCarteGriseEntete);
                        RepBoredereauCarteGrise2.RUN;
                    end;
                }
                action("Imprimer attestation de ventes")
                {
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        LRepAttestationDeVentes : Report "50057";
                        LRecCarteGriseEntete : Record "60015";
                    begin
                        LRecCarteGriseEntete.RESET;
                        LRecCarteGriseEntete.SETRANGE("N° Bordereau","N° Bordereau");
                        LRecCarteGriseEntete.FINDFIRST;
                        CLEAR(LRepAttestationDeVentes);
                        LRepAttestationDeVentes.SETTABLEVIEW(LRecCarteGriseEntete);
                        LRepAttestationDeVentes.RUN;
                    end;
                }
            }
        }
    }

    var
        RecLigneCarteGrise : Record "60016";
        TXT50000 : Label 'Il existe des lignes réceptionnés';
        ItemTrackingDataCollection : Codeunit "6501";
        RepBoredereauCarteGrise2 : Report "50003";
        RecCarteGriseEntete : Record "60015";
        RecLigneCarteGrise2 : Record "60016";
        TXT50001 : Label 'Il existe au moin une carte grise non encaissé.';
        GRecServiceItem : Record "5940";
}

