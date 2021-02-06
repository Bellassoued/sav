table 50112 "Voiture Populaire VPP"
{
    // version W H VPP

    // IF Séquence = '' THEN
    // BEGIN
    //   SalesSetup.GET;
    //   SalesSetup.TESTFIELD("Souche Fiche Assurance");
    //   NoSeriesMgt.InitSeries(SalesSetup."Souche Fiche Assurance",xRec."No. Series",0D,Séquence,"No. Series");
    // END;


    fields
    {
        field(1;"N° Séquence";Code[20])
        {
        }
        field(2;"N° de Reservation";Code[20])
        {
        }
        field(3;Statut;Option)
        {
            OptionMembers = " ",Confirmer;
        }
        field(4;Nom;Code[50])
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE  THEN
                      BEGIN
                        IF Statut = 1 THEN
                         ERROR(Text00001);
                      END
                   END
            end;
        }
        field(5;"Prénom";Text[50])
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                      IF UserSetup.VoiturePopulaire = FALSE  THEN
                        BEGIN
                          IF Statut = 1 THEN
                           ERROR(Text00001);
                        END
                  END
            end;
        }
        field(6;"N° CIN";Code[8])
        {

            trigger OnValidate();
            begin
                IF "N° CIN" <> '' THEN
                  IF STRLEN("N° CIN") <> 8 THEN
                    ERROR('La longeur du numéro CIN doit être 8 ! ');

                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                      IF UserSetup.VoiturePopulaire = FALSE  THEN
                        BEGIN
                          IF Statut = 1 THEN
                           ERROR(Text00001);
                        END
                   END;

                CLEAR(VoiturePopulaireVPP);
                VoiturePopulaireVPP.SETFILTER(VoiturePopulaireVPP."N° CIN",'%1',"N° CIN");
                VoiturePopulaireVPP.SETFILTER(VoiturePopulaireVPP."N° Séquence" ,'<>%1', "N° Séquence");
                IF VoiturePopulaireVPP.FIND('-') THEN
                  IF VoiturePopulaireVPP."N° CIN" <>'' THEN
                    ERROR('N° de Carte identité existe déja, N° de séquence est : %1',VoiturePopulaireVPP."N° Séquence");
            end;
        }
        field(7;"Date d'inscription";Date)
        {
        }
        field(8;"DateT Inscription";DateTime)
        {
        }
        field(9;Profission;Text[250])
        {
        }
        field(10;"Etat Civil";Option)
        {
            OptionMembers = " ","Célibataire","Marié",Veuf,"Divorcé";
        }
        field(11;Adresse;Text[250])
        {
        }
        field(12;"Nom Conjoint";Code[50])
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                      IF UserSetup.VoiturePopulaire = FALSE  THEN
                        BEGIN
                          IF Statut = 1 THEN
                           ERROR(Text00001);
                        END
                   END
            end;
        }
        field(13;"N° CIN Conjoint";Code[8])
        {

            trigger OnValidate();
            begin
                CLEAR(VoiturePopulaireVPP);
                VoiturePopulaireVPP.SETFILTER(VoiturePopulaireVPP."N° CIN Conjoint",'%1',"N° CIN Conjoint");
                VoiturePopulaireVPP.SETFILTER(VoiturePopulaireVPP."N° Séquence" ,'<>%1', "N° Séquence");
                IF VoiturePopulaireVPP.FIND('-') THEN
                  IF VoiturePopulaireVPP."N° CIN" <>'' THEN
                   MESSAGE('N° de Carte identité existe déja, N° de séquence est : %1',VoiturePopulaireVPP."N° Séquence");
            end;
        }
        field(14;"Profission du conjoint";Text[250])
        {
        }
        field(15;"Code Postal";Code[10])
        {
            TableRelation = "Post Code";
        }
        field(16;"N° Téléphone";Code[8])
        {
        }
        field(17;"N° de Fax";Code[8])
        {
        }
        field(18;"Adresse Mail";Text[250])
        {
        }
        field(19;"Prénon Conjoint";Text[100])
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                      IF UserSetup.VoiturePopulaire = FALSE  THEN
                        BEGIN
                          IF Statut = 1 THEN
                           ERROR(Text00001);
                        END
                   END
            end;
        }
        field(20;"Date Démission de Bordereau";Date)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                      IF UserSetup.VoiturePopulaire = FALSE  THEN
                        BEGIN
                          IF Statut = 1 THEN
                           ERROR(Text00001);
                        END
                  END
            end;
        }
        field(21;"N° d'Autorisation";Code[10])
        {
        }
        field(22;"Motif Rejet";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                 END
            end;
        }
        field(23;"Attestation de travail";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                      IF UserSetup.VoiturePopulaire = FALSE THEN
                        ERROR(Text00001);
                  END;
                "D date Attestation de travail" :=  CURRENTDATETIME;
                "User Attestation de travail" := USERID;
            end;
        }
        field(24;"Photocopie C.I.N";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                      IF UserSetup.VoiturePopulaire = FALSE THEN
                        ERROR(Text00001);
                  END;
                "D date Photocopie C.I.N" := CURRENTDATETIME;
                "User Photocopie C.I.N" := USERID;
            end;
        }
        field(25;"Photocopie C.I.N Conjoint";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                      IF UserSetup.VoiturePopulaire = FALSE THEN
                        ERROR(Text00001);
                   END;
                "D date Photocopie C.I.N Conj" :=  CURRENTDATETIME;
                "User Photocopie C.I.N Conj"   :=  USERID;
            end;
        }
        field(26;"Quittance des Impôts";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                   END;
                "D date Quittance des Impôts" :=  CURRENTDATETIME;
                "User Quittance des Impôts"   :=  USERID;
            end;
        }
        field(27;"Extrait de naissance(célib.)";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END;
                "D date Ext de naissance" :=  CURRENTDATETIME;
                "User Ext de naissance"   :=  USERID;
            end;
        }
        field(28;"Code vendeur";Code[20])
        {
            TableRelation = Salesperson/Purchaser;

            trigger OnValidate();
            begin
                CLEAR(SalespersonPurchaser);
                SalespersonPurchaser.SETRANGE(SalespersonPurchaser.Code,"Code vendeur");
                IF SalespersonPurchaser.FIND('-') THEN
                   BEGIN
                      "Nom Prénom Vendeur" := SalespersonPurchaser.Name;
                   END;
            end;
        }
        field(29;"Nom Prénom Vendeur";Code[100])
        {
        }
        field(30;"N° Téléphone 2";Code[8])
        {
        }
        field(31;"Créer par";Code[100])
        {
        }
        field(32;"Date Création";DateTime)
        {
        }
        field(33;"Confirmation Reser.par";Code[100])
        {
        }
        field(34;"Date confirmation";DateTime)
        {
        }
        field(35;"No. Series";Code[20])
        {
        }
        field(36;"No. Reservation";Code[20])
        {
        }
        field(37;Recommandation;Text[250])
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE  THEN
                      BEGIN
                        IF Statut = 1 THEN
                         ERROR(Text00001);
                      END
                  END
            end;
        }
        field(38;"Quittance des Impôts Conjoint";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END;
                 "D d Quittance Impôts Conj" := CURRENTDATETIME;
                  "User Quittance Impôts Conj"   := USERID;
            end;
        }
        field(39;"Déscription Rejet";Text[250])
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END
            end;
        }
        field(40;"Date d'Autorisation";Date)
        {
        }
        field(41;"Attestation de travail conjoin";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END;
                "D date Att travail conjoin" := CURRENTDATETIME;
                "User Att travail conjoin"   := USERID;
            end;
        }
        field(42;Patente;Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END;

                "D date Patente":= CURRENTDATETIME;
                "User Patente"  := USERID;
            end;
        }
        field(43;"Patente conjoint";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END;

                "D date Patente conjoint":= CURRENTDATETIME;
                "User Patente conjoint"  := USERID;
            end;
        }
        field(44;"Déclaration d'impôt";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END;
                "D date Déclaration d'impôt" := CURRENTDATETIME;
                "User Déclaration d'impôt"   := USERID;
            end;
        }
        field(45;"Déclaration d'impôt conjoint";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END;
                "D date Déclar impôt conj" := CURRENTDATETIME;
                "User Déclar impôt conj"   := USERID;
            end;
        }
        field(46;"Retenu à la source";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END;
                "D date Retenu à la source":= CURRENTDATETIME;
                "User Retenu à la source"  := USERID;
            end;
        }
        field(47;"Retenu à la source conjoit";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                   END;

                "D date RTà la source conjoint" := CURRENTDATETIME;
                "User RTà la source conjoint"   := USERID;
            end;
        }
        field(48;"Extrait de naissance conjoint";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                      IF UserSetup.VoiturePopulaire = FALSE THEN
                        ERROR(Text00001);
                  END;
                "D date Ext naissance conj":= CURRENTDATETIME;
                "User Ext naissance conj"  := USERID;
            end;
        }
        field(49;"Décl d'honneur pas travailler";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END;
                "D date Décl d'honneur pas trav":= CURRENTDATETIME;
                "User Décl d'honneur pas trav"  := USERID;
            end;
        }
        field(50;"Décl d'honneur pas trav conjoi";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                      IF UserSetup.VoiturePopulaire = FALSE THEN
                        ERROR(Text00001);
                  END;
                "D date Décl HN pas trav conjoi":= CURRENTDATETIME;
                "User Décl HN pas trav conjoi"  := USERID;
            end;
        }
        field(51;"Dossier Complet";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(UserSetup);
                UserSetup.SETRANGE(UserSetup."User ID",USERID);
                IF UserSetup.FIND('-') THEN
                  BEGIN
                    IF UserSetup.VoiturePopulaire = FALSE THEN
                      ERROR(Text00001);
                  END;
                "D date Dossier Complet":= CURRENTDATETIME;
                "User Dossier Complet"  := USERID;
            end;
        }
        field(52;"Vente Confirmée";Boolean)
        {

            trigger OnValidate();
            begin
                TESTFIELD("N° d'Autorisation");
                "D d Vente Confirmer" := CURRENTDATETIME;

                "User Vente Confirmer":= USERID;
            end;
        }
        field(53;"D date Att travail conjoin";DateTime)
        {
        }
        field(54;"D date Patente";DateTime)
        {
        }
        field(55;"D date Patente conjoint";DateTime)
        {
        }
        field(56;"D date Déclaration d'impôt";DateTime)
        {
        }
        field(57;"D date Déclar impôt conj";DateTime)
        {
        }
        field(58;"D date Retenu à la source";DateTime)
        {
        }
        field(59;"D date RTà la source conjoint";DateTime)
        {
        }
        field(60;"D date Ext naissance conj";DateTime)
        {
        }
        field(61;"D date Décl d'honneur pas trav";DateTime)
        {
        }
        field(62;"D date Décl HN pas trav conjoi";DateTime)
        {
        }
        field(63;"D date Attestation de travail";DateTime)
        {
        }
        field(64;"D date Photocopie C.I.N";DateTime)
        {
        }
        field(65;"D date Photocopie C.I.N Conj";DateTime)
        {
        }
        field(66;"D date Quittance des Impôts";DateTime)
        {
        }
        field(67;"D date Ext de naissance";DateTime)
        {
        }
        field(68;"User Att travail conjoin";Code[80])
        {
        }
        field(69;"User Patente";Code[80])
        {
        }
        field(70;"User Patente conjoint";Code[80])
        {
        }
        field(71;"User Déclaration d'impôt";Code[80])
        {
        }
        field(72;"User Déclar impôt conj";Code[80])
        {
        }
        field(73;"User Retenu à la source";Code[80])
        {
        }
        field(74;"User RTà la source conjoint";Code[80])
        {
        }
        field(75;"User Ext naissance conj";Code[80])
        {
        }
        field(76;"User Décl d'honneur pas trav";Code[80])
        {
        }
        field(77;"User Décl HN pas trav conjoi";Code[80])
        {
        }
        field(78;"User Attestation de travail";Code[80])
        {
        }
        field(79;"User Photocopie C.I.N";Code[80])
        {
        }
        field(80;"User Photocopie C.I.N Conj";Code[80])
        {
        }
        field(81;"User Quittance des Impôts";Code[80])
        {
        }
        field(82;"User Ext de naissance";Code[80])
        {
        }
        field(83;"D date Dossier Complet";DateTime)
        {
        }
        field(84;"User Dossier Complet";Code[80])
        {
        }
        field(85;"D d Vente Confirmer";DateTime)
        {
        }
        field(86;"User Vente Confirmer";Code[80])
        {
        }
        field(87;"D d Quittance Impôts Conj";DateTime)
        {
        }
        field(88;"User Quittance Impôts Conj";Code[80])
        {
        }
        field(89;"Type Origine";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Contact,Client;
        }
        field(90;"No. Origine";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                CASE "Type Origine" OF
                  "Type Origine"::Contact :
                      BEGIN
                        RecContact.GET("No. Origine");
                        Nom             := RecContact.Name;
                        "N° CIN"        := RecContact."No. CIN";
                        Adresse         := RecContact.Address;
                        "Code Postal"   := RecContact."Post Code";
                        "N° Téléphone"  := RecContact."Phone No.";
                        "N° de Fax"     := RecContact."Telex No.";
                        "Adresse Mail"  := RecContact."E-Mail";
                        "Code vendeur"  := RecContact."Salesperson Code";
                      END;
                  "Type Origine"::Client :
                      BEGIN
                        //
                        CustomerG.GET("No. Origine");
                        Nom             := CustomerG.Name;
                        "N° CIN"        := CustomerG."No. CIN";
                        Adresse         := CustomerG.Address;
                        "Code Postal"   := CustomerG."Post Code";
                        "N° Téléphone"  := CustomerG."Phone No.";
                        "N° de Fax"     := CustomerG."Telex No.";
                        "Adresse Mail"  := CustomerG."E-Mail";
                        "Code vendeur"  := CustomerG."Salesperson Code";
                      END;
                END;
            end;
        }
        field(91;"No. Bord Lié";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(92;"Statut Bord Lié";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"N° Séquence")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        CLEAR(UserSetup);
        UserSetup.SETRANGE(UserSetup."User ID",USERID);
        IF UserSetup.FIND('-') THEN
          BEGIN
            IF UserSetup.VoiturePopulaire = FALSE THEN
              ERROR(Text00001);
          END
    end;

    trigger OnInsert();
    begin
        IF "N° Séquence" = '' THEN
        BEGIN
          SalesSetup.GET;
          SalesSetup.TESTFIELD("Souche Fiche Inscription VPP");
          NoSeriesMgt.InitSeries(SalesSetup."Souche Fiche Inscription VPP",xRec."No. Series",0D,"N° Séquence","No. Series");
        END;
        "Créer par" := USERID;
        "Date Création" := CURRENTDATETIME;


        UserSetup.GET(USERID);
        "Code vendeur" := UserSetup."Salespers./Purch. Code";
    end;

    var
        SalespersonPurchaser : Record "13";
        SalesSetup : Record "311";
        NoSeriesMgt : Codeunit "396";
        UserSetup : Record "91";
        Text00001 : TextConst ENU='Action non autorisée ! Veuillez contacter votre administrateur !',FRA='Vous n''avez pas le droit de modifier cet écran ! veuillez contacter votre administrateur système !';
        VoiturePopulaireVPP : Record "50112";
        RecContact : Record "5050";
        CustomerG : Record "18";
}

