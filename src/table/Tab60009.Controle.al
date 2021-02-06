table 60009 "Controle"
{
    // version SAV Automobile

    // //Etat des champs :
    // //A : Accord client
    // //B : Bon
    // //D : Défectueux
    // // >>KT 28 11 2016

    CaptionML = ENU='Visual Control',
                FRA='Controle Visuel';

    fields
    {
        field(1;Id;Code[20])
        {
        }
        field(2;"Date de Creation";Date)
        {
        }
        field(3;"Cree par";Code[50])
        {
        }
        field(4;"Etat du vitre et parrebriseB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat du vitre et parrebriseB" THEN
                  BEGIN
                  "Etat du vitre et parrebriseD":=FALSE;
                 // "Etat du vitre et parrebriseA":=FALSE;
                    END
            end;
        }
        field(5;"Etat du vitre et parrebriseD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat du vitre et parrebriseD" THEN
                  BEGIN
                    "Etat du vitre et parrebriseB":=FALSE;
                   // "Etat du vitre et parrebriseA":=FALSE;
                    END
            end;
        }
        field(6;"Etat carrosserie et peinture B";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat carrosserie et peinture B" THEN
                   BEGIN
                    "Etat carrosserie et peinture D":=FALSE;
                    //"Etat carrosserie et peinture A":=FALSE;
                    END
            end;
        }
        field(7;"Etat carrosserie et peinture D";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat carrosserie et peinture D" THEN
                  BEGIN
                    "Etat carrosserie et peinture B":=FALSE;
                   // "Etat carrosserie et peinture A":=FALSE;
                    END
            end;
        }
        field(8;"Etat des feux avant arriereB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat des feux avant arriereB" THEN
                  BEGIN
                    "Etat des feux avant arriereD":=FALSE;
                   // "Etat des feux avant arriereA":=FALSE;
                    END
            end;
        }
        field(9;"Etat des feux avant arriereD";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat des feux avant arriereD" THEN
                  BEGIN
                    "Etat des feux avant arriereB":=FALSE;
                    //"Etat des feux avant arriereA":=FALSE;
                    END
            end;
        }
        field(10;"Etat des balais essuie-glaceB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat des balais essuie-glaceB" THEN
                BEGIN
                  "Etat des balais essuie-glaceD":=FALSE;
                  //"Etat des balais essuie-glaceA":=FALSE;
                  END
            end;
        }
        field(11;"Etat des balais essuie-glaceD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat des balais essuie-glaceD" THEN
                BEGIN
                  "Etat des balais essuie-glaceB":=FALSE;
                  //"Etat des balais essuie-glaceA":=FALSE;
                  END
            end;
        }
        field(12;"Etat des pneus B";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat des pneus B" THEN
                  BEGIN
                    "Etat des pneus D":=FALSE;
                    //"Etat des pneus A":=FALSE;
                    END
            end;
        }
        field(13;"Etat des pneus D";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat des pneus D" THEN
                  BEGIN
                    "Etat des pneus B":=FALSE;
                    //"Etat des pneus A":=FALSE;
                    END
            end;
        }
        field(14;"Roue se secoursB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Roue se secoursB" THEN
                  BEGIN
                    "Roue se secoursD":=FALSE;
                    //"Roue se secoursA":=FALSE;
                    END
            end;
        }
        field(15;"Roue se secoursD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Roue se secoursD" THEN
                  BEGIN
                    "Roue se secoursB":=FALSE;
                    //"Roue se secoursA":=FALSE;
                    END
            end;
        }
        field(16;"Cric et manivelleB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Cric et manivelleB" THEN
                  BEGIN
                    "Cric et manivelleB":=FALSE;
                    //"Cric et manivelleA":=FALSE;
                    END
            end;
        }
        field(17;"Cric et manivelleD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Cric et manivelleD" THEN
                  BEGIN
                    "Cric et manivelleB":=FALSE;
                    //"Cric et manivelleA":=FALSE;
                    END
            end;
        }
        field(18;"Allume CigareB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Allume CigareB" THEN
                  BEGIN
                    "Allume CigareD":=FALSE;
                    //"Allume CigareA":=FALSE;
                    END
            end;
        }
        field(19;"Allume CigareD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Allume CigareD" THEN
                  BEGIN
                    "Allume CigareB":=FALSE;
                    //"Allume CigareA":=FALSE;
                    END
            end;
        }
        field(20;ExtincteurB;Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF ExtincteurB THEN
                  BEGIN
                    ExtincteurD:=FALSE;
                    //ExtincteurA:=FALSE;
                    END
            end;
        }
        field(21;ExtincteurD;Boolean)
        {

            trigger OnValidate();
            begin
                IF ExtincteurD THEN
                  BEGIN
                    ExtincteurB:=FALSE;
                    //ExtincteurA:=FALSE;
                    END
            end;
        }
        field(22;"Boite pharmacieB";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Boite pharmacieB" THEN
                  BEGIN
                    "Boite pharmacieD":=FALSE;
                    //"Boite pharmacieA":=FALSE;
                    END
            end;
        }
        field(23;"Boite pharmacieD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Boite pharmacieD" THEN
                  BEGIN
                    "Boite pharmacieB":=FALSE;
                    //"Boite pharmacieA":=FALSE;
                    END
            end;
        }
        field(24;"Poste radioB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Poste radioB" THEN
                  BEGIN
                    "Poste radioD":=FALSE;
                    //"Poste radioA":=FALSE;
                    END
            end;
        }
        field(25;"Poste radioD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Poste radioD" THEN
                  BEGIN
                    "Poste radioB":=FALSE;
                    //"Poste radioA":=FALSE;
                    END
            end;
        }
        field(26;"Papier vehiculeB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Papier vehiculeB" THEN
                  BEGIN
                    "Papier vehiculeD":=FALSE;
                    //"Papier vehiculeA":=FALSE;
                    END
            end;
        }
        field(27;"Papier vehiculeD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Papier vehiculeD" THEN
                  BEGIN
                    "Papier vehiculeB":=FALSE;
                    //"Papier vehiculeA":=FALSE;
                    END
            end;
        }
        field(28;"Fuel Gauge";Decimal)
        {
            CaptionML = ENU='Fuel Gauge',
                        FRA='Jauge de carburant';
        }
        field(29;"Lumineux Tableau de boradB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Lumineux Tableau de boradB" THEN
                  BEGIN
                    "Lumineux Tableau de boradD":=FALSE;
                    //"Lumineux Tableau de boradA":=FALSE;
                    END
            end;
        }
        field(30;"Lumineux Tableau de boradD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Lumineux Tableau de boradD" THEN
                  BEGIN
                    "Lumineux Tableau de boradB":=FALSE;
                    //"Lumineux Tableau de boradA":=FALSE;
                    END
            end;
        }
        field(31;"Desc Lumineux Tableau de borad";Text[30])
        {
        }
        field(32;Kilometrage;Integer)
        {

            trigger OnValidate();
            var
                LRecServiceItem : Record "5940";
                LRecReceptionSAV : Record "60008";
                ControleKlm : Record "60009";
            begin
                
                LRecReceptionSAV.GET(Id);
                //SM 240718
                UserSetup.GET(USERID);
                ControleKlm.RESET;
                ControleKlm.SETCURRENTKEY(Kilometrage);
                CALCFIELDS(VIN);
                ControleKlm.SETRANGE(VIN,VIN);
                 IF ControleKlm.FINDLAST THEN
                 IF (ControleKlm.Kilometrage > Kilometrage) AND (NOT UserSetup."modification KM")THEN
                
                   ERROR('Le kilométrage saisie est inférieur au dernier kilométrage enregistré !');
                //END SM
                
                /*IF (LRecReceptionSAV."Warranty Status"<>LRecReceptionSAV."Warranty Status"::"Fiche créée")
                   AND (LRecReceptionSAV."Warranty Status"<>LRecReceptionSAV."Warranty Status"::"Garantie approuvée")
                   AND*/IF (LRecReceptionSAV."Demande Garantie")THEN
                  //IF LRecReceptionSAV."Service Type"=LRecReceptionSAV."Service Type"::"Big Service" THEN
                    IF (Kilometrage<=100000) AND (Kilometrage>0) THEN BEGIN
                      CALCFIELDS(VIN);
                      LRecServiceItem.RESET;
                      LRecServiceItem.SETRANGE("Serial No.",VIN);
                      LRecServiceItem.FINDFIRST;
                      IF LRecServiceItem."Date Mise en Circulation"=0D THEN BEGIN
                        IF LRecServiceItem."Préparation/Livraison"<>LRecServiceItem."Préparation/Livraison"::Livrer THEN BEGIN
                          LRecReceptionSAV.VALIDATE("Type de garantie",LRecReceptionSAV."Type de garantie"::"Garantie  Constructeur");
                          LRecReceptionSAV.VALIDATE("Sous Type de garantie",LRecReceptionSAV."Sous Type de garantie"::" ");
                          LRecReceptionSAV.VALIDATE("N° campagne",'');
                          LRecReceptionSAV.MODIFY;
                        END;
                      END;
                      IF (LRecServiceItem."Date Mise en Circulation"<>0D) THEN
                      IF (CALCDATE('2A',LRecServiceItem."Date Mise en Circulation")>=TODAY) THEN BEGIN
                        IF (((LRecReceptionSAV."Type de garantie"<>LRecReceptionSAV."Type de garantie"::Compagne)) OR(LRecReceptionSAV."Renoncer campagne")) THEN BEGIN
                          LRecReceptionSAV.VALIDATE("Type de garantie",LRecReceptionSAV."Type de garantie"::"Garantie  Constructeur");
                          LRecReceptionSAV.VALIDATE("Sous Type de garantie",LRecReceptionSAV."Sous Type de garantie"::" ");
                          LRecReceptionSAV.VALIDATE("N° campagne",'');
                          LRecReceptionSAV.MODIFY;
                        END;
                        IF (((LRecReceptionSAV."Type de garantie"=LRecReceptionSAV."Type de garantie"::Compagne)) AND(LRecReceptionSAV."Demande Garantie")) THEN BEGIN
                          LRecReceptionSAV.VALIDATE("Type de garantie",LRecReceptionSAV."Type de garantie"::"Garantie  Constructeur+Campagne");
                          LRecReceptionSAV.VALIDATE("Sous Type de garantie",LRecReceptionSAV."Sous Type de garantie"::" ");
                          LRecReceptionSAV.VALIDATE("N° campagne",'');
                          LRecReceptionSAV.MODIFY;
                        END;
                      END ELSE IF (CALCDATE('3A',LRecServiceItem."Date Mise en Circulation")>=TODAY) THEN BEGIN
                        IF ((LRecReceptionSAV."Type de garantie"<>LRecReceptionSAV."Type de garantie"::Compagne) OR(LRecReceptionSAV."Renoncer campagne"))  THEN BEGIN
                          LRecReceptionSAV.VALIDATE("Type de garantie",LRecReceptionSAV."Type de garantie"::"Garantie  Prolongé");
                          LRecReceptionSAV.VALIDATE("Sous Type de garantie",LRecReceptionSAV."Sous Type de garantie"::" ");
                          LRecReceptionSAV.VALIDATE("N° campagne",'');
                          LRecReceptionSAV.MODIFY;
                        END;
                      END ELSE BEGIN
                          LRecReceptionSAV.VALIDATE("Type de garantie",LRecReceptionSAV."Type de garantie"::"Payant par Client");
                          LRecReceptionSAV.VALIDATE("Sous Type de garantie",LRecReceptionSAV."Sous Type de garantie"::" ");
                          LRecReceptionSAV.MODIFY;
                    END;
                    END ELSE BEGIN
                      CALCFIELDS(VIN);
                      LRecServiceItem.RESET;
                      LRecServiceItem.SETRANGE("Serial No.",VIN);
                      LRecServiceItem.FINDFIRST;
                      LRecReceptionSAV.VALIDATE("Type de garantie",LRecReceptionSAV."Type de garantie"::"Payant par Client");
                      LRecReceptionSAV.VALIDATE("Sous Type de garantie",LRecReceptionSAV."Sous Type de garantie"::" ");
                      LRecReceptionSAV.VALIDATE("N° campagne",'');
                      LRecReceptionSAV.MODIFY;
                    END;

            end;
        }
        field(33;"Voir les piece remplacer";Integer)
        {
            InitValue = 5;
        }
        field(34;"origine piece";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "origine piece" THEN
                  BEGIN
                    "origine pieceD":=FALSE;
                    //"origine pieceA":=FALSE;
                    END
            end;
        }
        field(35;Remarques;Text[250])
        {
        }
        field(36;"Picture a imprimer";BLOB)
        {
            CaptionML = ENU='Picture to print',
                        FRA='Image a imprimer';
            SubType = Bitmap;
        }
        field(37;"Image a afficher";BLOB)
        {
            CaptionML = ENU='Picture to show',
                        FRA='Image a afficher';
            SubType = Bitmap;
        }
        field(38;"Etat des plaques de policeB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat des plaques de policeB" THEN
                  BEGIN
                    "Etat des plaques de policeD":=FALSE;
                    //"Etat des plaques de policeA":=FALSE;
                    END
            end;
        }
        field(39;"Etat des plaques de policeD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat des plaques de policeD" THEN
                  BEGIN
                    "Etat des plaques de policeB":=FALSE;
                    //"Etat des plaques de policeA":=FALSE;
                    END
            end;
        }
        field(40;"Etat des feux avant/arriéreB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat des feux avant/arriéreB" THEN
                BEGIN
                    "Etat des feux avant/arriéreD":=FALSE;
                    //"Etat des feux avant/arriéreA":=FALSE;
                    END
            end;
        }
        field(41;"Etat des feux avant/arriéreD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat des feux avant/arriéreD" THEN
                  BEGIN
                    "Etat des feux avant/arriéreB":=FALSE;
                    //"Etat des feux avant/arriéreA":=FALSE;
                    END
            end;
        }
        field(42;"Etat des pneusB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat des pneusB" THEN
                BEGIN
                    "Etat des pneusD":=FALSE;
                   // "Etat des pneusA":=FALSE;
                    END
            end;
        }
        field(43;"Etat des pneusD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat des pneusD" THEN
                  BEGIN
                    "Etat des pneusB":=FALSE;
                    //"Etat des pneusA":=FALSE;
                    END
            end;
        }
        field(44;"Circuit de suspensionsB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Circuit de suspensionsB" THEN
                BEGIN
                    "Circuit de suspensionsD":=FALSE;
                    //"Circuit de suspensionsA":=FALSE;
                    END
            end;
        }
        field(45;"Circuit de suspensionsD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Circuit de suspensionsD" THEN
                  BEGIN
                    "Circuit de suspensionsB":=FALSE;
                    //"Circuit de suspensionsA":=FALSE;
                    END
            end;
        }
        field(46;"Etat de transmissions/RotuleB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat de transmissions/RotuleB" THEN
                  BEGIN
                    "Etat de transmissions/RotuleD":=FALSE;
                    //"Etat de transmissions/RotuleA":=FALSE;
                    END
            end;
        }
        field(47;"Etat de transmissions/RotuleD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat de transmissions/RotuleD" THEN
                  BEGIN
                    "Etat de transmissions/RotuleB":=FALSE;
                    //"Etat de transmissions/RotuleA":=FALSE;
                    END
            end;
        }
        field(48;"Etat de fixation échappementB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat de fixation échappementB" THEN
                  BEGIN
                    "Etat de fixation échappementD":=FALSE;
                   // "Etat de fixation échappementA":=FALSE;
                    END
            end;
        }
        field(49;"Etat de fixation échappementD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat de fixation échappementD" THEN
                  BEGIN
                    "Etat de fixation échappementB":=FALSE;
                    //"Etat de fixation échappementA":=FALSE;
                    END
            end;
        }
        field(50;"Etanchéité / état des grainesB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etanchéité / état des grainesB" THEN
                BEGIN
                    "Etanchéité / état des grainesD":=FALSE;
                    //"Etanchéité / état des grainesA":=FALSE;
                    END
            end;
        }
        field(51;"Etanchéité / état des grainesD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etanchéité / état des grainesD" THEN
                  BEGIN
                    "Etanchéité / état des grainesB":=FALSE;
                    //"Etanchéité / état des grainesA":=FALSE;
                    END
            end;
        }
        field(52;"Etat disques et plaquettesB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat disques et plaquettesB" THEN
                BEGIN
                    "Etat disques et plaquettesD":=FALSE;
                    //"Etat disques et plaquettesA":=FALSE;
                    END
            end;
        }
        field(53;"Etat disques et plaquettesD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat disques et plaquettesD" THEN
                  BEGIN
                    "Etat disques et plaquettesB":=FALSE;
                    //"Etat disques et plaquettesA":=FALSE;
                    END
            end;
        }
        field(54;"Huile moteurB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Huile moteurB" THEN
                BEGIN
                    "Huile moteurD":=FALSE;
                   // "Huile moteurA":=FALSE;
                    END
            end;
        }
        field(55;"Huile moteurD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Huile moteurD" THEN
                  BEGIN
                    "Huile moteurB":=FALSE;
                    //"Huile moteurA":=FALSE;
                    END
            end;
        }
        field(56;"Liquide de refroidissementB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Liquide de refroidissementB" THEN
                BEGIN
                    "Liquide de refroidissementD":=FALSE;
                    //"Liquide de refroidissementA":=FALSE;
                    END
            end;
        }
        field(57;"Liquide de refroidissementD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Liquide de refroidissementD" THEN
                  BEGIN
                    "Liquide de refroidissementB":=FALSE;
                   // "Liquide de refroidissementA":=FALSE;
                    END
            end;
        }
        field(58;"Liquide freins ou LHM ou LDSB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Liquide freins ou LHM ou LDSB" THEN
                BEGIN
                    "Liquide freins ou LHM ou LDSD":=FALSE;
                    //"Liquide freins ou LHM ou LDSA":=FALSE;
                    END
            end;
        }
        field(59;"Liquide freins ou LHM ou LDSD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Liquide freins ou LHM ou LDSD" THEN
                  BEGIN
                    "Liquide freins ou LHM ou LDSB":=FALSE;
                    //"Liquide freins ou LHM ou LDSA":=FALSE;
                    END
            end;
        }
        field(60;"Liquide  de directionB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Liquide  de directionB" THEN
                BEGIN
                    "Liquide  de directionD":=FALSE;
                    //"Liquide  de directionA":=FALSE;
                    END
            end;
        }
        field(61;"Liquide  de directionD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Liquide  de directionD" THEN
                  BEGIN
                    "Liquide  de directionB":=FALSE;
                    //"Liquide  de directionA":=FALSE;
                    END
            end;
        }
        field(62;"Etat de batterieB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Etat de batterieB" THEN
                BEGIN
                  "Etat de batterieD":=FALSE;
                  //"Etat de batterieA":=FALSE;
                    END
            end;
        }
        field(63;"Etat de batterieD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat de batterieD" THEN
                  BEGIN
                  "Etat de batterieB":=FALSE;
                  //"Etat de batterieA":=FALSE;
                    END
            end;
        }
        field(64;"Pré-Contôle TechniqueB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Pré-Contôle TechniqueB" THEN
                BEGIN
                    "Pré-Contôle TechniqueD":=FALSE;
                    //"Pré-Contôle TechniqueA":=FALSE;
                    END
            end;
        }
        field(65;"Pré-Contôle TechniqueD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Pré-Contôle TechniqueD" THEN
                  BEGIN
                    "Pré-Contôle TechniqueB":=FALSE;
                    //"Pré-Contôle TechniqueA":=FALSE;
                    END
            end;
        }
        field(66;"Bilan ClimatisationB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Bilan ClimatisationB" THEN
                  BEGIN
                  "Bilan ClimatisationD":=FALSE;
                  //"Bilan ClimatisationA":=FALSE;
                    END
            end;
        }
        field(67;"Bilan ClimatisationD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Bilan ClimatisationD" THEN
                  BEGIN
                  "Bilan ClimatisationB":=FALSE;
                  //"Bilan ClimatisationA":=FALSE;
                    END
            end;
        }
        field(68;"Réparation pare-briseB";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Réparation pare-briseB" THEN
                BEGIN
                  "Réparation pare-briseD":=FALSE;
                  //"Réparation pare-briseA":=FALSE;
                    END
            end;
        }
        field(69;"Réparation pare-briseD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Réparation pare-briseD" THEN
                  BEGIN
                  "Réparation pare-briseB":=FALSE;
                  //"Réparation pare-briseA":=FALSE;
                    END
            end;
        }
        field(70;"Même incident(retour atelier)B";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Même incident(retour atelier)B" THEN
                 BEGIN
                    "Même incident(retour atelier)D":=FALSE;
                    //"Même incident(retour atelier)A":=FALSE;
                    END
            end;
        }
        field(71;"Même incident(retour atelier)D";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Même incident(retour atelier)D" THEN
                  BEGIN
                    "Même incident(retour atelier)B":=FALSE;
                    //"Même incident(retour atelier)A":=FALSE;
                    END
            end;
        }
        field(72;"Existence compagne(s) rappelB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Existence compagne(s) rappelB" THEN
                BEGIN
                  VALIDATE("Existence compagne(s) rappelD",FALSE);
                  //"Existence compagne(s) rappelA":=FALSE;
                  END
                ELSE BEGIN
                  "Compagne de rappel 1":='';
                  "Compagne de rappel 2":='';
                  "Compagne de rappel 3":='';
                END
            end;
        }
        field(73;"Existence compagne(s) rappelD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Existence compagne(s) rappelD" THEN
                  BEGIN
                  VALIDATE("Existence compagne(s) rappelB",FALSE);
                  "Compagne de rappel 1":='';
                  "Compagne de rappel 2":='';
                  "Compagne de rappel 3":='';
                  //"Existence compagne(s) rappelA":=FALSE;
                  END
            end;
        }
        field(74;"Fiche incident clientB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Fiche incident clientB" THEN
                  BEGIN
                  "Fiche incident clientD":=FALSE;
                  //"Fiche incident clientA":=FALSE;
                  END
            end;
        }
        field(75;"Fiche incident clientD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Fiche incident clientD" THEN
                  BEGIN
                  "Fiche incident clientB":=FALSE;
                  //"Fiche incident clientA":=FALSE;
                  END
            end;
        }
        field(76;"Essai routier avec le clientB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Essai routier avec le clientB" THEN
                BEGIN
                  "Essai routier avec le clientD":=FALSE;
                  //"Essai routier avec le clientA":=FALSE;
                  END
            end;
        }
        field(78;"Essai routier avec le clientD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Essai routier avec le clientD" THEN
                  BEGIN
                  "Essai routier avec le clientB":=FALSE;
                  //"Essai routier avec le clientA":=FALSE;
                  END
            end;
        }
        field(79;"Photo expertiseB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Photo expertiseB" THEN
                  BEGIN
                  "Photo expertiseD":=FALSE;
                  //"Photo expertiseA":=FALSE;
                  END
            end;
        }
        field(80;GiletB;Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF GiletB THEN
                BEGIN
                 "Kit de dépannage provisoireB" :=FALSE;
                  END
            end;
        }
        field(81;GiletD;Boolean)
        {

            trigger OnValidate();
            begin
                IF GiletD THEN
                  BEGIN
                    GiletB:=FALSE;
                   // GiletA:=FALSE;
                  END
            end;
        }
        field(82;TriangleB;Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF TriangleB THEN
                  BEGIN
                     "Roue se secoursA":=FALSE;
                  END
            end;
        }
        field(83;TriangleD;Boolean)
        {

            trigger OnValidate();
            begin
                IF TriangleD THEN
                  BEGIN
                     TriangleB:=FALSE;
                   //  TriangleA:=FALSE;
                  END
            end;
        }
        field(84;"Kit de dépannage provisoireB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Kit de dépannage provisoireB" THEN
                 BEGIN
                    GiletB:=FALSE;
                  END
            end;
        }
        field(85;"Kit de dépannage provisoireD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Kit de dépannage provisoireD" THEN
                  BEGIN
                    "Kit de dépannage provisoireB":=FALSE;
                    //"Kit de dépannage provisoireA":=FALSE;
                  END
            end;
        }
        field(86;"Ecrou antivolB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Ecrou antivolB" THEN
                  BEGIN
                  "Ecrou antivolD":=FALSE;
                  //"Ecrou antivolA":=FALSE;
                  END
            end;
        }
        field(87;"Ecrou antivolD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Ecrou antivolD" THEN
                  BEGIN
                  "Ecrou antivolB":=FALSE;
                  //"Ecrou antivolA":=FALSE;
                  END
            end;
        }
        field(88;"CD/SD Card NAV.B";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "CD/SD Card NAV.B" THEN
                 BEGIN
                  "CD/SD Card NAV.D":=FALSE;
                  //"CD/SD Card NAV.A":=FALSE
                  END
            end;
        }
        field(89;"CD/SD Card NAV.D";Boolean)
        {

            trigger OnValidate();
            begin
                IF "CD/SD Card NAV.D" THEN
                  BEGIN
                  "CD/SD Card NAV.B":=FALSE;
                  //"CD/SD Card NAV.A":=FALSE
                  END
            end;
        }
        field(90;"Carnet d'entretienB";Boolean)
        {
            InitValue = false;

            trigger OnValidate();
            begin
                IF "Carnet d'entretienB" THEN
                "Carnet d'entretienD":=FALSE;
            end;
        }
        field(91;"Carnet d'entretienD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Carnet d'entretienD" THEN
                "Carnet d'entretienB":=FALSE;
            end;
        }
        field(92;"Photo expertiseD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Photo expertiseD" THEN
                  BEGIN
                  "Photo expertiseB":=FALSE;
                  //"Photo expertiseA":=FALSE;
                  END
            end;
        }
        field(93;"origine pieceD";Boolean)
        {

            trigger OnValidate();
            begin
                IF "origine pieceD" THEN
                  BEGIN
                  "origine piece":=FALSE;
                  //"origine pieceA":=FALSE;
                  END
            end;
        }
        field(94;"Image Fuel Gauge";BLOB)
        {
            SubType = Bitmap;
        }
        field(95;Commentaire;Text[250])
        {
        }
        field(96;"Reception No";Code[20])
        {
            TableRelation = "Reception SAV"."Reception No";
        }
        field(97;"Etat du vitre et parrebriseA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat du vitre et parrebriseA" THEN
                  BEGIN
                    "Etat des plaques de policeA":=FALSE;
                    END
            end;
        }
        field(98;"Etat carrosserie et peinture A";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat carrosserie et peinture A" THEN
                  BEGIN
                "Etat des feux avant arriereA":=FALSE;
                END
            end;
        }
        field(99;"Etat des feux avant arriereA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat des feux avant arriereA" THEN
                  BEGIN
                    "Etat carrosserie et peinture A":=FALSE;
                    END
            end;
        }
        field(100;"Etat des balais essuie-glaceA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat des balais essuie-glaceA" THEN
                  BEGIN
                  "Etat des pneus A":=FALSE;
                  END
            end;
        }
        field(101;"Etat des pneus A";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat des pneus A" THEN
                  BEGIN
                    "Etat des balais essuie-glaceA":=FALSE;
                    END
            end;
        }
        field(102;"Roue se secoursA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Roue se secoursA" THEN
                  BEGIN
                    TriangleB:=FALSE;
                    END
            end;
        }
        field(103;"Cric et manivelleA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Cric et manivelleA" THEN
                  BEGIN
                    "Cric et manivelleB":=FALSE;
                    "Cric et manivelleD":=FALSE;
                    END
                    */

            end;
        }
        field(104;"Allume CigareA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Allume CigareA" THEN
                  BEGIN
                    "Allume CigareB":=FALSE;
                    "Allume CigareD":=FALSE;
                    END
                    */

            end;
        }
        field(105;ExtincteurA;Boolean)
        {

            trigger OnValidate();
            begin
                /*IF ExtincteurA THEN
                  BEGIN
                    ExtincteurB:=FALSE;
                    ExtincteurD:=FALSE;
                    END
                    */

            end;
        }
        field(106;"Boite pharmacieA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Boite pharmacieA" THEN
                  BEGIN
                  "Boite pharmacieB":=FALSE;
                  "Boite pharmacieD":=FALSE;
                  END
                  */

            end;
        }
        field(107;"Poste radioA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Poste radioA" THEN
                  BEGIN
                    "Poste radioB":=FALSE;
                    "Poste radioD":=FALSE;
                    END
                    */

            end;
        }
        field(108;"Papier vehiculeA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Papier vehiculeA" THEN
                  BEGIN
                    "Papier vehiculeB":=FALSE;
                    "Papier vehiculeD":=FALSE;
                    END
                    */

            end;
        }
        field(109;"Lumineux Tableau de boradA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Lumineux Tableau de boradA" THEN
                  BEGIN
                    "Lumineux Tableau de boradB":=FALSE;
                    "Lumineux Tableau de boradD" :=FALSE
                    END
                    */

            end;
        }
        field(110;"Etat des plaques de policeA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat des plaques de policeA" THEN
                  BEGIN
                    "Etat du vitre et parrebriseA":=FALSE;
                    END
            end;
        }
        field(111;"Etat des feux avant/arriéreA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Etat des feux avant/arriéreA" THEN
                  BEGIN
                    "Etat des feux avant/arriéreB":=FALSE;
                    "Etat des feux avant/arriéreD":=FALSE;
                    END
                    */

            end;
        }
        field(112;"Etat des pneusA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Etat des pneus A" THEN
                  BEGIN
                  "Etat des pneusB" :=FALSE;
                  "Etat des pneusD":=FALSE;
                  END
                  */

            end;
        }
        field(113;"Circuit de suspensionsA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Circuit de suspensionsA" THEN
                  BEGIN
                    "Etat de transmissions/RotuleA":=FALSE;
                    END
            end;
        }
        field(114;"Etat de transmissions/RotuleA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat de transmissions/RotuleA" THEN
                  BEGIN
                    "Circuit de suspensionsA":=FALSE;
                    END
            end;
        }
        field(115;"Etat de fixation échappementA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat de fixation échappementA" THEN
                  BEGIN
                  "Etanchéité / état des grainesA" :=FALSE;
                  END
            end;
        }
        field(116;"Etanchéité / état des grainesA";Boolean)
        {

            trigger OnValidate();
            begin
                 IF "Etanchéité / état des grainesA" THEN
                  BEGIN
                    "Etat de fixation échappementA":=FALSE;
                    END
            end;
        }
        field(117;"Etat disques et plaquettesA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat disques et plaquettesA" THEN
                  BEGIN
                    "Huile moteurA":=FALSE;
                    END
            end;
        }
        field(118;"Huile moteurA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Huile moteurA" THEN
                  BEGIN
                    "Etat disques et plaquettesA":=FALSE;
                    END
            end;
        }
        field(119;"Liquide de refroidissementA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Liquide de refroidissementA" THEN
                  BEGIN
                    "Liquide freins ou LHM ou LDSA":=FALSE;
                    END
            end;
        }
        field(120;"Liquide freins ou LHM ou LDSA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Liquide freins ou LHM ou LDSA" THEN
                  BEGIN
                    "Liquide de refroidissementA":=FALSE;
                    END
            end;
        }
        field(121;"Liquide  de directionA";Boolean)
        {

            trigger OnValidate();
            begin
                IF  "Liquide  de directionA" THEN
                  BEGIN
                    "Etat de batterieA":=FALSE;
                    END
            end;
        }
        field(122;"Etat de batterieA";Boolean)
        {

            trigger OnValidate();
            begin
                IF "Etat de batterieA" THEN
                  BEGIN
                  "Liquide  de directionA" :=FALSE;
                  END
            end;
        }
        field(123;"Pré-Contôle TechniqueA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Pré-Contôle TechniqueA" THEN
                  BEGIN
                    "Pré-Contôle TechniqueB":=FALSE;
                    "Pré-Contôle TechniqueD":=FALSE;
                    END
                    */

            end;
        }
        field(124;"Bilan ClimatisationA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Bilan ClimatisationA" THEN
                  BEGIN
                    "Bilan ClimatisationB":=FALSE;
                    "Bilan ClimatisationD":=FALSE;
                    END
                    */

            end;
        }
        field(125;"Réparation pare-briseA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Réparation pare-briseA" THEN
                  BEGIN
                    "Réparation pare-briseB":=FALSE;
                    "Réparation pare-briseD":=FALSE;
                    END
                    */

            end;
        }
        field(126;"Même incident(retour atelier)A";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Même incident(retour atelier)A" THEN
                  BEGIN
                    "Même incident(retour atelier)B":=FALSE;
                    "Même incident(retour atelier)D":=FALSE;
                    END
                    */

            end;
        }
        field(127;"Existence compagne(s) rappelA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Existence compagne(s) rappelA" THEN
                  BEGIN
                    "Existence compagne(s) rappelB":=FALSE;
                    "Existence compagne(s) rappelD":=FALSE;
                    END
                    */

            end;
        }
        field(128;"Fiche incident clientA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Fiche incident clientA" THEN
                  BEGIN
                    "Fiche incident clientB":=FALSE;
                    "Fiche incident clientD":=FALSE;
                    END
                    */

            end;
        }
        field(129;"Essai routier avec le clientA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Essai routier avec le clientA" THEN
                  BEGIN
                    "Essai routier avec le clientB":=FALSE;
                    "Essai routier avec le clientD":=FALSE;
                    END
                    */

            end;
        }
        field(130;GiletA;Boolean)
        {

            trigger OnValidate();
            begin
                /*IF GiletA THEN
                  BEGIN
                    GiletB:=FALSE;
                    GiletD:=FALSE;
                    END
                    */

            end;
        }
        field(131;TriangleA;Boolean)
        {

            trigger OnValidate();
            begin
                /*IF TriangleA THEN
                  BEGIN
                    TriangleB:=FALSE;
                    TriangleD:=FALSE;
                    END
                    */

            end;
        }
        field(132;"Kit de dépannage provisoireA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Kit de dépannage provisoireA" THEN
                  BEGIN
                    "Kit de dépannage provisoireB" :=FALSE;
                    "Kit de dépannage provisoireD":=FALSE;
                    END
                    */

            end;
        }
        field(133;"Ecrou antivolA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Ecrou antivolA" THEN
                  BEGIN
                    "Ecrou antivolB":=FALSE;
                    "Ecrou antivolD":=FALSE;
                    END
                    */

            end;
        }
        field(134;"CD/SD Card NAV.A";Boolean)
        {

            trigger OnValidate();
            begin
                /*
                IF "CD/SD Card NAV.A" THEN
                  BEGIN
                    "CD/SD Card NAV.B":=FALSE;
                    "CD/SD Card NAV.D":=FALSE;
                    END
                    */

            end;
        }
        field(135;"Carnet d'entretienA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Carnet d'entretienA" THEN
                  BEGIN
                    "Carnet d'entretienB":=FALSE;
                    "Carnet d'entretienD":=FALSE;
                    END
                    */

            end;
        }
        field(136;"Photo expertiseA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "Photo expertiseA" THEN
                  BEGIN
                    "Photo expertiseB":=FALSE;
                    "Photo expertiseD":=FALSE
                    END
                    */

            end;
        }
        field(137;"origine pieceA";Boolean)
        {

            trigger OnValidate();
            begin
                /*IF "origine pieceA"THEN
                  BEGIN
                  "origine piece":=FALSE;
                  "origine pieceD":=FALSE;
                  END
                  */

            end;
        }
        field(138;"Compagne de rappel 1";Text[3])
        {

            trigger OnValidate();
            begin
                IF ("Compagne de rappel 1"<>'')THEN
                  IF NOT FunctionCompaignUnicity("Compagne de rappel 1",'***',"Compagne de rappel 3") OR (NOT FunctionCompaignUnicity("Compagne de rappel 1","Compagne de rappel 2",'***')) THEN
                    ERROR('Nom de compagne déjà utilisé pour ce véhicule')
            end;
        }
        field(139;VIN;Code[20])
        {
            CalcFormula = Lookup("Reception SAV".VIN WHERE (Reception No=FIELD(Id)));
            FieldClass = FlowField;
        }
        field(140;"Ancien kilométrage";Integer)
        {
            Description = 'KT 29032017 besoin changer kilométrage après réparation afficheur';
            Editable = false;
        }
        field(141;"Ancienne Remarque";Text[250])
        {
        }
        field(142;"Compagne de rappel 2";Text[3])
        {

            trigger OnValidate();
            begin
                IF  ("Compagne de rappel 2"<>'') THEN
                  IF (NOT FunctionCompaignUnicity("Compagne de rappel 1","Compagne de rappel 2",'***'))OR (NOT FunctionCompaignUnicity("Compagne de rappel 1","Compagne de rappel 3",'***')) THEN
                    ERROR('Nom de compagne déjà utilisé pour ce véhicule')
            end;
        }
        field(143;"Compagne de rappel 3";Text[3])
        {

            trigger OnValidate();
            begin
                IF ("Compagne de rappel 3"<>'')  THEN
                  IF (NOT FunctionCompaignUnicity('***',"Compagne de rappel 2","Compagne de rappel 3"))OR (NOT FunctionCompaignUnicity("Compagne de rappel 1","Compagne de rappel 3",'***')) THEN
                    ERROR('Nom de compagne déjà utilisé pour ce véhicule')
            end;
        }
        field(144;"Visite 1";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(145;"Visite 2";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(146;"Visite 3";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(147;"Visite 4";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(148;visitebsbY;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(149;visitebsbN;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(150;GarantieY;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(151;GarantieN;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(152;NomAgence;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(153;RDVY;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(154;RDVN;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(155;"Compagnie D'assurance";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(156;"Autre Acc";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(157;"Autre Etat";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(158;"Autre Fonct";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(159;AvecRDV;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(160;SansRDV;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(161;Carburant000;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(162;Carburant025;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(163;Carburant005;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(164;Carburant075;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(165;Carburant001;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Id)
        {
        }
        key(Key2;Kilometrage)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Cree par":=USERID;
    end;

    trigger OnModify();
    begin
        //HH
        // IF (UserSetup.GET(USERID)) AND (Kilometrage <> xRec.Kilometrage) AND (UserSetup."Directeur Technique")  THEN
        //  ERROR(KiliometrageErr);

    end;

    var
        ERROR0001 : Label 'Le kilométrage ne peut être modifié qu''une seule fois';
        ReceptionSAV : Record "60008";
        GIntKilometrage : Integer;
        UserSetup : Record "91";
        KiliometrageErr : Label 'Vous n''avez pas le droit !';

    local procedure FunctionCompaignUnicity(Text1 : Text[3];text2 : Text[3];text3 : Text[3]) : Boolean;
    begin
        IF (UPPERCASE(Text1)<>UPPERCASE(text2) ) AND(UPPERCASE(Text1)<>UPPERCASE(text3)) AND (UPPERCASE(text2)<>UPPERCASE(text3))  THEN
          EXIT(TRUE)
        ELSE
          EXIT(FALSE);
    end;
}

