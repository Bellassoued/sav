page 70034 "Commission par banque"
{
    DataCaptionFields = Banque;
    PageType = List;
    SourceTable = Table70005;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Type commision";"Type commision")
                {
                }
                field("Affecté sur";"Affecté sur")
                {
                }
                field(Banque;Banque)
                {
                }
                field("Nom de la banque";"Nom de la banque")
                {
                }
                field("% Commission/Int.";"% Commission/Int.")
                {
                }
                field("Montant commision";"Montant commision")
                {
                }
                field(Plafond;Plafond)
                {
                }
                field("Compte contrepartie";"Compte contrepartie")
                {
                }
                field("Txt Formule";"Txt Formule")
                {
                }
                field("% TVA";"% TVA")
                {
                }
                field(Insérer;Insérer)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage();
    begin
        Inserercommission(AffectCommSur);
        InitCommission;
    end;

    var
        LettredecreditLC : Record "70036";
        DossierVN : Code[20];
        AffectCommSur : Option LC,Arrivage,Financement;
        NoFinancement : Code[10];
        Lignefinancement : Record "70044";

    procedure Inserercommission(AffecComm : Option LC,Arrivage,Financement);
    var
        BankAccount : Record "270";
        Commissionbanque : Record "70005";
        DetailcommissionLC : Record "70038";
        DossiersTransit : Record "50000";
    begin
        IF CONFIRM('Voulez vous Créer des lignes de commissions cette LC ?',TRUE,FALSE) THEN
          BEGIN

              LettredecreditLC.CALCFIELDS("Montant L.C Dev");
              CLEAR(BankAccount);
              BankAccount.GET(LettredecreditLC.Banque);
              CLEAR(Commissionbanque);
              Commissionbanque.SETFILTER(Banque,'%1',LettredecreditLC.Banque);
              Commissionbanque.SETFILTER("Type commision",'%1',Commissionbanque."Type commision"::"L.C"); //commission L.C
              Commissionbanque.SETFILTER(Insérer,'%1',TRUE);
              Commissionbanque.FIND('-');
              REPEAT
                CLEAR(DetailcommissionLC);
                DetailcommissionLC."No. L.C" := LettredecreditLC."Code L.C";
                DetailcommissionLC."No. Ligne":= FORMAT(Commissionbanque."Entry No.");
                DetailcommissionLC.Banque:=LettredecreditLC.Banque;
                DetailcommissionLC."Code Commission":= FORMAT(Commissionbanque."Affecté sur");
                DetailcommissionLC."Montant paramétré"      := Commissionbanque."Montant commision";
                DetailcommissionLC."No. Dossier VN" := DossierVN;
                DetailcommissionLC."Ecart Montant" := 0;
                DetailcommissionLC."Affeter sur" := 'L.C';
                IF Commissionbanque."% Commission/Int." <> 0 THEN
                  BEGIN
                    IF AffectCommSur = AffectCommSur::LC THEN
                     DetailcommissionLC."Montant à comtabiliser" := LettredecreditLC."Montant L.C Dev"*Commissionbanque."% Commission/Int."/100
                                                                    * LettredecreditLC."Taux d'ouverture";

                     IF AffectCommSur = AffectCommSur::Arrivage THEN
                       BEGIN
                        CLEAR(DossiersTransit);
                         DossiersTransit.GET(DossierVN);
                         DossiersTransit.CALCFIELDS("Total en Devise");
                         DetailcommissionLC."Affeter sur" := 'Arrivage';
                       DetailcommissionLC."Montant à comtabiliser" := DossiersTransit."Total en Devise"*(Commissionbanque."% Commission/Int."/100)
                                                                    * DossiersTransit."Taux change estimatif";
                       //MESSAGE('Commission sur arrivage %1  %2  %3',DossiersTransit."Total en Devise",Commissionbanque."% Commission/Int.",DossiersTransit."taux pour commission");
                       END;

                      IF AffectCommSur = AffectCommSur::Financement THEN
                       BEGIN
                        CLEAR(DossiersTransit);
                         DossiersTransit.GET(DossierVN);
                         DossiersTransit.CALCFIELDS("Total en Devise");
                         DetailcommissionLC."No. Financement" := NoFinancement;
                        DetailcommissionLC."Affeter sur" := 'Financement';
                        CLEAR(Lignefinancement);
                        Lignefinancement.SETRANGE(Lignefinancement."No. Financement",NoFinancement);
                        Lignefinancement.FIND('-');
                        DetailcommissionLC."Montant à comtabiliser" := (Lignefinancement."Montant Financement"*Lignefinancement."Nb. jours"
                                                                      * (Commissionbanque."% Commission/Int."/100))
                                                                    /360;


                        END;



                      IF Commissionbanque."Affecté sur" = Commissionbanque."Affecté sur"::Ouverture THEN
                       BEGIN
                        LettredecreditLC.TESTFIELD("Nbr. mois indivisible Ouv.");
                        DetailcommissionLC."Montant à comtabiliser" :=DetailcommissionLC."Montant à comtabiliser"*LettredecreditLC."Nbr. mois indivisible Ouv." ;
                       END;
                      IF Commissionbanque."Affecté sur" = Commissionbanque."Affecté sur"::"Modif Mnt/Date-Val" THEN
                       BEGIN
                        LettredecreditLC.TESTFIELD("Nbr. mois indivisible Ouv.");
                        DetailcommissionLC."Montant à comtabiliser" :=DetailcommissionLC."Montant à comtabiliser"*LettredecreditLC."Nbr. mois indivisible Ouv." ;
                       END;
                      IF Commissionbanque."Affecté sur" = Commissionbanque."Affecté sur"::Acceptation THEN
                       BEGIN
                        LettredecreditLC.TESTFIELD("Nbr. mois indivisible Ouv.");
                        DetailcommissionLC."Montant à comtabiliser" :=DetailcommissionLC."Montant à comtabiliser"*LettredecreditLC."Nbr. mois indivisible Accep." ;
                       END;
                      IF Commissionbanque."Affecté sur" = Commissionbanque."Affecté sur"::Réaliation THEN
                            BEGIN
                                //DetailcommissionLC."Montant à comtabiliser" := LettredecreditLC."Montant L.C Dev"*Commissionbanque."% Commission"/100*LettredecreditLC."Taux d'ouverture";
                                IF DetailcommissionLC."Montant à comtabiliser" > 350 THEN DetailcommissionLC."Montant à comtabiliser" := 350;
                            END;
                      IF Commissionbanque."Affecté sur"= Commissionbanque."Affecté sur"::"Frais-Corresp" THEN
                         DetailcommissionLC."Montant à comtabiliser" := LettredecreditLC."Montant L.C Dev"*1.001;
                      //END;
                   END

                ELSE
                  BEGIN
                   DetailcommissionLC."Base de calcule" := 1;
                   DetailcommissionLC."Montant à comtabiliser":= Commissionbanque."Montant commision";
                  END;
                DetailcommissionLC."Contre partie":= Commissionbanque."Compte contrepartie";
                DetailcommissionLC."Date création":=WORKDATE;
                DetailcommissionLC."Créer par":=USERID;
                IF Commissionbanque."% TVA" <> 0  THEN
                  DetailcommissionLC."Montant à comtabiliser" := DetailcommissionLC."Montant à comtabiliser" * (1+Commissionbanque."% TVA"/100);
                DetailcommissionLC.INSERT;
              UNTIL Commissionbanque.NEXT = 0;
        END;
    end;

    procedure GetLettredeCredit(RecLettredecreditLC : Record "70036";Doss : Code[20];Op : Option LC,arrivage,Financement;NumFinancement : Code[10]);
    begin
        LettredecreditLC.GET(RecLettredecreditLC."Code L.C");
        DossierVN := Doss;
        AffectCommSur := Op;
        NoFinancement := NumFinancement;
    end;

    local procedure InitCommission();
    var
        Commissionbanque : Record "70005";
        Commisionparbanque : Record "70005";
    begin
        CLEAR(Commisionparbanque);
        Commisionparbanque.FIND('-');
        REPEAT
          Commisionparbanque.Insérer := FALSE;
          Commisionparbanque.MODIFY;
          UNTIL Commisionparbanque.NEXT = 0;
    end;
}

