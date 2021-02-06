page 60202 "Fiche LC PR"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Table70036;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Code L.C";"Code L.C")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field(Garantie;Garantie)
                {
                }
                field("Type L.C";"Type L.C")
                {
                }
                field("Type d'import";"Type d'import")
                {
                }
                field("Taux d'ouverture";"Taux d'ouverture")
                {
                    Caption = 'Cours d''ouverture';
                    ShowMandatory = TauxOuverture;
                }
                field("Taux simulation L.C";"Taux simulation L.C")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field(Banque;Banque)
                {
                }
                field("Code devise";"Code devise")
                {
                }
                field("Nom de la banque";"Nom de la banque")
                {
                }
                field("No. LC / Banque";"No. LC / Banque")
                {
                }
                field("No. Dossier d'import";"No. Dossier d'import")
                {
                }
                field("No. Expédition";"No. Expédition")
                {
                }
                field("No. domiciliation";"No. domiciliation")
                {
                }
                field(Quantité;Quantité)
                {
                    DecimalPlaces = 0:0;
                }
                field("Montant L.C Dev";"Montant L.C Dev")
                {
                }
                field("Montant L.C Tnd";"Montant L.C Tnd")
                {
                    DecimalPlaces = 3:3;
                }
                field("Date Création";"Date Création")
                {
                }
                field("Date BL";"Date BL")
                {
                }
                field("Date Echéance L.C";"Date Echéance L.C")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Mnt Tot. Arrivahe Devise";"Mnt Tot. Arrivahe Devise")
                {
                }
                field("Mnt Tot. Arrivahe Tnd";"Mnt Tot. Arrivahe Tnd")
                {
                    Visible = false;
                }
                field(Payé;Payé)
                {
                }
                field(Statut;Statut)
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
            }
            part(;70045)
            {
                SubPageLink = No. L.C=FIELD(Code L.C);
            }
            part(;70046)
            {
                SubPageLink = No. L.C=FIELD(Code L.C);
            }
            group(Valorisation)
            {
                field("Taux de déclaration";"Taux de déclaration")
                {
                    Visible = false;
                }
                field("Montant LC-C.D";"Montant LC-C.D")
                {
                    Visible = false;
                }
                field("Ecart Mnt LC / Mnt LC-CD";"Ecart Mnt LC / Mnt LC-CD")
                {
                    Visible = false;
                }
                field("Court à Terme (de simuation)";"Court à Terme (de simuation)")
                {
                    Visible = false;
                }
                field("Montant LC-C.T";"Montant LC-C.T")
                {
                    Visible = false;
                }
                field("Ecart Mnt LC / Mnt LC-CT";"Ecart Mnt LC / Mnt LC-CT")
                {
                    Visible = false;
                }
                field("Ecart Mnt LC-CD / Mnt LC-CT";"Ecart Mnt LC-CD / Mnt LC-CT")
                {
                    Visible = false;
                }
            }
            group("Traçabilité Date")
            {
                field("Taux estimatif";"Taux estimatif")
                {
                    Visible = false;
                }
                field("Mnt simulation douane";"Mnt simulation douane")
                {
                    Visible = false;
                }
                field("Total proforma en Dev";"Total proforma en Dev")
                {
                    Visible = false;
                }
                field("Total proforma en TND";"Total proforma en TND")
                {
                    Visible = false;
                }
                field("Date Dossier";"Date Dossier")
                {
                    Visible = false;
                }
                field("Date Ultime d'envoi";"Date Ultime d'envoi")
                {
                }
                field("Date Validité";"Date Validité")
                {
                }
                field("Nbr. mois indivisible Ouv.";"Nbr. mois indivisible Ouv.")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Nbr. mois indivisible Accep.";"Nbr. mois indivisible Accep.")
                {
                }
                field("Date Arrivée";"Date Arrivée")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Lancer L.C")
            {
                Image = ReleaseDoc;

                trigger OnAction();
                begin
                    MgtAures.CheckLC(Rec);
                end;
            }
            action("Porposer Commission V.0")
            {
                Image = Suggest;
                Visible = false;

                trigger OnAction();
                begin
                    MgtAures.ProposerCommLC(Rec);
                end;
            }
            action("Proposer Commissions V.2")
            {
                Image = Suggest;

                trigger OnAction();
                begin
                    /*RecCommisionparbanque.SETFILTER(Banque,'%1', Banque);
                    PageCommissionparbanque.SETTABLEVIEW(RecCommisionparbanque);
                    PageCommissionparbanque.RUNMODAL;
                    */
                    //PageCommissionparbanque.SETTABLEVIEW
                    DossVN := '';
                    op := op::LC;
                    LettredecréditLC.GET("Code L.C");
                    CLEAR(PageCommissionparbanque);
                    RecCommisionparbanque.SETFILTER(Banque,'%1', Banque);
                    PageCommissionparbanque.SETTABLEVIEW(RecCommisionparbanque);
                    PageCommissionparbanque.LOOKUPMODE := TRUE;
                    PageCommissionparbanque.GetLettredeCredit(LettredecréditLC,DossVN,op,'');
                    IF PageCommissionparbanque.RUNMODAL <> ACTION::Cancel THEN;

                end;
            }
            action("Insérer Commission / Feuille compta.")
            {
                Caption = 'Insérer Commission / Feuille compta.';
                Image = InsertAccount;

                trigger OnAction();
                begin
                     DossVN := '';
                     MgtAures.InsererCommLC(Rec,DossVN);
                end;
            }
            separator(Bordereau)
            {
                Caption = 'Bordereau';
            }
            action("Créer Bord. LC")
            {
                Image = Payment;
                Visible = false;

                trigger OnAction();
                begin
                    ERROR('a supp');
                    TESTFIELD("Taux de déclaration");
                    // TESTFIELD("No Bordereau LC",'');

                     LettredecréditLC.GET("Code L.C");

                     RecPaymentClass.GET('L.C');

                     RecPaymentHeader.INIT;
                     RecPaymentClass.TESTFIELD("Header No. Series");
                     NoSeriesMgt.InitSeries(RecPaymentClass."Header No. Series",'',0D,RecPaymentHeader."No.",RecPaymentHeader."No. Series");
                     RecPaymentHeader.VALIDATE("Payment Class",RecPaymentClass.Code);
                     RecPaymentHeader.VALIDATE("Account Type",RecPaymentClass."Header Account Type");
                     RecPaymentHeader.Suggestions:=RecPaymentClass.Suggestions;
                     RecPaymentHeader."Type Règlement" := FORMAT(RecPaymentClass.Type_Reg);
                     //RecPaymentHeader.VALIDATE("Currency Code",LettredecréditLC."Taux de déclaration"); ahjouter pour aures

                     //CurrencyExchangeRate.RESET;
                     //CurrencyExchangeRate.SETRANGE("Currency Code",LettredecréditLC.Devise);
                     //CurrencyExchangeRate.FINDLAST;

                     //RecPaymentHeader.VALIDATE("Currency Factor",(1/"Cours de douanement")*CurrencyExchangeRate."Exchange Rate Amount");
                     RecPaymentHeader.INSERT(TRUE);

                     RecPaymentLine.INIT;
                     RecPaymentLine.VALIDATE("No.",RecPaymentHeader."No.");
                     RecPaymentLine."Line No." := 10000;
                     RecPaymentLine.VALIDATE(Amount,"Montant L.C Dev");
                     RecPaymentLine.VALIDATE("Account Type",RecPaymentLine."Account Type"::Vendor);
                     RecPaymentLine.VALIDATE("Account No.",'F00002');//LettredecréditLC."No. Fournisseur"); //ajouter aures
                     RecPaymentLine.INSERT(TRUE);

                     RecPaymentHeader.VALIDATE("Account Type",RecPaymentHeader."Account Type"::"Bank Account");
                     RecPaymentHeader.VALIDATE("Account No.",LettredecréditLC.Banque);
                     RecPaymentHeader.VALIDATE("No Titre d'importation","Code L.C");
                     RecPaymentHeader.VALIDATE("No Expédition",LettredecréditLC."No. Expédition");
                     RecPaymentHeader.MODIFY(TRUE);

                     //VALIDATE("No Bordereau LC",RecPaymentHeader."No.");
                     MODIFY(TRUE);
                end;
            }
            action("Consulter Liste des négociations à terme")
            {
                Caption = 'Consulter Liste des négociations à terme';
                Visible = false;

                trigger OnAction();
                begin
                    ERROR('à asupp');
                    MgtAures.ConsulterNégociation(Rec);
                end;
            }
            action("Négociation Cour à terme")
            {
                Visible = false;

                trigger OnAction();
                begin
                    ERROR('à asupp');
                    MgtAures.ProposerNagociationCT(Rec);
                end;
            }
            action("Liste des dossier Import")
            {
                Visible = false;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        TauxOuverture := TRUE;
    end;

    trigger OnInit();
    begin
        TauxOuverture := TRUE;
    end;

    trigger OnOpenPage();
    begin
        CLEAR(DétailLC);
        DétailLC.SETFILTER(DétailLC."No. L.C",'%1',"Code L.C");
        IF DétailLC.FIND('-') THEN
        REPEAT
        DétailLC."Montant arrivage Devise" := 0;
        DétailLC."Montant arrivage Tnd" := 0;
            CLEAR(PurchaseLine);
            PurchaseLine.SETFILTER(PurchaseLine."Document Type",'%1',PurchaseLine."Document Type"::Order);
            PurchaseLine.SETFILTER(PurchaseLine."No. L.C",'%1',"Code L.C");
            PurchaseLine.SETFILTER(PurchaseLine."No. Expédition",'%1',"No. Expédition");
            PurchaseLine.SETFILTER(PurchaseLine."No. Proforma VN",'%1',DétailLC."No. Proforma");
            PurchaseLine.SETFILTER(PurchaseLine."Quantity Received",'<>%1',0);
            IF PurchaseLine.FIND('-') THEN
            REPEAT
                DétailLC."Montant arrivage Devise" += PurchaseLine."Direct Unit Cost";
                CLEAR(DossiersTransit);
                DossiersTransit.SETRANGE(DossiersTransit."N° Dossier",PurchaseLine."No dossier VN");
                IF DossiersTransit.FIND('-') THEN
                  IF DossiersTransit."Taux de change déclaration" <> 0 THEN
                DétailLC."Montant arrivage Tnd"    += PurchaseLine."Direct Unit Cost"*DossiersTransit."Taux de change déclaration";
            UNTIL PurchaseLine.NEXT = 0;
          DétailLC.MODIFY;
        UNTIL DétailLC.NEXT = 0;
    end;

    var
        MgtAures : Codeunit "70003";
        TauxOuverture : Boolean;
        "LettredecréditLC" : Record "70036";
        RecPaymentClass : Record "10860";
        RecPaymentHeader : Record "10865";
        NoSeriesMgt : Codeunit "396";
        CurrencyExchangeRate : Record "330";
        RecPaymentLine : Record "10866";
        DecMonantOuvert : Decimal;
        "DétailLC" : Record "70037";
        PageCommissionparbanque : Page "70034";
        RecCommisionparbanque : Record "70005";
        DossVN : Code[20];
        op : Option LC,Arrivage,Financement;
        PurchaseLine : Record "39";
        DossiersTransit : Record "50000";

    local procedure FctMantantArrivage(PCdeNoExpedition : Code[20]) : Decimal;
    var
        LRecTitreDimportation : Record "50011";
    begin
        LRecTitreDimportation.SETRANGE("No. Expedition" ,PCdeNoExpedition) ;
        IF LRecTitreDimportation.FINDFIRST THEN
          BEGIN
            LRecTitreDimportation.CALCFIELDS("Total en Dinar");
            //message(FORMAT(LRecTitreDimportation."Total en Dinar"));
            EXIT(LRecTitreDimportation."Cours douane");
          END;
    end;
}

