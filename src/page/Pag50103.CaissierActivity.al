page 50103 "Caissier Activity"
{
    // version AC Caissier

    Caption = 'Global';
    PageType = CardPart;
    PopulateAllFields = true;
    RefreshOnActivate = true;
    SourceTable = Table9054;

    layout
    {
        area(content)
        {
            field(FiltreCoffre;FiltreCoffre)
            {
                Style = StrongAccent;
                StyleExpr = TRUE;
                Visible = false;
            }
            field("Coffre : ";NomCoffre)
            {
                Caption = 'Coffre :';
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
            cuegroup("EN Coffre")
            {
                field(ChequeEnCoffre;ChequeEnCoffre)
                {
                    CaptionML = ENU='Chèque En Coffre',
                                FRA='Chèque En Coffre';

                    trigger OnDrillDown();
                    begin
                        //__________________________Chèque en coffre
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                        PaymentLine.SETFILTER("Status No.",'%1|%2|%3',20000,236875,226875);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN

                    end;
                }
                field(Chequegarantie;ChequeGarantie)
                {
                    CaptionML = ENU='Chèque de Garantie',
                                FRA='Chèque de Garantie';

                    trigger OnDrillDown();
                    begin
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                        PaymentLine.SETFILTER("Status No.",'%1',8750);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }
                field("Effet en Coffre";EffetEnCoffre)
                {
                    CaptionML = ENU='Effet en Coffre',
                                FRA='Effet en Coffre';

                    trigger OnDrillDown();
                    begin
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
                        PaymentLine.SETFILTER("Status No.",'%1',20000);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }
                field(EspeceEnCoffre;EspeceEnCoffre)
                {
                    CaptionML = ENU='Espèce en Coffre',
                                FRA='Espèce en Coffre';

                    trigger OnDrillDown();
                    begin
                        //__________________________Effet en transit
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-ESP');
                        PaymentLine.SETFILTER("Status No.",'%1',40000);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }
                field(EncaisTPE;EncaisTPE)
                {
                    Caption = 'Encaissement TPE';

                    trigger OnDrillDown();
                    begin
                        //__________________________Chèque en coffre
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','TPE-CLT');
                        PaymentLine.SETFILTER("Status No.",'%1',40000);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }

                actions
                {
                    action("Changer Profil")
                    {
                        Image = Change;

                        trigger OnAction();
                        var
                            MgtAuresFinance : Codeunit "70006";
                        begin
                            FiltreCoffre := '';
                            MgtAuresFinance.RUN;
                            RecUserSetup.GET(USERID);

                            CLEAR(ProfilReglement);
                            ProfilReglement.SETRANGE(Coffre,RecUserSetup."Filtre coffre");
                            ProfilReglement.SETRANGE("Centre de Gestion",RecUserSetup."Tréso Resp. Ctr. Filter");
                            IF ProfilReglement.FIND('-') THEN
                            //IF ProfilReglement."Filter par Coffre" THEN
                            BEGIN
                            GET;
                            DELETEALL;
                            FiltreCoffre:=RecUserSetup."Filtre coffre";
                            CLEAR(Coffre);
                                Coffre.GET(FiltreCoffre);
                                NomCoffre :=  Coffre.Désignation;
                            INSERT;
                            COMMIT;
                            END;




                            ChequeImpaye := 0;
                            ChequeDouteux:= 0;
                            EffetImpaye:= 0;
                            EffetDouteux:= 0;


                            FilteBrParCoffre := FALSE;
                            FilteBrParCentreG := FALSE;
                            AdminAllCentre := FALSE;

                            CLEAR(ProfilReglement);
                            ProfilReglement.SETRANGE(Coffre,RecUserSetup."Filtre coffre");
                            ProfilReglement.SETRANGE("Centre de Gestion",RecUserSetup."Tréso Resp. Ctr. Filter");
                            ProfilReglement.SETRANGE("Code Profil",RecUserSetup."Profil Réglement");
                            ProfilReglement.FINDFIRST;
                            IF ProfilReglement."Filter par Coffre" THEN FilteBrParCoffre := TRUE;
                            IF ProfilReglement."Filter par Centre de gestion" THEN FilteBrParCentreG := TRUE;

                            //__________________________Chèque en coffre
                            CLEAR(PaymentLine);
                            PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                            PaymentLine.SETFILTER("Status No.",'%1|%2|%3',20000,236875,226875);
                            PaymentLine.SETFILTER("Copied To No.",'%1','');
                            IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                            IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                            PaymentLine.CALCSUMS("Amount (LCY)");
                            ChequeEnCoffre:=  ABS(PaymentLine."Amount (LCY)");
                            COMMIT;


                             //__________________________Chèque garantie
                            CLEAR(PaymentLine);
                            PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                            PaymentLine.SETFILTER("Status No.",'%1',8750);
                            PaymentLine.SETFILTER("Copied To No.",'%1','');
                            IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                            IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                            PaymentLine.CALCSUMS("Amount (LCY)");
                            ChequeGarantie:=  ABS(PaymentLine."Amount (LCY)");
                            COMMIT;


                            //__________________________Chèque en transit
                            CLEAR(PaymentLine);
                            PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                            PaymentLine.SETFILTER("Status No.",'%1|%2',226875,196875);
                            PaymentLine.SETFILTER("Copied To No.",'%1','');
                            IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                            IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                            PaymentLine.CALCSUMS("Amount (LCY)");
                            ChequeEnTransit:=  ABS(PaymentLine."Amount (LCY)");
                            COMMIT;


                            //__________________________Chèque encaisse en banque
                            CLEAR(PaymentLine);
                            PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                            PaymentLine.SETFILTER("Status No.",'%1|%2',80000,92500);
                            PaymentLine.SETFILTER("Copied To No.",'%1','');
                            IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                            IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                            PaymentLine.CALCSUMS("Amount (LCY)");
                            ChequeEncaisseEnBanqe:=  ABS(PaymentLine."Amount (LCY)");
                            COMMIT;

                            //__________________________Cheque -Impayé
                            CLEAR(CustLedgerEntry);
                            CustLedgerEntry.SETFILTER("Customer Posting Group",'%1','CL-CHQIMP');
                            CustLedgerEntry.SETFILTER("Posting Date",'>=%1',020118D);
                            IF CustLedgerEntry.FINDFIRST THEN
                            REPEAT
                            CustLedgerEntry.CALCFIELDS("Remaining Amount");
                            ChequeImpaye +=  ABS(CustLedgerEntry."Remaining Amount");
                            UNTIL CustLedgerEntry.NEXT = 0;
                            COMMIT;


                            //__________________________Anticident Chq-Impayé
                            CLEAR(PaymentLine);
                            PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                            PaymentLine.SETFILTER("Status No.",'%1|%2|%3',134375,116875,116875);
                            PaymentLine.SETFILTER("Posting Date",'>=%1',020118D);
                            AnticedentChequeImp:=  PaymentLine.COUNT;
                            COMMIT;


                            //__________________________Effet en coffre
                            CLEAR(PaymentLine);
                            PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
                            PaymentLine.SETFILTER("Status No.",'%1',20000);
                            PaymentLine.SETFILTER("Copied To No.",'%1','');
                            IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                            IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                            PaymentLine.CALCSUMS("Amount (LCY)");
                            EffetEnCoffre :=  ABS(PaymentLine."Amount (LCY)");
                            COMMIT;


                            //__________________________Effet en transit
                            CLEAR(PaymentLine);
                            PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
                            PaymentLine.SETFILTER("Status No.",'%1|%2',206875,194375);
                            PaymentLine.SETFILTER("Copied To No.",'%1','');
                            IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                            IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                            PaymentLine.CALCSUMS("Amount (LCY)");
                            EffetEnTransit :=  ABS(PaymentLine."Amount (LCY)");
                            COMMIT;

                            //__________________________effet-Impayé
                            CLEAR(CustLedgerEntry);
                            CustLedgerEntry.SETFILTER("Customer Posting Group",'%1','CL-EFFIMP');
                            CustLedgerEntry.SETFILTER("Posting Date",'>=%1',010118D);
                            IF CustLedgerEntry.FINDFIRST THEN
                            REPEAT
                            CustLedgerEntry.CALCFIELDS("Remaining Amount");
                            EffetImpaye +=  ABS(CustLedgerEntry."Remaining Amount");
                            UNTIL CustLedgerEntry.NEXT = 0;
                            COMMIT;



                            //__________________________Antici - Effet-Impayé
                            CLEAR(PaymentLine);
                            PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
                            PaymentLine.SETFILTER("Status No.",'%1',126875);
                            PaymentLine.SETFILTER("Posting Date",'>=%1',010118D);
                            AnticédentEffetImp :=  PaymentLine.COUNT;
                            COMMIT;

                            //__________________________Effet en transit
                            CLEAR(PaymentLine);
                            PaymentLine.SETFILTER("Payment Class",'%1','ENC-ESP');
                            PaymentLine.SETFILTER("Status No.",'%1',40000);
                            PaymentLine.SETFILTER("Copied To No.",'%1','');
                            IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                            IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                            PaymentLine.CALCSUMS("Amount (LCY)");
                            EspeceEnCoffre :=  ABS(PaymentLine."Amount (LCY)");
                            COMMIT;


                            CurrPage.UPDATE;
                        end;
                    }
                }
            }
            cuegroup()
            {
                field("Inscription VN ";EspeceInscription)
                {

                    trigger OnDrillDown();
                    begin
                        //__________________________Effet en transit
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-INSCP');
                        PaymentLine.SETFILTER("Status No.",'%1',40000);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN

                    end;
                }
                field("Chèque en Transit";ChequeEnTransit)
                {
                    CaptionML = ELL='Chèque en Transit',
                                FRA='Chèque en Transit';

                    trigger OnDrillDown();
                    begin
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                        PaymentLine.SETFILTER("Status No.",'%1|%2',226875,196875);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }
                field("Effet En Transit";EffetEnTransit)
                {
                    Caption = 'Effet En Transit';

                    trigger OnDrillDown();
                    begin
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
                        PaymentLine.SETFILTER("Status No.",'%1|%2',206875,194375);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }
                field("Chèque en cours de notification";ChqVerseNonNotifie)
                {

                    trigger OnDrillDown();
                    begin


                        //__________________________chèque versé non notifié
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                        PaymentLine.SETFILTER("Status No.",'%1',80000);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }
                field("Effet en cours de notification";EffetVerseNonNotifie)
                {

                    trigger OnDrillDown();
                    begin
                        //__________________________Effet versé non notifié
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
                        PaymentLine.SETFILTER("Status No.",'%1|%2',80000,30000);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }
                field("Chèque Encaissé ";ChequeEncaisseEnBanqe)
                {
                    CaptionML = ELL='Chèque Encaissé ',
                                FRA='Chèque Encaissé ';

                    trigger OnDrillDown();
                    begin
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                        PaymentLine.SETFILTER("Status No.",'%1',80000);
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
                        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }
            }
            cuegroup("Impayé")
            {
                field("Chèque Impayé";ChequeImpaye)
                {
                    CaptionML = ENU='Chèque Impayé',
                                FRA='Chèque Impayé';

                    trigger OnDrillDown();
                    begin
                        //__________________________Cheque -Impayé
                        CLEAR(CustLedgerEntry);
                        CustLedgerEntry.SETFILTER("Customer Posting Group",'%1','CL-CHQIMP');
                        CustLedgerEntry.SETFILTER("Posting Date",'>=%1',020118D);
                        IF PAGE.RUNMODAL(25,CustLedgerEntry) = ACTION::LookupOK THEN
                    end;
                }
                field("Anticéd. Chq. Imp.";AnticedentChequeImp)
                {
                    Caption = 'Anticéd. Chq. Imp.';
                    DecimalPlaces = 0:0;

                    trigger OnDrillDown();
                    begin

                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
                        PaymentLine.SETFILTER("Status No.",'%1|%2|%3',134375,116875,116875);
                        PaymentLine.SETFILTER("Posting Date",'>=%1',020118D);
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }
                field("Effet Impayé";EffetImpaye)
                {
                    CaptionML = ENU='Effet Impayé',
                                FRA='Effet Impayé';

                    trigger OnDrillDown();
                    begin
                        CLEAR(CustLedgerEntry);
                        CustLedgerEntry.SETFILTER("Customer Posting Group",'%1','CL-EFFIMP');
                        CustLedgerEntry.SETFILTER("Posting Date",'>=%1',020118D);
                        IF PAGE.RUNMODAL(25,CustLedgerEntry) = ACTION::LookupOK THEN
                    end;
                }
                field("Anticéd. Effet. Imp.";AnticédentEffetImp)
                {
                    CaptionML = ENU='Anticéd. Effet. Imp.',
                                FRA='Anticéd. Effet. Imp.';

                    trigger OnDrillDown();
                    begin
                        //__________________________Antici - Effet-Impayé
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
                        PaymentLine.SETFILTER("Status No.",'%1',126875);
                        PaymentLine.SETFILTER("Posting Date",'>=%1',020118D);
                        IF PAGE.RUNMODAL(70049,PaymentLine) = ACTION::LookupOK THEN
                    end;
                }
            }
            cuegroup("Demande Achat")
            {
                field("D.A prêt a régler en espèce";"D.A prêt a régler en espèce")
                {
                    Visible = AFFICHEDAESP;
                }
                field("D.A prêt a régler enchèque";"D.A prêt a régler enchèque")
                {
                    Visible = AFFICHEDAECHQ;
                }
            }
            cuegroup("Factures Comptant Non Réglées")
            {
                field(FNRPR;FNRPR)
                {
                    CaptionML = ENU='Factures Non Réglées PR',
                                FRA='Factures Non Réglées PR';

                    trigger OnDrillDown();
                    var
                        CustLedgerEntry : Record "21";
                    begin
                        //KK_27122018
                        CustLedgerEntry.RESET;
                        CustLedgerEntry.SETRANGE("Document Type",CustLedgerEntry."Document Type"::Invoice);
                        CustLedgerEntry.SETRANGE("Payment Method Code",'MP01');
                        CustLedgerEntry.SETRANGE("Order Type",CustLedgerEntry."Order Type"::PR);
                        CustLedgerEntry.SETFILTER("Remaining Amount",'<>%1',0);
                        IF PAGE.RUNMODAL(25,CustLedgerEntry) = ACTION::LookupOK THEN
                    end;
                }
                field(FNRVN;FNRVN)
                {
                    CaptionML = ENU='Factures Non Réglées VN',
                                FRA='Factures Non Réglées VN';

                    trigger OnDrillDown();
                    begin
                        //KK_27122018
                        CustLedgerEntry.RESET;
                        CustLedgerEntry.SETRANGE("Document Type",CustLedgerEntry."Document Type"::Invoice);
                        CustLedgerEntry.SETRANGE("Payment Method Code",'MP01');
                        CustLedgerEntry.SETRANGE("Order Type",CustLedgerEntry."Order Type"::VN);
                        CustLedgerEntry.SETFILTER("Remaining Amount",'<>%1',0);
                        IF PAGE.RUNMODAL(25,CustLedgerEntry) = ACTION::LookupOK THEN
                    end;
                }
            }
            cuegroup("Demande d'achat")
            {
                field("Demande achat";DA)
                {

                    trigger OnDrillDown();
                    begin
                        PurchReqHeader.RESET;
                        IF FilteBrParCentreG THEN PurchReqHeader.SETRANGE("Responsibility Center",ProfilReglement."Centre de Gestion");
                        IF PAGE.RUNMODAL(50006,PurchReqHeader) = ACTION::LookupOK THEN
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }

    trigger OnClosePage();
    begin
        FiltreCoffre := '';
    end;

    trigger OnOpenPage();
    begin
        //UserSetup.GET(USERID);
        //IF NOT UserSetup."Service Compta." THEN
          //BEGIN
              FiltreCoffre := '';
              COMMIT;
              RecUserSetup.GET(USERID);
              CLEAR(ProfilReglement);
              ProfilReglement.SETRANGE(Coffre,RecUserSetup."Filtre coffre");
              ProfilReglement.SETRANGE("Centre de Gestion",RecUserSetup."Tréso Resp. Ctr. Filter");
              IF ProfilReglement.FIND('-') THEN;
              IF ProfilReglement."Filter par Coffre" THEN
                BEGIN
                  GET;
                  DELETEALL;
                  FiltreCoffre:=RecUserSetup."Filtre coffre";
                  CLEAR(Coffre);
                  Coffre.GET(FiltreCoffre);
                  NomCoffre :=  Coffre.Désignation;
                  INSERT;
                END;
        //END;

        FilteBrParCoffre := FALSE;
        FilteBrParCentreG := FALSE;
        AdminAllCentre := FALSE;

        CLEAR(ProfilReglement);
        ProfilReglement.SETRANGE(Coffre,RecUserSetup."Filtre coffre");
        ProfilReglement.SETRANGE("Centre de Gestion",RecUserSetup."Tréso Resp. Ctr. Filter");
        ProfilReglement.SETRANGE("Code Profil",RecUserSetup."Profil Réglement");
        ProfilReglement.FINDFIRST;
        IF ProfilReglement."Filter par Coffre" THEN FilteBrParCoffre := TRUE;
        IF ProfilReglement."Filter par Centre de gestion" THEN FilteBrParCentreG := TRUE;
        IF ProfilReglement."Admin Encai-Décaiss." THEN AdminAllCentre := TRUE;
        AFFICHEDAESP := ProfilReglement."Afficher D.A a régler Espèce";
        AFFICHEDAECHQ := ProfilReglement."Afficher D.A a régler Chèque";
        //__________________________Chèque en coffre
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
        PaymentLine.SETFILTER("Status No.",'%1|%2|%3',20000,236875,226875);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        ChequeEnCoffre:=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;


         //__________________________Chèque garantie
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
        PaymentLine.SETFILTER("Status No.",'%1',8750);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        ChequeGarantie:=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;


        //__________________________Chèque en transit
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
        PaymentLine.SETFILTER("Status No.",'%1|%2',226875,196875);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        ChequeEnTransit:=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;


        //__________________________Chèque encaisse en banque
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
        PaymentLine.SETFILTER("Status No.",'%1',80000);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        ChequeEncaisseEnBanqe:=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;

        //__________________________Cheque -Impayé
        CLEAR(CustLedgerEntry);
        CustLedgerEntry.SETFILTER("Customer Posting Group",'%1','CL-CHQIMP');
        CustLedgerEntry.SETFILTER("Posting Date",'>=%1',020118D);
        IF CustLedgerEntry.FINDFIRST THEN
        REPEAT
        CustLedgerEntry.CALCFIELDS("Remaining Amount");
        ChequeImpaye +=  ABS(CustLedgerEntry."Remaining Amount");
        UNTIL CustLedgerEntry.NEXT = 0;
        COMMIT;


        //__________________________Anticident Chq-Impayé
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
        PaymentLine.SETFILTER("Status No.",'%1|%2|%3',134375,116875,116875);
        PaymentLine.SETFILTER("Posting Date",'>=%1',020118D);
        AnticedentChequeImp:=  PaymentLine.COUNT;
        COMMIT;


        //__________________________Effet en coffre
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
        PaymentLine.SETFILTER("Status No.",'%1',20000);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        EffetEnCoffre :=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;

        //__________________________Encaissement TPE
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','TPE-CLT');
        PaymentLine.SETFILTER("Status No.",'%1',40000);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        EncaisTPE :=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;

        //__________________________Effet en transit
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
        PaymentLine.SETFILTER("Status No.",'%1|%2',206875,194375);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        EffetEnTransit :=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;



        //__________________________Effet en transit
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-INSCP');
        PaymentLine.SETFILTER("Status No.",'%1',40000);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        EspeceInscription :=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;



        //__________________________effet-Impayé
        CLEAR(CustLedgerEntry);
        CustLedgerEntry.SETFILTER("Customer Posting Group",'%1','CL-EFFIMP');
        CustLedgerEntry.SETFILTER("Posting Date",'>=%1',010118D);
        IF CustLedgerEntry.FINDFIRST THEN
        REPEAT
        CustLedgerEntry.CALCFIELDS("Remaining Amount");
        EffetImpaye +=  ABS(CustLedgerEntry."Remaining Amount"); //--
        UNTIL CustLedgerEntry.NEXT = 0;
        COMMIT;



        //__________________________Antici - Effet-Impayé
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
        PaymentLine.SETFILTER("Status No.",'%1',126875);
        PaymentLine.SETFILTER("Posting Date",'>=%1',010118D);
        AnticédentEffetImp :=  PaymentLine.COUNT;
        COMMIT;

        //__________________________Effet en transit
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-ESP');
        PaymentLine.SETFILTER("Status No.",'%1',40000);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        EspeceEnCoffre :=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;



        //__________________________Effet versé non notifié
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
        PaymentLine.SETFILTER("Status No.",'%1|%2',80000,30000);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        EffetVerseNonNotifie :=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;


        //__________________________chèque versé non notifié
        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CH-CLT');
        PaymentLine.SETFILTER("Status No.",'%1',80000);
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        IF FilteBrParCoffre   THEN PaymentLine.SETFILTER(Coffre,'%1',FiltreCoffre);
        IF FilteBrParCentreG  THEN PaymentLine.SETFILTER("Centre de gestion Tréso.",'%1',ProfilReglement."Centre de Gestion");
        PaymentLine.CALCSUMS("Amount (LCY)");
        ChqVerseNonNotifie :=  ABS(PaymentLine."Amount (LCY)");
        COMMIT;






        //KK_27122018__Factures Non Réglées PR
        CustLedgerEntry.RESET;
        CustLedgerEntry.SETRANGE("Document Type",CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SETRANGE("Payment Method Code",'MP01');
        CustLedgerEntry.SETRANGE("Order Type",CustLedgerEntry."Order Type"::PR);
        CustLedgerEntry.SETFILTER("Remaining Amount",'<>%1',0);
        IF CustLedgerEntry.FINDSET THEN
          REPEAT
            CustLedgerEntry.CALCFIELDS("Remaining Amount");
            FNRPR += CustLedgerEntry."Remaining Amount";
          UNTIL CustLedgerEntry.NEXT=0;

        //KK_27122018__Factures Non Réglées VN
        CustLedgerEntry.RESET;
        CustLedgerEntry.SETRANGE("Document Type",CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SETRANGE("Payment Method Code",'MP01');
        CustLedgerEntry.SETRANGE("Order Type",CustLedgerEntry."Order Type"::VN);
        CustLedgerEntry.SETFILTER("Remaining Amount",'<>%1',0);
        IF CustLedgerEntry.FINDSET THEN
          REPEAT
            CustLedgerEntry.CALCFIELDS("Remaining Amount");
            FNRVN += CustLedgerEntry."Remaining Amount";
          UNTIL CustLedgerEntry.NEXT=0;

        //KK_281217
        PurchReqHeader.RESET;
        IF AdminAllCentre THEN DA := PurchReqHeader.COUNT;

        IF FilteBrParCentreG OR FilteBrParCoffre THEN
          BEGIN
            PurchReqHeader.SETRANGE("Responsibility Center",ProfilReglement."Centre de Gestion");
            DA := PurchReqHeader.COUNT;
          END;

        CurrPage.UPDATE(TRUE);

        //ChequeImpaye
    end;

    var
        ChequeEnCoffre : Decimal;
        ChequeGarantie : Decimal;
        ChequeEnTransit : Decimal;
        ChequeEncaisseEnBanqe : Decimal;
        ChequeImpaye : Decimal;
        ChequeDouteux : Decimal;
        AnticedentChequeImp : Decimal;
        EffetEnCoffre : Decimal;
        EffetGanarntie : Decimal;
        EffetEnTransit : Decimal;
        EffetEncaisseEnBanqe : Decimal;
        EffetEscompteEnBanqe : Decimal;
        EffetImpaye : Decimal;
        EffetDouteux : Decimal;
        "AnticédentEffetImp" : Integer;
        EspeceEnCoffre : Decimal;
        EspeceVerseEnBanque : Decimal;
        CustLedgerEntry : Record "21";
        DateFilter : Date;
        RecUserSetup : Record "91";
        ProfilReglement : Record "70031";
        PaymentLine : Record "10866";
        Compteur : Integer;
        PaymentLinesList : Page "50110";
        UserSetup : Record "91";
        AdminAllCentre : Boolean;
        FilteBrParCentreG : Boolean;
        FilteBrParCoffre : Boolean;
        FNRPR : Decimal;
        FNRVN : Decimal;
        DA : Integer;
        PurchReqHeader : Record "50005";
        NomCoffre : Text;
        Coffre : Record "60021";
        CG1 : Integer;
        CG : Label 'Marsa,Sfax,Charguia,Kamel. ATT,Sousse  S. A,Souuse AKouda';
        EncaisTPE : Decimal;
        AFFICHEDAESP : Boolean;
        AFFICHEDAECHQ : Boolean;
        EspeceInscription : Decimal;
        EffetVerseNonNotifie : Decimal;
        ChqVerseNonNotifie : Decimal;

    local procedure DrillDownRespCenterCHRONO(FieldNo : Integer);
    begin
    end;

    local procedure DrillDownRespCenterSAV(FieldNo : Integer);
    begin
    end;

    local procedure DrillDownRespCenterPR(FieldNo : Integer);
    begin
    end;

    local procedure SetCellVisibility();
    begin
    end;
}

