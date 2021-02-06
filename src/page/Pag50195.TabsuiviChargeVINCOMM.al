page 50195 "Tab. suivi Charge VIN COMM"
{
    PageType = List;
    SourceTable = Table60092;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Article";"No. Article")
                {
                }
                field("Description Article";"Description Article")
                {
                }
                field("No. Serie";"No. Serie")
                {
                    Caption = 'VIN';
                }
                field("Répartiton HT\TTC";"Répartiton HT\TTC")
                {
                }
                field("Sejour en stock";"Sejour en stock")
                {
                    BlankZero = true;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Vitesse de vente";"Vitesse de vente")
                {
                    BlankZero = true;
                }
                field("No. Commande Achat";"No. Commande Achat")
                {
                }
                field("Devise Achat";"Devise Achat")
                {
                }
                field("Taux de change facture achat";"Taux de change facture achat")
                {
                    BlankZero = true;
                }
                field("Date Commande Achat";"Date Commande Achat")
                {
                }
                field("No. Réception";"No. Réception")
                {
                }
                field("No. Ligne Réception";"No. Ligne Réception")
                {
                    Visible = false;
                }
                field("Date Réception";"Date Réception")
                {
                }
                field("No. Facture Achat Navision";"No. Facture Achat Navision")
                {
                }
                field("Date Facture Achat";"Date Facture Achat")
                {
                }
                field("No. Facture Achat Fournisseur";"No. Facture Achat Fournisseur")
                {
                }
                field("Montant Achat Unitaire";"Montant Achat Unitaire")
                {
                    BlankZero = true;
                }
                field(PVN;PVN)
                {
                    BlankZero = true;
                    Style = Attention;
                    StyleExpr = TRUE;

                    trigger OnDrillDown();
                    begin

                        CLEAR(ServiceLedgerEntry);
                        ServiceLedgerEntry.SETCURRENTKEY("Serial No. (Serviced)","Entry Type","Document Type","Type Reception");
                        ServiceLedgerEntry.SETFILTER("Serial No. (Serviced)",'%1',"No. Serie");
                        ServiceLedgerEntry.SETFILTER("Entry Type",'%1',ServiceLedgerEntry."Entry Type"::Sale);
                        ServiceLedgerEntry.SETFILTER("Document Type",'%1|%2',ServiceLedgerEntry."Document Type"::Invoice,ServiceLedgerEntry."Document Type"::"Credit Memo");
                        ServiceLedgerEntry.SETFILTER("Type Reception",'%1',ServiceLedgerEntry."Type Reception"::VN);
                        ServiceLedgerEntry.SETFILTER("Bill-to Customer No.",'%1','INTERNE');
                        PAGE.RUN(0,ServiceLedgerEntry);
                    end;
                }
                field("Gratuité (Hors PVN)";"Gratuité (Hors PVN)")
                {
                    Style = Attention;
                    StyleExpr = TRUE;

                    trigger OnDrillDown();
                    begin
                        CLEAR(ServiceLedgerEntry);
                        ServiceLedgerEntry.SETCURRENTKEY("Serial No. (Serviced)","Entry Type","Document Type","Type Reception");
                        ServiceLedgerEntry.SETFILTER("Serial No. (Serviced)",'%1',"No. Serie");
                        ServiceLedgerEntry.SETFILTER("Entry Type",'%1',ServiceLedgerEntry."Entry Type"::Sale);
                        ServiceLedgerEntry.SETFILTER("Document Type",'%1|%2',ServiceLedgerEntry."Document Type"::Invoice,ServiceLedgerEntry."Document Type"::"Credit Memo");
                        ServiceLedgerEntry.SETFILTER("Bill-to Customer No.",'%1','INTERNE');
                        ServiceLedgerEntry.SETFILTER(ServiceLedgerEntry."Type Reception" ,'<>%1',ServiceLedgerEntry."Type Reception"::VN);
                        PAGE.RUN(0,ServiceLedgerEntry);
                    end;
                }
                field("Garantie BSB";"Garantie BSB")
                {
                    Style = Attention;
                    StyleExpr = TRUE;

                    trigger OnDrillDown();
                    begin
                        CLEAR(ServiceLedgerEntry);
                        ServiceLedgerEntry.SETCURRENTKEY("Serial No. (Serviced)","Entry Type","Document Type","Type Reception");
                        ServiceLedgerEntry.SETFILTER("Serial No. (Serviced)",'%1',"No. Serie");
                        ServiceLedgerEntry.SETFILTER("Entry Type",'%1',ServiceLedgerEntry."Entry Type"::Sale);
                        ServiceLedgerEntry.SETFILTER("Document Type",'%1|%2',ServiceLedgerEntry."Document Type"::Invoice,ServiceLedgerEntry."Document Type"::"Credit Memo");
                        ServiceLedgerEntry.SETFILTER("Bill-to Customer No.",'%1','CL000446');
                        PAGE.RUN(0,ServiceLedgerEntry);
                    end;
                }
                field("Garantie Fournisseur";"Garantie Fournisseur")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;

                    trigger OnDrillDown();
                    begin
                        CLEAR(ServiceLedgerEntry);
                        ServiceLedgerEntry.SETCURRENTKEY("Serial No. (Serviced)","Entry Type","Document Type","Type Reception");
                        ServiceLedgerEntry.SETFILTER("Serial No. (Serviced)",'%1',"No. Serie");
                        ServiceLedgerEntry.SETFILTER("Entry Type",'%1',ServiceLedgerEntry."Entry Type"::Sale);
                        ServiceLedgerEntry.SETFILTER("Document Type",'%1|%2',ServiceLedgerEntry."Document Type"::Invoice,ServiceLedgerEntry."Document Type"::"Credit Memo");
                        ServiceLedgerEntry.SETFILTER("Bill-to Customer No.",'%1','GARANTIE');
                        PAGE.RUN(0,ServiceLedgerEntry);
                    end;
                }
                field(SAV;SAV)
                {
                    Style = Favorable;
                    StyleExpr = TRUE;

                    trigger OnDrillDown();
                    begin
                        CLEAR(ServiceLedgerEntry);
                        ServiceLedgerEntry.SETCURRENTKEY("Serial No. (Serviced)","Entry Type","Document Type","Type Reception");
                        ServiceLedgerEntry.SETFILTER("Serial No. (Serviced)",'%1',"No. Serie");
                        ServiceLedgerEntry.SETFILTER("Entry Type",'%1',ServiceLedgerEntry."Entry Type"::Sale);
                        ServiceLedgerEntry.SETFILTER("Document Type",'%1|%2',ServiceLedgerEntry."Document Type"::Invoice,ServiceLedgerEntry."Document Type"::"Credit Memo");
                        ServiceLedgerEntry.SETFILTER("Bill-to Customer No.",'%1','C*');
                        PAGE.RUN(0,ServiceLedgerEntry);
                    end;
                }
                field("No. Réglement Frs";"No. Réglement Frs")
                {
                }
                field("No. Dossier";"No. Dossier")
                {
                }
                field("Statut Dossier";"Statut Dossier")
                {
                }
                field("No. Commande Vente";"No. Commande Vente")
                {
                }
                field("Date commande Vente";"Date commande Vente")
                {
                }
                field("Code Client Vente";"Code Client Vente")
                {
                }
                field("Type paiement";"Type paiement")
                {
                }
                field("Nom Client Vente";"Nom Client Vente")
                {
                }
                field("Client Leasing";"Client Leasing")
                {
                }
                field("Code Vendeur";"Code Vendeur")
                {
                }
                field("Nom vendeur";"Nom vendeur")
                {
                }
                field("No. BL";"No. BL")
                {
                }
                field("Date BL Vente";"Date BL Vente")
                {
                }
                field("No. Facture Vente";"No. Facture Vente")
                {
                }
                field("Date Facture Vente";"Date Facture Vente")
                {
                }
                field(Devise;Devise)
                {
                    Caption = 'Devise Vente';
                }
                field("Taux de change Facture vente";"Taux de change Facture vente")
                {
                }
                field("Montant Facture Vente HT";"Montant Facture Vente HT")
                {
                    BlankZero = true;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Mnt Fact  complémentaire";"Mnt Fact  complémentaire")
                {
                    BlankZero = true;

                    trigger OnDrillDown();
                    begin



                        CLEAR(SalesInvoiceLine);
                        SalesInvoiceLine.SETRANGE("Affecter sur","No. Serie");
                        SalesInvoiceLine.SETRANGE(Type,SalesInvoiceLine.Type::"Charge (Item)");
                        SalesInvoiceLine.SETFILTER("No.",'%1','F707119000001');
                        PAGE.RUN(0,SalesInvoiceLine);

                    end;
                }
                field("Mnt Avoir Ristourne";"Mnt Avoir Ristourne")
                {
                    BlankZero = true;

                    trigger OnDrillDown();
                    begin


                        CLEAR(SalesCrMemoLine);
                        SalesCrMemoLine.SETRANGE("Affecter sur","No. Serie");
                        SalesCrMemoLine.SETRANGE(Type,SalesCrMemoLine.Type::"Charge (Item)");
                        SalesCrMemoLine.SETFILTER("No.",'%1','F707119000001');
                        PAGE.RUN(0,SalesCrMemoLine);
                    end;
                }
                field("Centre de gestion";"Centre de gestion")
                {
                }
                field("Code Magasin";"Code Magasin")
                {
                }
                field("Taux de change estimatif";"Taux de change estimatif")
                {
                    BlankZero = true;
                }
                field("Mnt Droit Douane";"Mnt Droit Douane")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Mnt Fodec";"Mnt Fodec")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Mnt TVA";"Mnt TVA")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Mnt RDP";"Mnt RDP")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Mnt Assurance";"Mnt Assurance")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Frais Généraux";"Frais Généraux")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Frais d'approche estimatif";"Frais d'approche estimatif")
                {
                    BlankZero = true;
                }
                field("Prix de revien estimatif";"Prix de revien estimatif")
                {
                    BlankZero = true;
                }
                field("Montant marge Brut Estimatif";"Montant marge Brut Estimatif")
                {
                }
                field("Prix de vente catalogue.";"Prix de vente catalogue.")
                {
                    BlankZero = true;
                }
                field(Remise;"Ecart Prix de vente : Cata/Fac")
                {
                    BlankZero = true;
                }
                field("Taux Marge estimative";"Taux Marge estimative")
                {
                    BlankZero = true;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Coût Prévu / réception";"Coût Prévu / réception")
                {
                }
                field("Taux de change Déclaration";"Taux de change Déclaration")
                {
                    BlankZero = true;
                    Style = Attention;
                    StyleExpr = CoutPrev;
                }
                field("Prix de revient Taux Déclarati";"Prix de revient Taux Déclarati")
                {
                    BlankZero = true;
                }
                field("Marge vente % Taux Declaration";"Marge vente % Taux Declaration")
                {
                    BlankZero = true;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Taux change Devise Paiement";"Taux change Devise Paiement")
                {
                    BlankZero = true;
                }
                field("Achat a terme";"Achat a terme")
                {
                }
                field("Date achat a terme";"Date achat a terme")
                {
                }
                field("Frais d'approches Réelles";"Frais d'approches Réelles")
                {
                    BlankZero = true;

                    trigger OnDrillDown();
                    begin



                        CLEAR(ValueEntry);
                        ValueEntry.SETFILTER("Item Ledger Entry No.",'%1',"Item leadger Entry No.");
                        ValueEntry.SETFILTER("Document Type",'%1|%2',ValueEntry."Document Type"::"Purchase Invoice",ValueEntry."Document Type"::"Purchase Credit Memo");
                        ValueEntry.SETFILTER("Item Charge No.",'<>%1','');
                        PAGE.RUN(0,ValueEntry);
                    end;
                }
                field("Prix de revient réel";"Prix de revient réel")
                {
                    BlankZero = true;
                }
                field("Montant Marge Brut";"Montant Marge Brut")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Taux de Marge réel";"Taux de Marge actuel")
                {
                    Caption = 'Taux de Marge réel';
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Prix de revient Avec PVN";"Prix de revient Avec PVN")
                {
                    BlankZero = true;
                }
                field("Marge vente avec PVN";"Marge vente avec PVN")
                {
                    BlankZero = true;
                }
                field("Frais de Change";"Frais de Change")
                {
                    BlankZero = true;
                }
                field("No. Lettre crédit";"No. Lettre crédit")
                {
                }
                field("No. Lettre crédit Banque";"No. Lettre crédit Banque")
                {
                }
                field("Code condition de paiement";"Code condition de paiement")
                {
                }
                field("No. Projet Expédition";"No. Projet Expédition")
                {
                }
                field("Banque L.C";"Banque L.C")
                {
                }
                field("Type vendeur";"Type vendeur")
                {
                }
                field("Type vente";"Type vente")
                {
                }
                field("Taux de change Prévisonel";"Taux de change Prévisonel")
                {
                }
                field("Prix de revien Prévisonel";"Prix de revien Prévisonel")
                {
                }
                field("Taux Marge Prévisonel";"Taux Marge Prévisonel")
                {
                }
                field("Code Magasin stock";"Code Magasin stock")
                {
                }
                field(Couleur;Couleur)
                {
                }
                field(Garnissage;Garnissage)
                {
                }
                field("Commentaire arrivage";"Commentaire arrivage")
                {
                }
                field("Port de provenance";"Port de provenance")
                {
                }
                field("VIN en stock";"VIN en stock")
                {
                }
                field("Entrée en Stock";"Entrée en Stock")
                {
                }
                field("Echéance de Réglement client";"Echéance de Réglement client")
                {
                }
                field("Réservation sur arrivage";"Réservation sur arrivage")
                {
                }
                field("Réservation sur stock.";"Réservation sur stock.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Charger Tableau VIN")
            {
                Image = UpdateXML;

                trigger OnAction();
                begin
                    CODEUNIT.RUN(70008);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        IF "Devise Vente"='' THEN
          Devise := 'TND' ELSE
          Devise := "Devise Vente";
        CoutPrev := FALSE;

        IF "Coût Prévu / réception" THEN CoutPrev := TRUE;
    end;

    trigger OnOpenPage();
    begin
         UserSetup.GET(USERID);
         //IF USERID<>'BSB\SBS_KAIS' THEN//JTFSS22P000187059
         IF NOT UserSetup.DAF THEN ERROR('interface non fonctionel');
    end;

    var
        ServiceLedgerEntry : Record "5907";
        ValueEntry : Record "5802";
        Devise : Code[10];
        UserSetup : Record "91";
        SalesInvoiceLine : Record "113";
        SalesCrMemoLine : Record "115";
        CoutPrev : Boolean;
}

