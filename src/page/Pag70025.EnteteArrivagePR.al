page 70025 "Entete Arrivage PR"
{
    DeleteAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table70020;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No. Arrivage";"No. Arrivage")
                {
                }
                field(Description;Description)
                {
                }
                field("Créer par";"Créer par")
                {
                }
                field("Date Creation";"Date Creation")
                {
                }
                field("Modifier Par";"Modifier Par")
                {
                }
                field("Date Modification";"Date Modification")
                {
                }
                field("Code Magasin de réception";"Code Magasin de réception")
                {
                }
                field(Statut;Statut)
                {
                }
                field("Total Poid Brut";"Total Poid Brut")
                {
                    Caption = 'Total Poid Brut (Kg)';
                    Editable = false;
                }
                field("Total Poid Net";"Total Poid Net")
                {
                    Caption = 'Total Poid Net (Kg)';
                    Editable = false;
                }
                field("Total Volume";"Total Volume")
                {
                    Caption = 'Total Volume (m3)';
                    Editable = false;
                }
                field("Montant Total";"Montant Total")
                {
                    Editable = false;
                }
                field(Vérifier;Vérifier)
                {
                    CaptionML = ENU='Vérifié',
                                FRA='Vérifié';
                }
                field("Shipment date";"Shipment date")
                {
                }
                field(GES;GES)
                {
                    Visible = false;
                }
                field(GEIS;GEIS)
                {
                    Visible = false;
                }
                field("Estimated time of arrival";"Estimated time of arrival")
                {
                }
            }
            part(;70130)
            {
                SubPageLink = No. Arrivage=FIELD(No. Arrivage);
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Import Arrivage")
            {
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    CustTxtFile : File;
                    XmlStream : InStream;
                    XMLImportListArrivage : XMLport "70004";
                    ImportListcolisFactTYT : XMLport "70071";
                begin
                    /*
                    RecArrivagePR.RESET;
                    RecArrivagePR.SETRANGE("No. Arrivage","No. Arrivage");
                    IF RecArrivagePR.FINDSET THEN
                      REPEAT
                        RecArrivagePR.DELETE;
                      UNTIL RecArrivagePR.NEXT = 0;
                    
                    RecDossierImportFactFour.SETRANGE("No. Arrivage PR","No. Arrivage");
                    IF RecDossierImportFactFour.FINDSET THEN
                      REPEAT
                        RecDossierImportColis.SETRANGE("No. Arrivage PR",RecDossierImportFactFour."No. Arrivage PR");
                        IF RecDossierImportColis.FINDSET THEN
                          REPEAT
                            RecDossierImportColis.DELETE;
                          UNTIL RecDossierImportColis.NEXT = 0;
                          RecDossierImportFactFour.DELETE;
                      UNTIL RecDossierImportFactFour.NEXT =0;
                    COMMIT;
                    
                    XMLImportListArrivage.FctSetArrivageNo("No. Arrivage");
                    XMLImportListArrivage.RUN;
                    */
                    ImportListcolisFactTYT.FctSetArrivageNo("No. Arrivage");
                    ImportListcolisFactTYT.RUN;

                end;
            }
            action("Vérifier Arrivage")
            {
                Image = Check;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    RecEnteteArrivagePR := Rec;
                    CLEAR(RepVerifierArrivage);
                    CurrPage.SETSELECTIONFILTER(RecEnteteArrivagePR);
                    RecArrivagePR.SETRANGE(RecArrivagePR."No. Arrivage",RecEnteteArrivagePR."No. Arrivage");

                    RepVerifierArrivage.SETTABLEVIEW(RecArrivagePR);
                    RepVerifierArrivage.RUNMODAL()
                end;
            }
            action("Create Recep. Maga. Arrivage")
            {
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                var
                    RecWarehouseReceiptHeader : Record "7316";
                    PageWarehouseReceipts : Page "7332";
                begin
                    RecWarehouseReceiptHeader.SETRANGE("No. Arrivage PR","No. Arrivage");
                    IF RecWarehouseReceiptHeader.FINDFIRST THEN
                      BEGIN
                        MESSAGE('un ou plusieur documents sont crée');
                        PageWarehouseReceipts.SETTABLEVIEW(RecWarehouseReceiptHeader);
                        PageWarehouseReceipts.SETRECORD(RecWarehouseReceiptHeader);
                        PageWarehouseReceipts.RUN;
                      END ELSE
                        BEGIN
                            RecEnteteArrivagePR := Rec;
                            CLEAR(RepCreateRecepWareArrivage);
                            CurrPage.SETSELECTIONFILTER(RecEnteteArrivagePR);
                            RecArrivagePR.SETRANGE("No. Arrivage",RecEnteteArrivagePR."No. Arrivage");
                            RepCreateRecepWareArrivage.SETTABLEVIEW(RecArrivagePR);
                            RepCreateRecepWareArrivage.RUNMODAL()
                        END;
                end;
            }
            action("Valider Reception Magasin")
            {
                Image = PostedReceipt;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                var
                    RecPostedWhseReceiptHeader : Record "7318";
                    PagPostedWhseReceiptList : Page "7333";
                begin
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
                          RecEnteteArrivagePR := Rec;
                          CLEAR(RepValiderReceptionMagasin);
                          CurrPage.SETSELECTIONFILTER(RecEnteteArrivagePR);
                          RecArrivagePR.SETRANGE(RecArrivagePR."No. Arrivage",RecEnteteArrivagePR."No. Arrivage");
                    
                          RepValiderReceptionMagasin.SETTABLEVIEW(RecArrivagePR);
                          RepValiderReceptionMagasin.RUNMODAL()
                        //END;

                end;
            }
            action("List Erreur")
            {
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 70024;
                RunPageLink = No. Arrivage=FIELD(No. Arrivage);
            }
            action("List Reception Magazin")
            {
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 7332;
                RunPageLink = No. Arrivage PR=FIELD(No. Arrivage);
                Visible = false;
            }
            action("List Reception Enregister")
            {
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 7333;
                RunPageLink = No. Arrivage PR=FIELD(No. Arrivage);
                Visible = false;
            }
            action("List Order de Transfert")
            {
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 5742;
                RunPageLink = No. Arrivage PR=FIELD(No. Arrivage);
                Visible = false;
            }
            action("Cloturer Dossier Arrivage PR")
            {
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                var
                    RecCheckArrivagePR : Record "70017";
                    RecCABMouvement : Record "70045";
                    DecNbreColisnontraiter : Decimal;
                begin
                    RecCheckArrivagePR.SETRANGE("No. Arrivage","No. Arrivage");
                    IF RecCheckArrivagePR.FINDSET THEN
                      REPEAT
                        RecCABMouvement.RESET;
                        RecCABMouvement.SETRANGE("No. Colis",RecCheckArrivagePR."Numero Colis");
                        IF NOT RecCABMouvement.FINDFIRST THEN
                          DecNbreColisnontraiter := DecNbreColisnontraiter + 1;
                      UNTIL RecCheckArrivagePR.NEXT = 0;
                    IF DecNbreColisnontraiter <> 0 THEN
                         ERROR(Text002)
                      ELSE
                        Statut:= Statut::"En Cours";
                end;
            }
            action("Vérifier Ecart")
            {
                Image = Check;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 70056;
                RunPageLink = No. Arrivage PR=FIELD(No. Arrivage);
                Visible = false;
            }
            action("Calcule Ecrat")
            {
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                var
                    RecEcartArrivagePR : Record "70023";
                begin
                    //TESTFIELD(Statut,Statut::Cloturer);
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
                end;
            }
            action("Récap Factures / Colis")
            {
                Image = Statistics;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 70132;
                RunPageLink = No. Arrivage PR=FIELD(No. Arrivage);
            }
            action(Lancer)
            {
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    TESTFIELD(Vérifier,TRUE);
                    Statut := Statut::Lancer
                end;
            }
            action(Reouvrir)
            {
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Statut := Statut::"En Cours"
                end;
            }
        }
    }

    var
        path : Text;
        RecEnteteArrivagePR : Record "70020";
        RepVerifierArrivage : Report "70007";
        RecArrivagePR : Record "70017";
        RepCreateRecepWareArrivage : Report "70005";
        RepValiderReceptionMagasin : Report "70006";
        RepTraiterEcartArrivage : Report "70010";
        PagEcartArrivagePR : Page "70057";
        RecCheckArrivagePR : Record "70017";
        RecCABMouvement : Record "70045";
        RecPostedWhseReceiptLine : Record "7319";
        DecNbreColisnontraiter : Decimal;
        Text001 : Label 'Un où des colis non traités vous voulez continuer';
        Text002 : Label 'Un où des colis non traités !';
        RecEnteteArrivagePR1 : Record "70020";
        EcartarticlesparArrivage : Report "70038";
        RecDossierImportFactFour : Record "70025";
        RecDossierImportColis : Record "70072";
}

