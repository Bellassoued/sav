page 70037 "Expédition VN"
{
    // version new

    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Table70033;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No. Expédition";"No. Expédition")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field(;"No. Fournisseur")
                {
                }
                field("Nom Fournisseur";"Nom Fournisseur")
                {
                }
                field("Total Qté Expéd.";"Total Qté Expéd.")
                {
                    DecimalPlaces = 3:0;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field(Statut;Statut)
                {
                    Visible = true;
                }
                field("No. Commande Achat";"No. Commande Achat")
                {
                }
                field("No. Arrivage";"No. Arrivage")
                {
                    Visible = false;
                }
                field("Taux Simulation";"Taux Simulation")
                {
                }
                field("No. Dossier";"No. Dossier")
                {
                    Visible = false;
                }
                field("No. Simulation";"No. Simulation")
                {
                }
            }
            part(;70040)
            {
                SubPageLink = No. Expédition=FIELD(No. Expédition);
            }
            part(;70038)
            {
                SubPageLink = No. Expédition=FIELD(No. Expédition);
                Visible = false;
            }
            group(Statistiques)
            {
                field("Total minoration";"Total minoration")
                {
                }
                field("Pourcentage Mino / VN";"Pourcentage Mino / VN")
                {
                }
                field("Tot. En Devise (sans Mino)";"Tot. En Devise (sans Mino)")
                {
                }
                field("Tot. En Devise (avec Mino)";"Tot. En Devise (avec Mino)")
                {
                }
                field("Tot. en TND (avec Mino)";"Tot. en TND (avec Mino)")
                {
                }
                field("Date Création";"Date Création")
                {
                }
                field("crée par";"crée par")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(;Notes)
            {
            }
            systempart(;MyNotes)
            {
            }
            systempart(;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Proposer simulation D.Douanes")
            {
                Image = SuggestGrid;

                trigger OnAction();
                begin
                    CduMgtAures.ProposerSimulationDouaneV2(Rec);
                end;
            }
            action("Créer Proforma")
            {
                Image = "Order";
                Visible = false;

                trigger OnAction();
                var
                    "LigneExpéditionVNModified" : Record "70034";
                begin
                    CduMgtAures.FctCréerProforma(Rec);
                    /*
                    TESTFIELD(Statut,Statut::Lancer);
                    CLEAR(LigneExpéditionVN);
                    LigneExpéditionVN.SETFILTER("No. Expédition",'%1',"No. Expédition");
                    LigneExpéditionVN.FINDSET;
                     REPEAT
                      PurchasesPayablesSetup.GET;
                      PurchasesPayablesSetup.TESTFIELD("Default VN Vendor");
                    
                      PurchaseHeader.INIT;
                      PurchaseHeader."No.":='';
                      PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Quote;
                      PurchaseHeader.VALIDATE("Buy-from Vendor No.",PurchasesPayablesSetup."Default VN Vendor");
                      PurchaseHeader."Order Type" := PurchaseHeader."Order Type"::VN;
                      PurchaseHeader."No. Expédition" := "No. Expédition";
                      PurchaseHeader.INSERT(TRUE);
                      //COMMIT;
                      LigneExpéditionVNModified.RESET;
                      LigneExpéditionVNModified.SETRANGE("No. Expédition",LigneExpéditionVN."No. Expédition");
                      // LigneExpéditionVNModified.SETRANGE("No. Ligne",LigneExpéditionVN."No. Ligne");
                      LigneExpéditionVNModified.SETRANGE(Modele,LigneExpéditionVN.Modele);
                      LigneExpéditionVNModified.SETRANGE("No. proforma",LigneExpéditionVN."No. proforma");
                      IF LigneExpéditionVNModified.FINDFIRST THEN
                        BEGIN
                          LigneExpéditionVNModified."No. proforma" :=PurchaseHeader."No.";
                          LigneExpéditionVNModified.Statut:= LigneExpéditionVNModified.Statut::"Proforma Crée";
                          LigneExpéditionVNModified.MODIFY(TRUE);
                        END;
                      CLEAR(DétailVNArrivage);
                      DétailVNArrivage.SETFILTER("No. Expédition",'%1',LigneExpéditionVN."No. Expédition");
                      DétailVNArrivage.SETFILTER(Famille,LigneExpéditionVN.Modele);
                      DétailVNArrivage.FINDSET;
                       REPEAT
                          PurchaseLine.INIT;
                          PurchaseLine.VALIDATE("Document Type",PurchaseLine."Document Type"::Quote);
                          PurchaseLine.VALIDATE("Document No.",PurchaseHeader."No.");
                    
                          PurchaseLine."Line No." := PurchaseLine."Line No."  +10000;
                          PurchaseLine.VALIDATE(Type,PurchaseLine.Type::Item);
                          PurchaseLine.VALIDATE("No.",DétailVNArrivage."Item No.");
                          //PurchaseLine."No.":= DétailVNArrivage."Item No.";
                          PurchaseLine.VALIDATE("Variant Code",DétailVNArrivage."Code variante");
                          PurchaseLine.VALIDATE(PurchaseLine."Buy-from Vendor No.",PurchasesPayablesSetup."Default VN Vendor");
                          PurchaseLine.VALIDATE(PurchaseLine."Pay-to Vendor No.",PurchasesPayablesSetup."Default VN Vendor");
                          PurchaseLine.VALIDATE(Quantity,1);
                    
                          //PurchaseLine.Quantity:=1;
                          PurchaseLine.VALIDATE("Direct Unit Cost",DétailVNArrivage."Prix d'achat unitaire validé");
                          PurchaseLine.CAF := DétailVNArrivage.CAF;
                    
                          PurchaseLine.INSERT(TRUE);
                    
                    
                          DétailVNArrivageModified.GET(DétailVNArrivage.CAF);
                          DétailVNArrivageModified."No. proforma" := PurchaseHeader."No.";
                          DétailVNArrivageModified.MODIFY(TRUE);
                    
                          TrackingSpecification.RESET;
                            IF TrackingSpecification.FINDLAST THEN
                            NoSeq := TrackingSpecification."Entry No."
                            ELSE
                            NoSeq := 0 ;
                          TrackingSpecification.INIT;
                          TrackingSpecification."Entry No."       := NoSeq;
                          TrackingSpecification.VALIDATE("Item No.",PurchaseLine."No.");
                          TrackingSpecification.VALIDATE("Variant Code",DétailVNArrivage."Code variante");
                          TrackingSpecification.VALIDATE("Location Code",PurchaseLine."Location Code");
                    
                          TrackingSpecification.VALIDATE("Creation Date",WORKDATE);
                          TrackingSpecification."Source Type"    := 39;
                          TrackingSpecification."Source Subtype" := 0;
                          TrackingSpecification."Source ID" := PurchaseLine."Document No.";
                          TrackingSpecification."Source Ref. No." := PurchaseLine."Line No.";
                    
                          CLEAR(PItemTrackingLines);
                          PItemTrackingLines.CreateCustomizedSNBatch2(TrackingSpecification,1,FALSE,DétailVNArrivage.VIN,0);
                    
                       UNTIL DétailVNArrivage.NEXT = 0;
                     UNTIL LigneExpéditionVN.NEXT = 0;
                     */

                end;
            }
            action("Créer L.C Par L.C Banque")
            {
                Caption = 'Créer L.C Par L.C Banque';
                Image = LedgerBook;

                trigger OnAction();
                begin

                     CduMgtAures.CréerLCGrpLCBanque(Rec); //ok
                end;
            }
            action("Créer L.C /Proforma")
            {
                Image = LedgerBook;
                Visible = false;

                trigger OnAction();
                begin
                    CduMgtAures.CréerLCGrpProformat(Rec);
                end;
            }
            action("Créer L.C Groupé/Proforma")
            {
                Caption = 'Créer Lettre de crédit Groupé/Proforma';
                Image = LedgerBook;
                Visible = false;

                trigger OnAction();
                begin
                    CduMgtAures.CréerLC(Rec); //ok
                end;
            }
            action(Lancer)
            {
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    "LigneExpéditionVN" : Record "70034";
                begin

                    IF FctCalcSumQty(Rec) <> 0 THEN
                      "Pourcentage Mino / VN" := "Total minoration"/FctCalcSumQty(Rec);
                    CLEAR(LigneExpédVNGroupéProfor);
                    LigneExpédVNGroupéProfor.SETFILTER("No. Expédition",Rec."No. Expédition");
                    LigneExpédVNGroupéProfor.FIND('-');
                    REPEAT
                          LigneExpédVNGroupéProfor."Tot. en TND (Sans Mino)":= LigneExpédVNGroupéProfor."Tot. En Devise (sans Mino)"*"Taux de change";
                          LigneExpédVNGroupéProfor."Tot. en TND (avec Mino)" := LigneExpédVNGroupéProfor."Tot. En Devise (avec Mino)"*"Taux de change";
                          LigneExpédVNGroupéProfor.MODIFY;
                      UNTIL LigneExpédVNGroupéProfor.NEXT = 0;
                    Statut:= Statut::Lancer;
                end;
            }
            action(Reouvrire)
            {
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Statut:= Statut::"Ouvert ";
                end;
            }
            action(Valider)
            {
                Image = PostDocument;

                trigger OnAction();
                begin
                    IF CONFIRM(Text0001) THEN
                      BEGIN
                        TESTFIELD(Statut,1);
                        Statut:= Statut::valider;
                        END;
                end;
            }
            action("List Proforma")
            {
                Image = List;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 70040;
                RunPageLink = Field70030=FIELD(No. Expédition);
                Visible = false;
            }
            action("Creér Commande sur  proforma")
            {
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                begin
                    ERROR('Non fonctionelle : utilisaer la fonction "Créer Commande par Exped"');
                    CduMgtAures.FctCreatePurchOrderFromProform(Rec);
                end;
            }
            action("Créer Commande par Exped")
            {
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                begin
                    CduMgtAures.FctCreatePurchOrdersFromExpedition(Rec);
                end;
            }
            action("List Commande Achat")
            {
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 9307;
                RunPageLink = No. Expédition=FIELD(No. Expédition);
            }
            action("Créer Arrivage VN")
            {
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                begin
                    CduMgtAures.FctCréerArrivageFromExpedition(Rec);
                end;
            }
            action("List L.C")
            {
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 70043;
                RunPageLink = No. Expédition=FIELD(No. Expédition);
                RunPageMode = View;
            }
            action("Actualise Expédition")
            {
                Image = Refresh;

                trigger OnAction();
                var
                    PurchaseHeader : Record "38";
                    PurchaseLine : Record "39";
                    "DétailVNArrivageUpdate" : Record "70015";
                begin
                    IF CONFIRM('Voulez vous actualiser les lignes expéditions',TRUE,FALSE) THEN BEGIN
                    CLEAR(LigneExpédVNGroupéProfor);
                    LigneExpédVNGroupéProfor.SETFILTER("No. Expédition",'%1',"No. Expédition");
                    LigneExpédVNGroupéProfor.SETFILTER("No. L.C",'%1','');
                    IF LigneExpédVNGroupéProfor.FIND('-') THEN BEGIN
                    REPEAT

                      LigneExpédVNGroupéProfor."Tot. En Devise (sans Mino)" := 0;
                      LigneExpédVNGroupéProfor."Tot. En Devise (avec Mino)" := 0;
                      LigneExpédVNGroupéProfor."Tot. en TND (avec Mino)" := 0;
                      LigneExpédVNGroupéProfor."Montant Total minoration" := 0;
                      LigneExpédVNGroupéProfor.Quantité := 0;

                      CLEAR(DétailVNArrivage);
                      DétailVNArrivage.SETFILTER("No. Expédition",'%1',"No. Expédition");
                      DétailVNArrivage.SETFILTER("No. proforma",'%1',LigneExpédVNGroupéProfor."No. proforma");
                      DétailVNArrivage.FIND('-');
                      REPEAT
                          LigneExpédVNGroupéProfor.Quantité += 1;
                          DétailVNArrivage.CALCFIELDS("Prix d'achat unitaire","Mnt Mino Unitaire","Prix couleur calculé","Prix Garnissage calculé","Mnt Mino Unitaire Animation");
                          //LigneExpédVNGroupéProfor.VALIDATE("Montant Total minoration",DétailVNArrivage.MINO1 + DétailVNArrivage.MINO2+DétailVNArrivage.MINO3);
                          LigneExpédVNGroupéProfor."Montant Total minoration" += (DétailVNArrivage.MINO1 + DétailVNArrivage.MINO2+DétailVNArrivage.MINO3);
                          LigneExpédVNGroupéProfor."Tot. En Devise (sans Mino)" += DétailVNArrivage."Prix achat Net Sans Mino";
                          LigneExpédVNGroupéProfor."Tot. En Devise (avec Mino)" += DétailVNArrivage."Prix achat Net avec Mino";
                          LigneExpédVNGroupéProfor."Tot. en TND (avec Mino)" := LigneExpédVNGroupéProfor."Tot. En Devise (avec Mino)"*LigneExpédVNGroupéProfor."Taux de change";
                          LigneExpédVNGroupéProfor."Mino / VN" := LigneExpédVNGroupéProfor."Montant Total minoration"/LigneExpédVNGroupéProfor.Quantité;
                          LigneExpédVNGroupéProfor.MODIFY;
                      UNTIL DétailVNArrivage.NEXT = 0;
                    UNTIL LigneExpédVNGroupéProfor.NEXT = 0;
                    END;
                    //SM 271117
                    IF "No. Commande Achat" <> '' THEN BEGIN
                      PurchaseHeader.RESET;
                      PurchaseHeader.GET(PurchaseHeader."Document Type"::Order,"No. Commande Achat");
                      PurchaseLine.RESET;
                      PurchaseLine.SETRANGE("Document No.","No. Commande Achat");
                      PurchaseLine.SETRANGE("Document Type",PurchaseHeader."Document Type"::Order);
                      IF PurchaseLine.FINDSET THEN BEGIN
                        REPEAT
                          DétailVNArrivageUpdate.GET(PurchaseLine.CAF);
                          PurchaseLine.VALIDATE("Direct Unit Cost",DétailVNArrivageUpdate."Prix achat Net avec Mino");
                          PurchaseLine.MODIFY;
                        UNTIL PurchaseLine.NEXT = 0;
                      END;
                    END;
                    //END SM

                    MESSAGE('MAJ expédition terminer');
                    END;
                end;
            }
            action("Créer Commande par provenance")
            {
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    LRecLigneExpeditionVN : Record "70027";
                    LRecPurchaseLine : Record "39";
                    LRecPurchaseHeader : Record "38";
                    PurchaseOrderList : Page "9307";
                begin
                    LRecLigneExpeditionVN.RESET;
                    LRecLigneExpeditionVN.SETRANGE("No. L.C",'');
                    LRecLigneExpeditionVN.SETRANGE("No. Expédition","No. Expédition");
                    //LRecLigneExpeditionVN.SETRANGE("Port de Provenance",'THAILANDE');
                    IF LRecLigneExpeditionVN.FINDSET THEN
                      ERROR('Merci de terminer la création des LC');
                    LRecLigneExpeditionVN.RESET;
                    LRecLigneExpeditionVN.SETRANGE("No. Expédition","No. Expédition");
                    //LRecLigneExpeditionVN.SETRANGE("Port de Provenance",'THAILANDE');
                    LRecLigneExpeditionVN.FINDSET;
                    LRecPurchaseHeader.RESET;
                      LRecPurchaseHeader.SETRANGE("No. Expédition","No. Expédition");
                      //LRecPurchaseHeader.SETRANGE("Pays de provenance",LRecLigneExpeditionVN."Port de Provenance");
                      //LRecPurchaseHeader.SETRANGE("Currency Code",LRecLigneExpeditionVN."Currency Code");
                     // IF NOT LRecPurchaseHeader.FINDFIRST THEN
                    IF CONFIRM('Voulez vous créer Commandes Achat ?',TRUE,FALSE) THEN
                    REPEAT
                      LRecPurchaseLine.RESET;
                      LRecPurchaseLine.SETRANGE("No. Expédition",LRecLigneExpeditionVN."No. Expédition");
                      //LRecPurchaseLine.SETRANGE("Pays de provenance",LRecLigneExpeditionVN."Port de Provenance");
                      LRecPurchaseLine.SETRANGE("Currency Code",LRecLigneExpeditionVN."Currency Code");
                      LRecPurchaseLine.SETRANGE("No.",LRecLigneExpeditionVN."Code Article");
                      IF NOT LRecPurchaseLine.FINDFIRST THEN
                        CduMgtAures.FctCreatePurchOrdersFromExpeditionLines(LRecLigneExpeditionVN);
                    UNTIL LRecLigneExpeditionVN.NEXT=0;
                    PurchaseHeader.RESET;
                    PurchaseHeader.SETRANGE("No. Expédition","No. Expédition");
                    PurchaseHeader.FINDSET;
                    CLEAR(PurchaseOrderList);

                    PurchaseOrderList.SETRECORD(PurchaseHeader);
                    PurchaseOrderList.SETTABLEVIEW(PurchaseHeader);
                    PurchaseOrderList.RUN;
                end;
            }
            action("Liste réceptions achat")
            {
            }
            action("Actualiser Taux de change")
            {
                Image = Allocate;

                trigger OnAction();
                begin
                    IF CONFIRM('Etes vous sûre de voiloir actualiser le taux de change pourr cette expédition',TRUE,FALSE) THEN
                    BEGIN

                    CLEAR(LigneExpédVNProvenance2);
                    LigneExpédVNProvenance2.SETFILTER(LigneExpédVNProvenance2."No. Expédition",'%1',"No. Expédition");
                    LigneExpédVNProvenance2.FIND('-');
                    REPEAT
                      CLEAR(CurrExchRate);
                      CurrExchRate.SETRANGE(CurrExchRate."Starting Date","Date Création");
                      CurrExchRate.SETRANGE(CurrExchRate."Currency Code",LigneExpédVNProvenance2."Currency Code");
                      CurrExchRate.FIND('-');
                      IF LigneExpédVNProvenance2."Currency Code" = 'JPY' THEN
                        BEGIN
                         LigneExpédVNProvenance2."Taux de change" := CurrExchRate."Relational Exch. Rate Amount";
                         LigneExpédVNProvenance2."Tot. en TND (avec Mino)"  := (LigneExpédVNProvenance2."Taux de change")*LigneExpédVNProvenance2."Tot. En Devise (avec Mino)";
                        END
                      ELSE
                        LigneExpédVNProvenance2.VALIDATE("Taux de change",CurrExchRate."Relational Exch. Rate Amount");

                      LigneExpédVNProvenance2.MODIFY;
                    UNTIL LigneExpédVNProvenance2.NEXT = 0;
                    END;
                end;
            }
        }
    }

    var
        "LigneExpéditionVN" : Record "70034";
        "DétailVNArrivage" : Record "70015";
        SalesReceivablesSetup : Record "311";
        PurchaseHeader : Record "38";
        PurchasesPayablesSetup : Record "312";
        PurchaseLine : Record "39";
        PurchaseLine1 : Record "39";
        "DétailVNArrivageModified" : Record "70015";
        TrackingSpecification : Record "336";
        NoSeq : Integer;
        PItemTrackingLines : Page "6510";
        CduMgtAures : Codeunit "70003";
        Text0001 : Label 'Ëtes vous sûre de vouloir valider cette expédition';
        "LigneExpédVNGroupéProfor" : Record "70027";
        "LigneExpédVNProvenance2" : Record "70027";
        CurrExchRate : Record "330";

    local procedure FctCalcSumQty("RecEntêtExpéditionVN" : Record "70033") : Decimal;
    var
        "LRecLigneExpéditionVN" : Record "70034";
        DecSumQty : Decimal;
    begin
         DecSumQty := 0;
        LRecLigneExpéditionVN.RESET;
        LRecLigneExpéditionVN.SETRANGE("No. Expédition",RecEntêtExpéditionVN."No. Expédition");
        IF LRecLigneExpéditionVN.FINDSET THEN
            REPEAT
              DecSumQty:= DecSumQty+ LRecLigneExpéditionVN.Quantité;
            UNTIL LRecLigneExpéditionVN.NEXT = 0;
        EXIT( DecSumQty);
    end;
}

