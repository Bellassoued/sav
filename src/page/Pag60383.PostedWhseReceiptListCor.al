page 60383 "Posted Whse. Receipt ListCor"
{
    // version NAVW17.00

    CaptionML = ENU='Posted Whse. Receipt List',
                FRA='Liste réceptions entrepôt enreg.';
    CardPageID = "Posted Whse. Receipt";
    DataCaptionFields = "No.";
    DeleteAllowed = false;
    PageType = List;
    Permissions = TableData 7318=rm;
    SourceTable = Table7318;
    SourceTableView = SORTING(No.);

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Whse. Receipt No.";"Whse. Receipt No.")
                {
                }
                field("Document Status";"Document Status")
                {
                    Visible = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Visible = false;
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("No Facture Fournisseur";"No Facture Fournisseur")
                {
                }
                field("No. Colis";"No. Colis")
                {
                }
                field("No. Arrivage PR";"No. Arrivage PR")
                {
                }
                field("No. Dossier Imprort";"No. Dossier Imprort")
                {
                }
                field("Total Poid Brut";"Total Poid Brut")
                {
                }
                field(Urgent;Urgent)
                {
                }
                field(Cloturer;Cloturer)
                {
                }
                field("Order de transfer Validé";"Order de transfer Validé")
                {
                }
                field("Order de transfer Réceptionnée";"Order de transfer Réceptionnée")
                {
                }
                field("Totalement Ranger";"Totalement Ranger")
                {
                }
                field("Nombre de véhicule";"Nombre de véhicule")
                {
                }
                field("Lettre de credit";"Lettre de credit")
                {
                }
                field("No Proformat";"No Proformat")
                {
                }
                field("Date embarquement";"Date embarquement")
                {
                }
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
                                FRA='Liste';
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
                        CurrPage.SETSELECTIONFILTER(LRecPostedWhseReceiptHeader);
                        LRecPostedWhseReceiptHeader.MARKEDONLY(TRUE);
                        IF LRecPostedWhseReceiptHeader.FINDSET THEN
                        REPEAT
                          RecTransferHeaderExist.RESET;
                          RecTransferHeaderExist.SETRANGE("Reception No",LRecPostedWhseReceiptHeader."No.");
                          RecTransferHeaderExist.SETRANGE("No. Arrivage PR",LRecPostedWhseReceiptHeader."No. Arrivage PR");
                          RecTransferHeaderExist.SETRANGE("No. Colis",LRecPostedWhseReceiptHeader."No. Colis");
                          IF RecTransferHeaderExist.FINDFIRST THEN
                            ERROR(Text50003);
                          //ELSE BEGIN
                          LRecTransferReceiptHeader.RESET;
                          LRecTransferReceiptHeader.SETRANGE("Reception No",LRecPostedWhseReceiptHeader."No.");
                          LRecTransferReceiptHeader.SETRANGE("No. Arrivage PR",LRecPostedWhseReceiptHeader."No. Arrivage PR");
                          LRecTransferReceiptHeader.SETRANGE("No Facture Fournisseur",LRecPostedWhseReceiptHeader."No Facture Fournisseur");
                          LRecTransferReceiptHeader.SETRANGE("No. Colis",LRecPostedWhseReceiptHeader."No. Colis");
                          IF LRecTransferReceiptHeader.FINDFIRST THEN
                            ERROR(Text50001);
                         // END ELSE
                         //     BEGIN
                          LRecTransferShipmentHeader.RESET;
                          LRecTransferShipmentHeader.SETRANGE("Reception No",LRecPostedWhseReceiptHeader."No.");
                          LRecTransferShipmentHeader.SETRANGE("No. Arrivage PR",LRecPostedWhseReceiptHeader."No. Arrivage PR");
                          LRecTransferShipmentHeader.SETRANGE("No Facture Fournisseur",LRecPostedWhseReceiptHeader."No Facture Fournisseur");
                          LRecTransferShipmentHeader.SETRANGE("No. Colis",LRecPostedWhseReceiptHeader."No. Colis");
                          IF LRecTransferShipmentHeader.FINDFIRST THEN
                            ERROR(Text50002);
                         //     END;
                        UNTIL LRecPostedWhseReceiptHeader.NEXT =0;

                        LRecTransferReceiptHeader.CLEARMARKS;
                        CurrPage.SETSELECTIONFILTER(LRecPostedWhseReceiptHeader);
                        LRecPostedWhseReceiptHeader.MARKEDONLY(TRUE);
                        IF LRecPostedWhseReceiptHeader.FINDSET THEN
                        REPEAT
                        RecArrivagePR.SETRANGE(RecArrivagePR."No. Arrivage",LRecPostedWhseReceiptHeader."No. Arrivage PR");
                        IF RecArrivagePR.FINDFIRST THEN
                          BEGIN
                              CLEAR(StockFunctions);
                              StockFunctions.FctCreateTransfertOrderFromRecepEnterpEnreg(LRecPostedWhseReceiptHeader."Whse. Receipt No.",RecArrivagePR);
                              RecTransferHeader.RESET;
                              RecTransferHeader.SETRANGE("Reception No",LRecPostedWhseReceiptHeader."No.");
                              RecTransferHeader.SETRANGE("No. Arrivage PR",LRecPostedWhseReceiptHeader."No. Arrivage PR");
                              IF RecTransferHeader.FINDFIRST THEN
                                BEGIN
                                 CLEAR(CduTransferOrderPostReceipt);
                                 CLEAR(CduTransferOrderPostShipment);
                                 RecTransferHeader.SetHideValidationDialog(TRUE);
                                 CduTransferOrderPostShipment.RUN(RecTransferHeader);
                                 LRecPostedWhseReceiptHeader."Order de transfer Validé" := TRUE;
                                 LRecPostedWhseReceiptHeader.MODIFY;
                                 COMMIT;
                                 RecTransferHeader.SetHideValidationDialog(TRUE);
                                 CduTransferOrderPostReceipt.RUN(RecTransferHeader);
                                 LRecPostedWhseReceiptHeader."Order de transfer Réceptionnée" := TRUE;
                                 LRecPostedWhseReceiptHeader.MODIFY;
                                END;
                          END;
                        UNTIL LRecPostedWhseReceiptHeader.NEXT = 0;
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
                action("CAB Mouvement")
                {
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 60320;
                    RunPageLink = N° Recept. Entrepôt=FIELD(No.);
                }
            }
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction();
                    begin
                        PAGE.RUN(PAGE::"Posted Whse. Receipt",Rec);
                    end;
                }
            }
        }
    }

    trigger OnFindRecord(Which : Text) : Boolean;
    begin
        EXIT(FindFirstAllowedRec(Which));
    end;

    trigger OnNextRecord(Steps : Integer) : Integer;
    begin
        EXIT(FindNextAllowedRec(Steps));
    end;

    trigger OnOpenPage();
    begin
        ErrorIfUserIsNotWhseEmployee;
    end;

    var
        RecArrivagePR : Record "70017";
        StockFunctions : Codeunit "50000";
        RecTransferHeader : Record "5740";
        CduTransferOrderPostShipment : Codeunit "5704";
        CduTransferOrderPostReceipt : Codeunit "5705";
        Text50001 : TextConst ENU='<Des Documents de transfert sont crées et validés >',FRA='Des Documents de transfer sont crées et validés ';
        Text50002 : TextConst ENU='Ordre de transfert est expédié Merci de valider la réception manuellement',FRA='Ordre de transfert est expédié Merci de valider la réception manuellement';
        Text50003 : Label 'Des Documents de transfer sont crées';
}

