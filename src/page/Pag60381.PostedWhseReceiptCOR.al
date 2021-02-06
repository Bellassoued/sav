page 60381 "Posted Whse. Receipt COR"
{
    // version NAVW17.00

    CaptionML = ENU='Posted Whse. Receipt',
                FRA='Réception entrep. enreg.';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    Permissions = TableData 7318=rm;
    RefreshOnActivate = true;
    SourceTable = Table7318;

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                field("No.";"No.")
                {
                    Editable = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                }
                field("No. Arrivage PR";"No. Arrivage PR")
                {
                    Editable = true;
                }
                field("No. Dossier Imprort";"No. Dossier Imprort")
                {
                    Editable = true;
                }
                field("Whse. Receipt No.";"Whse. Receipt No.")
                {
                    Editable = false;
                }
                field("No Facture Fournisseur";"No Facture Fournisseur")
                {
                    Editable = true;
                }
                field("Date Facture Fournisseur";"Date Facture Fournisseur")
                {
                    Editable = true;
                }
                field("No. Colis";"No. Colis")
                {
                    Editable = true;
                }
                field("Total Poid Brut";"Total Poid Brut")
                {
                }
                field("Total Poid Net";"Total Poid Net")
                {
                }
                field("Total Volume";"Total Volume")
                {
                }
                field("Total Montant";"Total Montant")
                {
                }
                field(Cloturer;Cloturer)
                {
                    Editable = BolExpExit;
                }
                field("Totalement Ranger";"Totalement Ranger")
                {
                    Editable = BolExpExit;
                }
                field(Urgent;Urgent)
                {
                }
                field("Réception Magasin";"Réception Magasin")
                {
                }
                field("Reason Code";"Reason Code")
                {
                    Editable = false;
                }
                field("Order de transfer Validé";"Order de transfer Validé")
                {
                    Editable = false;
                }
                field("Order de transfer Réceptionnée";"Order de transfer Réceptionnée")
                {
                    Editable = false;
                }
                group(Filtres)
                {
                    Caption = 'Filtre pour extraction lignes achat';
                    Visible = GBoolLineFiltersVisible;
                    field("Date embarquement";"Date embarquement")
                    {
                    }
                    field("Lettre de credit";"Lettre de credit")
                    {
                    }
                    field("No Proformat";"No Proformat")
                    {
                    }
                    field("Nombre de véhicule";"Nombre de véhicule")
                    {
                    }
                    field("Montant Total";"Montant Total")
                    {
                    }
                }
                field("Zone Code";"Zone Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Bin Code";"Bin Code")
                {
                    Editable = false;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Vendor Shipment No.";"Vendor Shipment No.")
                {
                    Editable = false;
                }
                group(AI)
                {
                    Visible = GBoolLineFiltersVisible;
                    field("Date AI";"Date AI")
                    {
                    }
                    field("Nbre VIN avec Date AI";"Nbre VIN avec Date AI")
                    {
                        Editable = false;
                    }
                    field("Nbre VIN total";"Nombre de véhicule")
                    {
                    }
                    field("Nbre AI";"Nbre AI")
                    {

                        trigger OnValidate();
                        begin
                            //SM 310817
                            GRecUserSetup.GET(USERID);
                            IF NOT GRecUserSetup.Admin_Vente_VN THEN
                              ERROR('vous n avez pas le droit ');
                            //END SM
                        end;
                    }
                }
            }
            part(PostedWhseRcptLines;7331)
            {
                SubPageLink = No.=FIELD(No.);
                SubPageView = SORTING(No.,Line No.);
            }
        }
        area(factboxes)
        {
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Receipt")
            {
                CaptionML = ENU='&Receipt',
                            FRA='&Réception';
                Image = Receipt;
                action(List)
                {
                    CaptionML = ENU='List',
                                FRA='Lister';
                    Image = OpportunitiesList;
                    ShortCutKey = 'Shift+Ctrl+L';

                    trigger OnAction();
                    begin
                        LookupPostedWhseRcptHeader(Rec);
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5776;
                    RunPageLink = Table Name=CONST(Posted Whse. Receipt),
                                  Type=CONST(" "),
                                  No.=FIELD(No.);
                }
                action("Put-away Lines")
                {
                    CaptionML = ENU='Put-away Lines',
                                FRA='Lignes rangement';
                    Image = PutawayLines;
                    RunObject = Page 5785;
                    RunPageLink = Whse. Document Type=CONST(Receipt),
                                  Whse. Document No.=FIELD(No.);
                    RunPageView = SORTING(Whse. Document No.,Whse. Document Type,Activity Type)
                                  WHERE(Activity Type=CONST(Put-away));
                }
                action("Registered Put-away Lines")
                {
                    CaptionML = ENU='Registered Put-away Lines',
                                FRA='Lignes rangement enreg.';
                    Image = RegisteredDocs;
                    RunObject = Page 7364;
                    RunPageLink = Whse. Document Type=CONST(Receipt),
                                  Whse. Document No.=FIELD(No.);
                    RunPageView = SORTING(Whse. Document Type,Whse. Document No.,Whse. Document Line No.)
                                  WHERE(Activity Type=CONST(Put-away));
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Create Put-away")
                {
                    CaptionML = ENU='Create Put-away',
                                FRA='Créer rangement';
                    Ellipsis = true;
                    Image = CreatePutAway;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        CurrPage.UPDATE(TRUE);
                        CurrPage.PostedWhseRcptLines.PAGE.PutAwayCreate;
                    end;
                }
                action("Insert CAB Mouvement")
                {
                    Image = Insert;
                    Promoted = true;

                    trigger OnAction();
                    var
                        LPagInsertCABMouvement : Page "70095";
                        LRecCABMouvement : Record "70045";
                        LRecCABMouvement2 : Record "70045";
                    begin
                        LRecCABMouvement.INIT;
                        LRecCABMouvement."Type Mouvement" := 'RCP';
                        LRecCABMouvement."N° Recept. Entrepôt":="No.";
                        LRecCABMouvement."No. Colis" := "No. Colis";
                        LRecCABMouvement."No. Facture" := "No Facture Fournisseur";
                        LRecCABMouvement."No. Dossier Import" := "No. Dossier Imprort";
                        LRecCABMouvement.INSERT(TRUE);
                        COMMIT;
                        LRecCABMouvement2.SETRANGE("Type Mouvement" , 'RCP');
                        LRecCABMouvement2.SETRANGE("N° Recept. Entrepôt","No.");
                        LRecCABMouvement2.SETRANGE("No. Colis","No. Colis");
                        LRecCABMouvement2.SETRANGE("No. Facture" ,"No Facture Fournisseur");
                        LRecCABMouvement2.SETRANGE("No. Dossier Import","No. Dossier Imprort");
                        IF LRecCABMouvement2.FINDSET THEN
                        BEGIN
                        CLEAR(LPagInsertCABMouvement);
                        LPagInsertCABMouvement.LOOKUPMODE := TRUE;
                        LPagInsertCABMouvement.SETTABLEVIEW(LRecCABMouvement2);
                        LPagInsertCABMouvement.SETRECORD(LRecCABMouvement2);
                        IF LPagInsertCABMouvement.RUNMODAL = ACTION::LookupOK THEN
                          LPagInsertCABMouvement.GETRECORD(LRecCABMouvement2);
                        END;
                    end;
                }
                action("Create & Valider Transfert")
                {
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        LRecTransferReceiptHeader : Record "5746";
                        LRecTransferShipmentHeader : Record "5744";
                        LRecPostedWhseReceiptHeader : Record "7318";
                        RecTransferHeaderExist : Record "5740";
                    begin
                        //SM 031117
                        RecTransferHeaderExist.RESET;
                        RecTransferHeaderExist.SETRANGE("Reception No","No.");
                        RecTransferHeaderExist.SETRANGE("No. Arrivage PR","No. Arrivage PR");
                        RecTransferHeaderExist.SETRANGE("No. Colis","No. Colis");
                        IF RecTransferHeaderExist.FINDFIRST THEN
                          ERROR(Text50003);
                        //END SM

                        LRecTransferReceiptHeader.RESET;
                        LRecTransferReceiptHeader.SETRANGE("Reception No","No.");
                        LRecTransferReceiptHeader.SETRANGE("No. Arrivage PR","No. Arrivage PR");
                        LRecTransferReceiptHeader.SETRANGE("No. Colis","No. Colis");
                        IF LRecTransferReceiptHeader.FINDFIRST THEN
                          ERROR(Text50001)
                          ELSE
                            BEGIN
                              LRecTransferShipmentHeader.RESET;
                              LRecTransferShipmentHeader.SETRANGE("Reception No","No.");
                              LRecTransferShipmentHeader.SETRANGE("No. Arrivage PR","No. Arrivage PR");
                              LRecTransferShipmentHeader.SETRANGE("No. Colis","No. Colis");
                              IF LRecTransferShipmentHeader.FINDFIRST THEN
                                ERROR(Text50002)
                            END;

                        RecArrivagePR.SETRANGE(RecArrivagePR."No. Arrivage","No. Arrivage PR");
                        IF RecArrivagePR.FINDFIRST THEN
                          BEGIN
                              StockFunctions.FctCreateTransfertOrderFromRecepEnterpEnreg("Whse. Receipt No.",RecArrivagePR);
                              RecTransferHeader.RESET;
                              RecTransferHeader.SETRANGE("Reception No","No.");
                              RecTransferHeader.SETRANGE("No. Arrivage PR","No. Arrivage PR");
                               IF RecTransferHeader.FINDFIRST THEN
                                BEGIN
                                 CduTransferOrderPostShipment.RUN(RecTransferHeader);
                                 LRecPostedWhseReceiptHeader.SETRANGE("No.","No.");
                                  IF LRecPostedWhseReceiptHeader.FINDFIRST THEN
                                     BEGIN
                                       LRecPostedWhseReceiptHeader."Order de transfer Validé":= TRUE;
                                       LRecPostedWhseReceiptHeader.MODIFY;
                                     END;
                                 COMMIT;
                                 CduTransferOrderPostReceipt.RUN(RecTransferHeader);
                                 LRecPostedWhseReceiptHeader.SETRANGE("No.","No.");
                                  IF LRecPostedWhseReceiptHeader.FINDFIRST THEN
                                     BEGIN
                                       LRecPostedWhseReceiptHeader."Order de transfer Réceptionnée" := TRUE;
                                       LRecPostedWhseReceiptHeader.MODIFY;
                                     END;
                                END;
                          END;
                    end;
                }
                action("Liste Transfert Expédiée")
                {
                    Image = ListPage;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 5752;
                    RunPageLink = No. Arrivage PR=FIELD(No. Arrivage PR),
                                  No. Colis=FIELD(No. Colis);
                }
                action("Liste Transfert Receptionnée")
                {
                    Image = ListPage;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 5753;
                    RunPageLink = No. Arrivage PR=FIELD(No. Arrivage PR),
                                  No. Colis=FIELD(No. Colis);
                }
                action("Liste Ordre de transfert")
                {
                    Image = List;
                    RunObject = Page 5742;
                    RunPageLink = No. Arrivage PR=FIELD(No. Arrivage PR),
                                  No. Colis=FIELD(No. Colis);
                }
            }
            action("Valider Réception AI")
            {

                trigger OnAction();
                var
                    NoSeriesMgt : Codeunit "396";
                    PurchasesPayablesSetup : Record "312";
                    NoReception : Code[20];
                    PostedWhseReceiptLine : Record "7319";
                    PostedWhseReceiptLine2 : Record "7319";
                begin
                    //SM 250817
                    IF GRecUserSetup.GET(USERID) AND (NOT GRecUserSetup.Admin_Vente_VN) THEN
                      ERROR('Vous n avez pas le droit');
                    PurchasesPayablesSetup.GET ;
                    NoReception := '' ;
                    PurchasesPayablesSetup.TESTFIELD("No. Réception AI");
                    NoSeriesMgt.InitSeries(PurchasesPayablesSetup."No. Réception AI",PurchasesPayablesSetup."No. Réception AI",0D,NoReception,PurchasesPayablesSetup."No. Réception AI");
                    IF NoReception <> '' THEN BEGIN
                      PostedWhseReceiptLine.RESET;
                      PostedWhseReceiptLine.SETRANGE("No.","No.");
                      PostedWhseReceiptLine.SETRANGE("Réception AI",TRUE);
                      PostedWhseReceiptLine.SETRANGE("No Réception AI",'');
                      IF PostedWhseReceiptLine.FINDSET THEN
                        REPEAT
                          PostedWhseReceiptLine2.GET(PostedWhseReceiptLine."No.",PostedWhseReceiptLine."Line No.");
                          PostedWhseReceiptLine2.VALIDATE("No Réception AI",NoReception);
                          PostedWhseReceiptLine2.MODIFY;
                        UNTIL PostedWhseReceiptLine.NEXT = 0;
                    END;

                    "Nbre AI" := 0;
                    "Date Saisie AI Entete" := 0DT;
                    //END SM
                end;
            }
            action("Imprimer Réception AI")
            {
                Visible = false;

                trigger OnAction();
                begin
                    //SM 250817

                    //END SM
                end;
            }
            action("&Print")
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;

                trigger OnAction();
                begin
                    WhseDocPrint.PrintPostedRcptHeader(Rec);
                end;
            }
            action("Décharge AI")
            {
                CaptionML = ENU='Décharge AI',
                            FRA='&Décharge AI';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    "DéchargeAI" : Report "60205";
                    PostedWhseReceiptHeader : Record "7318";
                begin
                    //SM 310817
                    PostedWhseReceiptHeader.RESET;
                    PostedWhseReceiptHeader.SETRANGE("No.","No.");
                    CLEAR(DéchargeAI);
                    DéchargeAI.SETTABLEVIEW(PostedWhseReceiptHeader);
                    DéchargeAI.RUNMODAL;

                    //END SM
                end;
            }
        }
        area(reporting)
        {
            action("Put-away List")
            {
                CaptionML = ENU='Put-away List',
                            FRA='Liste des rangements';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 5751;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        RecTransferShipmentHeader.RESET;
        RecTransferShipmentHeader.SETRANGE("No Facture Fournisseur","No Facture Fournisseur");
        RecTransferShipmentHeader.SETRANGE("No. Colis","No. Colis");
        IF RecTransferShipmentHeader.FINDFIRST THEN
          BolExpExit := FALSE;
    end;

    trigger OnFindRecord(Which : Text) : Boolean;
    begin
        EXIT(FindFirstAllowedRec(Which));
    end;

    trigger OnInit();
    begin
        BolExpExit := TRUE;
    end;

    trigger OnNextRecord(Steps : Integer) : Integer;
    begin
        EXIT(FindNextAllowedRec(Steps));
    end;

    trigger OnOpenPage();
    begin
        ErrorIfUserIsNotWhseEmployee;
        //KT
        GRecUserSetup.GET(USERID);
        GBoolLineFiltersVisible:=FALSE;
        IF GRecUserSetup."User Activity"=GRecUserSetup."User Activity"::VN THEN
          GBoolLineFiltersVisible:=TRUE;
        //END KT
        RecTransferShipmentHeader.RESET;
        RecTransferShipmentHeader.SETRANGE("No Facture Fournisseur","No Facture Fournisseur");
        RecTransferShipmentHeader.SETRANGE("No. Colis","No. Colis");
        IF RecTransferShipmentHeader.FINDFIRST THEN
          BolExpExit := FALSE;
    end;

    var
        WhseDocPrint : Codeunit "5776";
        StockFunctions : Codeunit "50000";
        RecArrivagePR : Record "70017";
        CduTransferOrderPostShipment : Codeunit "5704";
        CduTransferOrderPostReceipt : Codeunit "5705";
        RecTransferHeader : Record "5740";
        RecPostedWhseReceiptLine : Record "7319";
        Text50001 : Label '"Des Documents de transfer sont crées et validés "';
        GRecUserSetup : Record "91";
        GBoolLineFiltersVisible : Boolean;
        Text50002 : TextConst ENU='Ordre de transfert est expédié Merci de valider la réception manuellement',FRA='Ordre de transfert est expidié Merci de le valider la Reception manuallement';
        BolExpExit : Boolean;
        RecTransferShipmentHeader : Record "5744";
        Text50003 : Label 'Des Documents de transfer sont crées';
}

