page 50164 "MAD Par Magasin"
{
    PageType = List;
    SourceTable = Table50105;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Centre de gestion";"Centre de gestion")
                {
                }
                field("No. Article";"No. Article")
                {
                }
                field(Description;Description)
                {
                }
                field(MAD;MAD)
                {
                    DecimalPlaces = 0:2;
                }
                field("MAD Global";"MAD Global")
                {
                    DecimalPlaces = 0:2;
                }
                field("STANDARD STOCK";"STANDARD STOCK")
                {
                    DecimalPlaces = 0:2;
                }
                field("Qte en cours";"Qte en cours")
                {
                    DecimalPlaces = 0:0;
                }
                field("Stock Magasin";"Stock Magasin")
                {
                    DecimalPlaces = 0:0;
                }
                field("Stock Global";"Stock Global")
                {
                    DecimalPlaces = 0:0;
                }
                field(SOQ;SOQ)
                {
                    DecimalPlaces = 0:2;
                    Numeric = true;
                }
                field("Product Code";"Product Code")
                {
                }
                field(ICC;ICC)
                {
                }
                field("STD Stock Forcer";"STD Stock Forcer")
                {
                    DecimalPlaces = 0:0;
                }
                field("Dernier Date Vente";"Dernier Date Vente")
                {
                }
                field("Dernier Date Reception";"Dernier Date Reception")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Pièce Non Vendu")
            {
                Image = Calculate;

                trigger OnAction();
                begin
                    UserSetup.GET(USERID);
                    IF NOT UserSetup."Cost Responsable" THEN BEGIN
                    Location.GET(UserSetup."Mag Reservation/Defaut");
                    ResponsibilityCenter.RESET;
                    ResponsibilityCenter.SETRANGE(Code,Location."Centre de Gestion");
                    IF ResponsibilityCenter.FINDFIRST THEN
                      BEGIN
                        ArticleNonVenduparPeriod.RESET;
                        ArticleNonVenduparPeriod.SETRANGE("Centre De gestion",ResponsibilityCenter.Code);
                        IF NOT ArticleNonVenduparPeriod.ISEMPTY THEN
                           ArticleNonVenduparPeriod.DELETEALL;
                        Item.RESET;
                        IF Item.FINDSET THEN REPEAT
                           IntResult := 0;
                           IntResultAchat :=0;
                          // Item.SETFILTER("No.",'04152YZZA1');
                          // Item .FINDFIRST;
                          IF Item."No." = '04152YZZA1' THEN
                              MESSAGE('hh');
                           Item.SETRANGE("Respensability Center Filter", ResponsibilityCenter.Code);
                           Item.SETRANGE("Location Filter",Location.Code);
                           Item.CALCFIELDS("Dern. Date Vente","Dern. Date Vente Histo.",Inventory,"Dern. Date Achat","Dern. Date Achat Histo.");
                           IntResult  := SystemeReapproTYT.FctGetItemNonMvt(Item."Dern. Date Vente",Item."Dern. Date Vente Histo.");
                           IF IntResult = 0 THEN
                              IntResultAchat := SystemeReapproTYT.FctGetItemNonMvt(Item."Dern. Date Achat",Item."Dern. Date Achat Histo.");
                           IF ((IntResult  <> 0) OR (IntResultAchat <> 0)) AND (Item.Inventory <> 0) THEN
                             BEGIN
                               ArticleNonVenduparPeriod.RESET;
                               ArticleNonVenduparPeriod.INIT;
                               ArticleNonVenduparPeriod."Centre De gestion" := ResponsibilityCenter.Code;
                               ArticleNonVenduparPeriod.Description := Item.Description;
                               ArticleNonVenduparPeriod."Stock Magasin" := Item.Inventory;
                               IF  (IntResult  <> 0) THEN
                                 BEGIN
                                   IF IntResult = 6 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';

                                     END;
                                   IF IntResult = 1 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';

                                     END;
                                   IF IntResult = 2 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResult = 3 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResult = 4 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResult = 5 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                 END;
                                 IF (IntResultAchat <> 0) AND (IntResult = 0) THEN BEGIN
                                     IF IntResultAchat = 6 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';

                                     END;
                                     IF IntResultAchat = 1 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';

                                     END;
                                   IF IntResultAchat = 2 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResultAchat = 3 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResultAchat = 4 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResultAchat = 5 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := Item."No.";
                                     END;
                                 END;
                              ArticleNonVenduparPeriod.INSERT(TRUE);
                             END;
                        UNTIL Item.NEXT = 0;
                      END;
                    END
                      ELSE BEGIN
                      ArticleNonVenduparPeriod.RESET;
                      ArticleNonVenduparPeriod.DELETEALL;
                      ResponsibilityCenter.RESET;
                      ResponsibilityCenter.SETFILTER("Location Code",'<>%1','');
                      IF ResponsibilityCenter.FINDSET THEN BEGIN
                        REPEAT
                          Item.RESET;
                          IF Item.FINDSET THEN
                            REPEAT
                            IntResult := 0;
                          // Item.SETFILTER("No.",'04152YZZA1');
                          // Item .FINDFIRST;
                             Item.SETRANGE("Respensability Center Filter", ResponsibilityCenter.Code);
                             Item.SETRANGE("Location Filter",ResponsibilityCenter."Location Code");
                             Item.CALCFIELDS("Dern. Date Vente","Dern. Date Vente Histo.",Inventory,"Dern. Date Achat","Dern. Date Achat Histo.");
                                   IF Item."No." = '04152YZZA1' THEN
                              MESSAGE('hh');
                             IntResult  := SystemeReapproTYT.FctGetItemNonMvt(Item."Dern. Date Vente",Item."Dern. Date Vente Histo.");
                             IF IntResult = 0 THEN
                              IntResultAchat := SystemeReapproTYT.FctGetItemNonMvt(Item."Dern. Date Achat",Item."Dern. Date Achat Histo.");
                             IF ((IntResult  <> 0) OR (IntResultAchat <> 0)) AND (Item.Inventory <> 0) THEN
                             BEGIN
                               ArticleNonVenduparPeriod.RESET;
                               ArticleNonVenduparPeriod.INIT;
                               ArticleNonVenduparPeriod."Centre De gestion" := ResponsibilityCenter.Code;
                               ArticleNonVenduparPeriod.Description := Item.Description;
                               ArticleNonVenduparPeriod."Stock Magasin" := Item.Inventory;
                               IF  (IntResult  <> 0) THEN
                                 BEGIN
                                   IF IntResult = 6 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';

                                     END;
                                   IF IntResult = 1 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';

                                     END;
                                   IF IntResult = 2 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResult = 3 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResult = 4 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResult = 5 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                 END;
                                 IF (IntResultAchat <> 0) AND (IntResult = 0) THEN BEGIN
                                    IF IntResultAchat = 6 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';

                                     END;
                                     IF IntResultAchat = 1 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';

                                     END;
                                   IF IntResultAchat = 2 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResultAchat = 3 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResultAchat = 4 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := '';
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                   IF IntResultAchat = 5 THEN BEGIN
                                     ArticleNonVenduparPeriod."Article non Mvt 3A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 2A":= '';
                                     ArticleNonVenduparPeriod."Article non Mvt 1A" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt 6M" := '';
                                     ArticleNonVenduparPeriod."Article non Mvt plus 5A" := Item."No.";
                                     ArticleNonVenduparPeriod."Article mvt 0/ 6M" :='';
                                     END;
                                 END;
                              ArticleNonVenduparPeriod.INSERT(TRUE);
                             END;
                            UNTIL Item.NEXT = 0;
                        UNTIL ResponsibilityCenter.NEXT = 0;
                        END;
                      END;
                    //PAGE.RUNMODAL(50166,ArticleNonVenduparPeriod);
                    PieceNonVendu.RUN;
                end;
            }
            action("Etat De Sortie Pièce par Magasin")
            {
                RunObject = Report 50118;
            }
            action("availability item")
            {
                CaptionML = ENU='Item availability',
                            FRA='Disponibilité Article';
                Image = Accounts;
                Promoted = true;

                trigger OnAction();
                var
                    LCUItemavailability : Codeunit "70000";
                    LRecAvailibilityItem : Record "70006";
                    LPagItemAvailability : Page "70009";
                    TotalStock : Decimal;
                    TotalQtyCmdAchat : Decimal;
                    TotalQtyCmdVente : Decimal;
                    TotalQtyCmdService : Decimal;
                    TotalQtyReservAchat : Decimal;
                    TotalQtyReserStock : Decimal;
                    TotalQtyStockDispo : Decimal;
                    "TotalQtyStockDispoProjeté" : Decimal;
                    TotalQtyTransfer : Decimal;
                    TotalQtyTransit : Decimal;
                begin
                    //<< CT16V0002 ZMN 28/07/2016
                    CLEAR(LPagItemAvailability);
                    LCUItemavailability.FctStartSearchForItem("No. Article");
                    TotalStock :=LCUItemavailability.FctGetTotalStock;
                    TotalQtyCmdAchat :=LCUItemavailability.FctGetTotalQtyCmdAchat;
                    TotalQtyCmdVente :=LCUItemavailability.FctGetTotalQtyCmdVente;
                    TotalQtyCmdService:=LCUItemavailability.FctGetTotalQtyCmdService;
                    TotalQtyReservAchat:=LCUItemavailability.FctGetTotalQtyReservAchat;
                    TotalQtyReserStock:=LCUItemavailability.FctGetTotalQtyReservStoick;
                    TotalQtyStockDispo := LCUItemavailability.FctGetTotalStockDispo;
                    TotalQtyStockDispoProjeté := LCUItemavailability.FctGetTotalStockDispoProjete;
                    //TotalQtyDevis
                    TotalQtyTransfer := LCUItemavailability.FctGetTotalTransfer;
                    TotalQtyTransit := LCUItemavailability.FctGetTotalTransit;
                    //DecPossibleDemande :=LCUItemavailability.FctCalcStockDispoByMagCentralOT("No.");
                    //DecReserver := TotalStock -DecPossibleDemande;
                    LRecAvailibilityItem.SETRANGE("Item No.","No. Article");//
                    LPagItemAvailability.LOOKUPMODE(TRUE);
                    LPagItemAvailability.SETTABLEVIEW(LRecAvailibilityItem);
                    LPagItemAvailability.SETRECORD(LRecAvailibilityItem);
                    LPagItemAvailability.FctSetTotal(TotalStock ,TotalQtyCmdAchat ,TotalQtyCmdVente ,TotalQtyCmdService ,TotalQtyReservAchat,TotalQtyReserStock
                                                     ,TotalQtyStockDispo,TotalQtyStockDispoProjeté,TotalQtyTransit,TotalQtyTransfer,0,0,0);
                    IF LPagItemAvailability.RUNMODAL = ACTION::LookupOK THEN
                        LPagItemAvailability.GETRECORD(LRecAvailibilityItem);

                    //>> CT16V0002 ZMN 28/07/2016
                end;
            }
            action("Consulter Pièce Non Vendu")
            {
                Image = Continue;
                RunObject = Page 50166;
            }
        }
    }

    trigger OnOpenPage();
    begin
        UserSetup.GET(USERID);
        IF NOT UserSetup."Cost Responsable" THEN BEGIN
        Location.GET(UserSetup."Mag Reservation/Defaut");
        FILTERGROUP(2);
        SETRANGE("Centre de gestion",Location."Centre de Gestion");
        FILTERGROUP(0);
        END;
    end;

    var
        UserSetup : Record "91";
        Location : Record "14";
        ResponsibilityCenter : Record "5714";
        Item : Record "27";
        SystemeReapproTYT : Codeunit "70009";
        IntResult : Integer;
        ArticleNonVenduparPeriod : Record "50107";
        PieceNonVendu : Page "50166";
        IntResultAchat : Integer;
}

