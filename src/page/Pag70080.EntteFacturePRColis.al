page 70080 "Entête Facture P.R / Colis"
{
    DeleteAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table70060;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No.";"No.")
                {
                }
                field("No. Remorque";"No. Remorque")
                {
                }
                field("No. Arrivage PR";"No. Arrivage PR")
                {
                    Visible = false;
                }
                field(Désignation;Désignation)
                {
                }
                field("No L.C";"No L.C")
                {
                }
                field("Date Document";"Date Document")
                {
                    Caption = 'Date Document';
                }
                field("Date Arrivage Magasin";"Date Arrivage Magasin")
                {
                }
                field("Date Déclaration";"Date Déclaration")
                {
                }
                field(Type;Type)
                {
                }
                field("Nbr. Facture";"Nbr. Facture")
                {
                    Editable = false;
                }
                field("Total Nbr. Colis";"Total Nbr. Colis")
                {
                    Editable = false;
                }
                field("Montant Total Devis";"Montant Total Devis")
                {
                    Editable = false;
                }
                field("Total Volume";"Total Volume")
                {
                    Editable = false;
                }
                field("Total Poid Brut";"Total Poid Brut")
                {
                    Editable = false;
                }
                field("Total Poid Net";"Total Poid Net")
                {
                    Editable = false;
                }
                field("Cous du jour";"Cous du jour")
                {
                }
                field("Montant Total TND";"Montant Total TND")
                {
                    Editable = false;
                }
                field("Nbre. Colis Scanner";"Nbre. Colis Scanner")
                {
                    Editable = false;
                }
                field("Nbre. Colis Scanner Invalid";"Nbre. Colis Scanner Invalid")
                {
                    Editable = false;
                }
                field(Statut;Statut)
                {
                    Editable = false;
                }
                field("Totalement Colturer";"Totalement Colturer")
                {
                }
            }
            part(;70081)
            {
                SubPageLink = No. Document=FIELD(No.);
                UpdatePropagation = Both;
            }
            part(;70082)
            {
                SubPageLink = No. Dossier Arrivage=FIELD(No.);
            }
            part(;70086)
            {
                SubPageLink = No.=FIELD(No.);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Fonction)
            {
                action("Créer Recep. Maga. Arrivage")
                {
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = true;

                    trigger OnAction();
                    var
                        RecWarehouseReceiptHeader : Record "7316";
                        PageWarehouseReceipts : Page "7332";
                        "LRecEntêteFacturePRColis" : Record "70060";
                        RepCreateRecepWareArrivage : Report "70005";
                    begin
                        TESTFIELD(Statut , Statut::lancer);
                        /*
                        RecWarehouseReceiptHeader.SETRANGE("No. Arrivage PR","No. Arrivage");
                        IF RecWarehouseReceiptHeader.FINDFIRST THEN
                          BEGIN
                            MESSAGE('un ou plusieur documents sont crée');
                            PageWarehouseReceipts.SETTABLEVIEW(RecWarehouseReceiptHeader);
                            PageWarehouseReceipts.SETRECORD(RecWarehouseReceiptHeader);
                            PageWarehouseReceipts.RUN;
                          END ELSE
                            BEGIN
                              */
                                //RecEnteteArrivagePR := Rec;
                                CLEAR(RepCreateRecepWareArrivage);
                                CurrPage.SETSELECTIONFILTER(LRecEntêteFacturePRColis);
                                //RecArrivagePR.SETRANGE("No. Arrivage",RecEnteteArrivagePR."No. Arrivage");
                                RepCreateRecepWareArrivage.SETTABLEVIEW(LRecEntêteFacturePRColis);
                                RepCreateRecepWareArrivage.RUNMODAL()
                            //END;

                    end;
                }
                action("Valider Reception Magasin")
                {
                    Image = PostedReceipt;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = true;

                    trigger OnAction();
                    var
                        RecPostedWhseReceiptHeader : Record "7318";
                        PagPostedWhseReceiptList : Page "7333";
                        "LRecEntêteFacturePRColis" : Record "70060";
                        RepValiderReceptionMagasin : Report "70006";
                    begin
                        TESTFIELD(Statut , Statut::lancer);
                        /*
                        RecPostedWhseReceiptHeader.RESET;
                        RecPostedWhseReceiptHeader.SETRANGE("No. Arrivage PR","No. Arrivage");
                        IF RecPostedWhseReceiptHeader.FINDFIRST THEN
                            BEGIN
                            MESSAGE('un ou plusieur documents sont crée!');
                            PagPostedWhseReceiptList.SETTABLEVIEW(RecPostedWhseReceiptHeader);
                            PagPostedWhseReceiptList.SETRECORD(RecPostedWhseReceiptHeader);
                            PagPostedWhseReceiptList.RUN;
                          END ELSE
                            BEGIN
                            */
                              LRecEntêteFacturePRColis := Rec;
                              CLEAR(RepValiderReceptionMagasin);
                              CurrPage.SETSELECTIONFILTER(LRecEntêteFacturePRColis);
                              //RecArrivagePR.SETRANGE(RecArrivagePR."No. Arrivage",RecEnteteArrivagePR."No. Arrivage");
                        
                              RepValiderReceptionMagasin.SETTABLEVIEW(LRecEntêteFacturePRColis);
                              RepValiderReceptionMagasin.RUNMODAL()
                            //END;

                    end;
                }
                action("Consulter Ecart")
                {
                    Image = ViewCheck;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 70057;
                    RunPageLink = No. Dossier Import=FIELD(No.);
                    RunPageView = WHERE(Qty Ecrat=FILTER(<>0),
                                        Traiter=FILTER(No));
                }
                action("Calculer Ecart")
                {
                    Image = Calculate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        RecEcartArrivagePR : Record "70023";
                    begin
                        TESTFIELD(Statut , Statut::lancer);
                        LRecEntêteFacturePRColis := Rec;
                        CLEAR(RepTraiterEcartArrivage);
                        CurrPage.SETSELECTIONFILTER(LRecEntêteFacturePRColis);
                        RepTraiterEcartArrivage.SETTABLEVIEW(LRecEntêteFacturePRColis);
                        RepTraiterEcartArrivage.RUNMODAL();
                        RecEcartArrivagePR.SETRANGE("No. Dossier Import","No.");
                        
                        IF RecEcartArrivagePR.FINDFIRST THEN
                          BEGIN
                            PagEcartArrivagePR.SETTABLEVIEW(RecEcartArrivagePR);
                            PagEcartArrivagePR.SETRECORD(RecEcartArrivagePR);
                            PagEcartArrivagePR.RUN;
                          END;
                        
                        /*
                        DecNbreColisnontraiter := 0;
                        RecCheckArrivagePR.SETRANGE("No. Arrivage","No. Arrivage");
                        IF RecCheckArrivagePR.FINDSET THEN
                          REPEAT
                            RecCABMouvement.RESET;
                            RecCABMouvement.SETRANGE("No. Colis",RecCheckArrivagePR."Numero Colis");
                            IF NOT RecCABMouvement.FINDFIRST THEN
                              DecNbreColisnontraiter := DecNbreColisnontraiter + 1;
                          UNTIL RecCheckArrivagePR.NEXT = 0;
                        IF DecNbreColisnontraiter <> 0 THEN
                          BEGIN
                            IF NOT CONFIRM(Text001,FALSE) THEN
                              EXIT
                            ELSE
                              BEGIN
                                RecEnteteArrivagePR := Rec;
                                CLEAR(RepTraiterEcartArrivage);
                                CurrPage.SETSELECTIONFILTER(RecEnteteArrivagePR);
                                RecArrivagePR.SETRANGE("No. Arrivage",RecEnteteArrivagePR."No. Arrivage");
                                RepTraiterEcartArrivage.SETTABLEVIEW(RecArrivagePR);
                                RepTraiterEcartArrivage.RUNMODAL();
                                RecEcartArrivagePR.SETRANGE("No. Arrivage PR","No. Arrivage");
                                IF RecEcartArrivagePR.FINDFIRST THEN
                                  BEGIN
                                    PagEcartArrivagePR.SETTABLEVIEW(RecEcartArrivagePR);
                                    PagEcartArrivagePR.SETRECORD(RecEcartArrivagePR);
                                    PagEcartArrivagePR.RUN;
                                  END;
                              END;
                            END ELSE
                              BEGIN
                                RecEnteteArrivagePR := Rec;
                                CLEAR(RepTraiterEcartArrivage);
                                CurrPage.SETSELECTIONFILTER(RecEnteteArrivagePR);
                                RecArrivagePR.SETRANGE("No. Arrivage",RecEnteteArrivagePR."No. Arrivage");
                                RepTraiterEcartArrivage.SETTABLEVIEW(RecArrivagePR);
                                RepTraiterEcartArrivage.RUNMODAL();
                                RecEcartArrivagePR.SETRANGE("No. Arrivage PR","No. Arrivage");
                                IF RecEcartArrivagePR.FINDFIRST THEN
                                  BEGIN
                                    PagEcartArrivagePR.SETTABLEVIEW(RecEcartArrivagePR);
                                    PagEcartArrivagePR.SETRECORD(RecEcartArrivagePR);
                                    PagEcartArrivagePR.RUN;
                                  END;
                              END;
                        */

                    end;
                }
                action("Vérifier Ecart")
                {
                    Image = Check;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 70056;
                    RunPageLink = No. Dossier Import=FIELD(No.);
                }
                action("Mettre a jour lignes Factures")
                {
                    Image = UpdateXML;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    begin
                        TESTFIELD(Statut , Statut::lancer);
                        MgtAures.UpdateLineFactFin(Rec);
                    end;
                }
                action("Calculer Assurance")
                {
                    Image = Calculate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        TESTFIELD(Statut , Statut::lancer);
                        MgtAures.CalcAssurancePR(Rec);
                    end;
                }
                action(Facturer)
                {
                    Image = Invoice;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        LRecArrivagePR : Record "70017";
                        LRecPurchaseHeader : Record "38";
                        LRecPurchaseLine : Record "39";
                        LRecPurchasesPayablesSetup : Record "312";
                        LIntLineNo : Integer;
                        LRecPurchRcptLine : Record "121";
                        LCduPurchGetReceipt : Codeunit "74";
                        LRecLigneFacturesPRClois : Record "70061";
                        ProgressWindow : Dialog;
                    begin
                        TESTFIELD(Statut , Statut::lancer);
                        
                        LRecLigneFacturesPRClois.RESET;
                        LRecLigneFacturesPRClois.SETRANGE("No. Document","No.");
                        IF LRecLigneFacturesPRClois.FINDSET THEN
                          REPEAT
                             LRecPurchaseHeader.RESET;
                             LRecPurchaseHeader.SETRANGE("Vendor Invoice No.",LRecLigneFacturesPRClois."No Facture");
                             LRecPurchaseHeader.SETRANGE("No dossier","No.");
                             IF LRecPurchaseHeader.FINDFIRST THEN
                               ERROR('dossier %1 est facturé',"No.");
                          UNTIL LRecLigneFacturesPRClois.NEXT = 0;
                        
                        ProgressWindow.OPEN('Creation Facture Achat numéro #1#######');
                        LRecPurchasesPayablesSetup.GET;
                        LRecLigneFacturesPRClois.SETRANGE("No. Document","No.");
                        IF LRecLigneFacturesPRClois.FINDSET THEN
                          REPEAT
                            LRecPurchaseHeader.INIT;
                            LRecPurchaseHeader."No." := '';
                            LRecPurchaseHeader.VALIDATE("Document Type",LRecPurchaseHeader."Document Type"::Invoice);
                            LRecPurchaseHeader."Order Type" := LRecPurchaseHeader."Order Type"::PR;
                            LRecPurchaseHeader.VALIDATE("Buy-from Vendor No.",LRecPurchasesPayablesSetup."Default PR Vendor");
                            LRecPurchaseHeader.INSERT(TRUE);
                            ProgressWindow.UPDATE(1,LRecPurchaseHeader."No.");
                            LRecPurchaseHeader.VALIDATE("Vendor Invoice No.",LRecLigneFacturesPRClois."No Facture");
                            LRecPurchaseHeader."No dossier":= "No.";
                            LRecPurchaseHeader."Date Facture Fournisseur":= LRecLigneFacturesPRClois."Date Facture";
                            LRecPurchaseHeader.VALIDATE("Posting Date","Date de Douanement");
                            LRecPurchaseHeader.VALIDATE("Currency Factor",1/"Cous du jour");
                            LRecPurchaseHeader.VALIDATE("Facturer avec Dossier Imp",TRUE);
                            LRecPurchaseHeader.MODIFY(TRUE);
                            LRecPurchRcptLine.RESET;
                            LRecPurchRcptLine.SETRANGE("Vendor Invoice No.",LRecLigneFacturesPRClois."No Facture");
                            IF LRecPurchRcptLine.FINDSET THEN
                            BEGIN
                            LCduPurchGetReceipt.SetPurchHeader(LRecPurchaseHeader);
                            LCduPurchGetReceipt.CreateInvLines(LRecPurchRcptLine);
                            END;
                         UNTIL LRecLigneFacturesPRClois.NEXT =0;
                         ProgressWindow.CLOSE;
                        
                        
                        /*
                        LRecLigneFacturesPRClois.SETRANGE(LRecLigneFacturesPRClois."No. Document","No.");
                        IF LRecLigneFacturesPRClois.FINDSET THEN
                          REPEAT
                            LRecArrivagePR.SETRANGE("No. Facture",LRecLigneFacturesPRClois."No Facture");
                            IF LRecArrivagePR.FINDSET THEN
                              REPEAT
                                LRecPurchaseLine.VALIDATE("Document Type",LRecPurchaseLine."Document Type"::Invoice);
                                LRecPurchaseLine.VALIDATE("Document No.",LRecPurchaseHeader."No.");
                                LRecPurchaseLine.VALIDATE("Line No.",LIntLineNo);
                                LRecPurchaseLine.VALIDATE(Type,LRecPurchaseLine.Type::Item);
                                LRecPurchaseLine.VALIDATE("No.",LRecArrivagePR."No. Article");
                                LRecPurchaseLine.VALIDATE(Quantity,LRecArrivagePR."Qte Servie");
                                LRecPurchaseLine.VALIDATE("Direct Unit Cost",LRecArrivagePR."Prix unitaire LCY");
                                LRecPurchaseLine.INSERT(TRUE);
                                LIntLineNo+=10000;
                              UNTIL LRecArrivagePR.NEXT = 0;
                          UNTIL LRecLigneFacturesPRClois.NEXT = 0;
                          */
                          MESSAGE('Des factures achat sont crée' );

                    end;
                }
                action(Lancer)
                {
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        Statut := Statut::lancer;
                    end;
                }
                action(Reouvrir)
                {
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        Statut := Statut::"En cour"
                    end;
                }
                action("Clôturer")
                {
                    Caption = 'Clôturer';
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        IF CONFIRM('ëtes vous sure de vouloir clôturer ce dossier',TRUE,FALSE) THEN
                        Statut := Statut::Clôturer
                    end;
                }
            }
        }
        area(navigation)
        {
            group(List)
            {
                action("Liste Factures")
                {
                    Image = ListPage;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page 9308;
                    RunPageLink = No dossier=FIELD(No.);
                }
                action("Liste Receptions Magasin")
                {
                    Image = ListPage;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page 7332;
                    RunPageLink = No. Dossier Imprort=FIELD(No.);
                    Visible = true;
                }
                action("Liste Receptions Enregistrées")
                {
                    Image = ListPage;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page 7333;
                    RunPageLink = No. Dossier Imprort=FIELD(No.);
                    Visible = true;
                }
                action("List Article Ignorer")
                {
                    Image = ListPage;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page 60310;
                    RunPageLink = No. Dossier Import=FIELD(No.);
                }
                action("Liste Ordres de transfert")
                {
                    Image = ListPage;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page 5742;
                    RunPageLink = No. Dossier Import=FIELD(No.);
                }
                action("List des Articles Scannée")
                {
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page 70055;
                    RunPageLink = No. Dossier Import=FIELD(No.);
                }
                action("List Order de transfer Magasin Manquant Ouvert")
                {
                    CaptionML = ENU='List OT Magasin Manquant Ouvert',
                                FRA='List OT Magasin Manquant Ouvert';
                    Image = ListPage;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page 5742;
                    RunPageLink = Created from Arrivage PR=FILTER(Yes),
                                  No. Dossier Import=FIELD(No.);
                }
                action("List Commande Achat Remise 100% Ouvert")
                {
                    CaptionML = ENU='List Cmd Achat Remise 100% Ouvert',
                                FRA='List Cmd Achat Remise 100% Ouvert';
                    Image = ListPage;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page 9307;
                    RunPageLink = Created from Arrivage PR=FILTER(Yes),
                                  Order Type=CONST(PR),
                                  No. Arrivage PR=FIELD(No.);
                }
            }
            group(Archive)
            {
                action("Cmd Achat Enreg. Remise 100%")
                {
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page 146;
                    RunPageLink = No. Arrivage PR=FIELD(No.);
                }
                action("Exp Transfert Magasin Manquant")
                {
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page 5752;
                    RunPageLink = No. Arrivage PR=FIELD(No.);
                }
                action("Rcp Transfert Magasin Manquant")
                {
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page 5753;
                    RunPageLink = No. Arrivage PR=FIELD(No.);
                }
                action("Liste Facture Achat Enreg.")
                {
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page 146;
                    RunPageLink = N° dossier=FIELD(No.);
                }
            }
        }
        area(reporting)
        {
            group()
            {
                action("Imprimer récup. arrivage")
                {
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        CLEAR(RecupFacturepararrivage);
                        EnteteFacturePRColis.GET("No.");
                        CurrPage.SETSELECTIONFILTER(EnteteFacturePRColis);
                        //REPORT.RUN(REPORT::"Récup Facture par arrivage",TRUE,TRUE,EnteteFacturePRColis);
                        RecupFacturepararrivage.SETTABLEVIEW(EnteteFacturePRColis);
                        RecupFacturepararrivage.RUNMODAL();
                    end;
                }
                action("Imprimer écart articles")
                {
                    Image = print;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction();
                    begin

                        RecEnteteArrivagePR1.RESET;
                        RecEnteteArrivagePR1.SETFILTER("No.","No.");
                        //RecEnteteArrivagePR1.FINDFIRST;
                        //REPORT.RUN(70038,TRUE,TRUE,RecEnteteArrivagePR1);
                        CLEAR(EcartarticlesparArrivage);
                        EcartarticlesparArrivage.SETTABLEVIEW(RecEnteteArrivagePR1);
                        EcartarticlesparArrivage.RUN;
                    end;
                }
                action("Imprimer liste de colisage par dossier")
                {
                    Caption = 'Imprimer liste de colisage par dossier';
                    Image = print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        PostedWhseReceiptHeader : Record "7318";
                        WhsePostedReceiptLVIDI : Report "60290";
                    begin
                        PostedWhseReceiptHeader.RESET;
                        PostedWhseReceiptHeader.SETRANGE("No. Dossier Imprort","No.");
                        IF PostedWhseReceiptHeader.FINDSET THEN BEGIN
                          WhsePostedReceiptLVIDI.SETTABLEVIEW(PostedWhseReceiptHeader);
                          WhsePostedReceiptLVIDI.RUN;
                        END;
                    end;
                }
                action("Imprimer Pointage Colis")
                {
                    Image = print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //AK220419
                        RecRecEntêteFacturePRColis.RESET;
                        RecRecEntêteFacturePRColis.SETRANGE("No.","No.");
                        IF RecRecEntêteFacturePRColis.FINDSET THEN BEGIN
                        Pointagecolier.SETTABLEVIEW(RecRecEntêteFacturePRColis);
                        Pointagecolier.RUN;
                        END;
                        //END_AK
                    end;
                }
            }
        }
    }

    var
        MgtAures : Codeunit "70003";
        EnteteFacturePRColis : Record "70060";
        RecupFacturepararrivage : Report "60156";
        "LRecEntêteFacturePRColis" : Record "70060";
        RepTraiterEcartArrivage : Report "70010";
        PagEcartArrivagePR : Page "70057";
        RecEnteteArrivagePR1 : Record "70060";
        EcartarticlesparArrivage : Report "70038";
        Pointagecolier : Report "50104";
        "RecRecEntêteFacturePRColis" : Record "70060";

    procedure FctUpdatePage();
    begin
        CurrPage.UPDATE(TRUE);
    end;
}

