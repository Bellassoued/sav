table 50114 "Facture En supension TVA"
{
    // version DEC_FAC_SUS_TVA


    fields
    {
        field(1;DF00;Text[2])
        {
        }
        field(2;DF01;Code[7])
        {
        }
        field(3;DF02;Text[1])
        {
        }
        field(4;DF03;Text[1])
        {
        }
        field(5;DF04;Code[3])
        {
        }
        field(6;DF05;Code[4])
        {
        }
        field(7;DF06;Option)
        {
            OptionCaption = '" ,T1,T2,T3,T4"';
            OptionMembers = " ",T1,T2,T3,T4;
        }
        field(8;DF07;Code[6])
        {
        }
        field(9;DF08;Text[20])
        {
        }
        field(10;DF09;Code[8])
        {
        }
        field(11;DF10;Code[1])
        {
        }
        field(12;DF11;Text[13])
        {
        }
        field(13;DF12;Text[50])
        {
        }
        field(14;DF13;Text[120])
        {

            trigger OnValidate();
            begin
                IF STRLEN(DF13)<>120 THEN
                BEGIN
                long:=120;

                DF13:=Longeur_alphaNumérique(texte1,long);

                END;
                MODIFY;
            end;
        }
        field(15;DF14;Text[20])
        {
        }
        field(16;DF15;Code[8])
        {
        }
        field(17;DF16;Code[15])
        {
        }
        field(18;DF17;Code[5])
        {
        }
        field(19;DF18;Code[15])
        {
        }
        field(20;DF19;Code[5])
        {
        }
        field(21;DF20;Code[15])
        {
        }
        field(22;DF21;Code[5])
        {
        }
        field(23;DF22;Code[15])
        {
        }
        field(24;Jour;Integer)
        {
        }
        field(25;Mois;Integer)
        {
        }
        field(26;"Année";Integer)
        {
        }
        field(27;Montant;Decimal)
        {
            DecimalPlaces = 3:3;

            trigger OnValidate();
            begin
                texte1:=FORMAT(Montant);
                texte1:=Suppresion_Vide(texte1);
                code1:=texte1;
                long:=15;
                DF16:=Longeur_Numérique(code1,long);
                MODIFY;
            end;
        }
        field(28;"Code client";Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate();
            begin



                REC18.GET("Code client");
                //DF01:=REC18."Matricule Fiscal";
                //HB LE 15/08/2012
                DF01:=Rec79."VAT Registration No.";
                //HB LE 15/08/2012 : Fin

                IF STRLEN(DF01)<>7 THEN
                BEGIN
                long:=7;
                DF01:=Longeur_Numérique(DF01,long);
                END;
                //DF02:=REC18."Clé du matricule fiscal";
                //HB LE 15/08/2012
                //TMP DF02:=Rec79."Clé du matricule fiscal";
                //HB LE 15/08/2012 : Fin

                IF STRLEN(DF02)<>1 THEN
                BEGIN
                long:=1;
                DF02:=Longeur_alphaNumérique(DF02,long);
                END;


                //DF03:=REC18."Catégortie contribuable";
                //HB LE 15/08/2012
                //TMP DF03:=Rec79."Catégortie contribuable";
                //HB LE 15/08/2012 : Fin

                IF STRLEN(DF03)<>1 THEN
                BEGIN
                long:=1;
                DF03:=Longeur_alphaNumérique(DF03,long);
                END;


                //DF04:=REC18."N° établissement secondaire";
                //HB LE 15/08/2012
                //TMP DF04:=Rec79."N° établissement secondaire";
                //HB LE 15/08/2012 : Fin

                IF STRLEN(DF04)<>3 THEN
                BEGIN
                long:=3;
                DF04:=Longeur_Numérique(DF04,long);
                END;


                //DF11:=REC18."No.";
                //HB LE 15/08/2012
                DF11:=REC18."VAT Registration No.";
                //HB LE 15/08/2012 : Fin

                IF STRLEN(DF11)<>13 THEN
                BEGIN
                long:=13;
                DF11:=Longeur_alphaNumérique(DF11,long);
                END;


                DF12:=REC18.Name+' '+REC18."Name 2";

                IF STRLEN(DF12)<>40 THEN
                BEGIN
                long:=40;
                DF12:=Longeur_alphaNumérique(DF12,long);
                END;

                DF13:=REC18.Address+' '+REC18."Address 2";

                texte1:=REC18.Address+' '+REC18."Address 2";
                IF STRLEN(DF13)<>120 THEN
                BEGIN
                long:=120;

                DF13:=Longeur_alphaNumérique(texte1,long);

                END;




                //TMP DF14:=REC18."N° autorisation administrative";
                IF STRLEN(DF14)<>20 THEN
                BEGIN
                long:=20;
                DF14:=Longeur_alphaNumérique(DF14,long);
                END;

                j:=DATE2DMY(REC18."Date debut Autorisation Admin.",1);
                m:=DATE2DMY(REC18."Date debut Autorisation Admin.",2);
                a:=DATE2DMY(REC18."Date debut Autorisation Admin.",3);
                DF15:=CAL_Date(j,m,a);


                "Nom client":=REC18.Name;

                IF STRLEN("N° Facture")<>20 THEN
                BEGIN
                texte1:="N° Facture";
                long:=20;
                DF08:=Longeur_alphaNumérique(texte1,long);
                END;
                DF00:='DF';
                //DF10:='1';
                //HB LE 15/08/2012
                IF REC18."Country/Region Code" = 'TN' THEN
                   DF10:='1'
                ELSE
                   DF10:='3';
                //HB LE 15/08/2012 : Fin

                DF17:='00000';
                DF18:='000000000000000';
                DF19:='00000';
                DF20:='000000000000000';
                DF21:='00018';

                //HB LE 15/08/2012
                MontantTVA:=Montant*18/100;
                texte1:=FORMAT(MontantTVA);
                long:=15;
                DF22:= Longeur_alphaNumérique(texte1,long);
                //DF22:='000000000000000';
                //HB LE 15/08/2012 : Fin

                MODIFY;
            end;
        }
        field(29;"N° Facture";Code[20])
        {
            NotBlank = true;
        }
        field(30;"Nom client";Text[60])
        {
        }
        field(31;"Total Montant";Decimal)
        {
            CalcFormula = Sum("Facture En supension TVA".Montant);
            DecimalPlaces = 3:3;
            FieldClass = FlowField;
        }
        field(32;"Exporté";Boolean)
        {
        }
        field(33;Valider;Boolean)
        {
        }
        field(34;NumLigne;Integer)
        {
        }
        field(35;"Date Facture";Date)
        {

            trigger OnValidate();
            begin

                j:=DATE2DMY("Date Facture",1)  ;
                m:=DATE2DMY("Date Facture",2) ;
                a:=DATE2DMY("Date Facture",3);
                DF09:=CAL_Date(j,m,a);

                IF (m<=3) THEN
                DF06:=DF06::T1;

                IF (m>3)AND(m<=6) THEN
                DF06:=DF06::T2;

                IF (m>6)AND(m<=9) THEN
                DF06:=DF06::T3;
                IF (m>9)AND(m<=12) THEN
                DF06:=DF06::T4;
                DF05:=COPYSTR(DF09,5,4);
                n:=n+1;
                rec60246.SETRANGE(rec60246.DF06,DF06);
                rec60246.SETRANGE(rec60246.DF05,DF05);
                IF rec60246.FIND('-') THEN
                BEGIN
                REPEAT
                rec60246.NumLigne:=n;
                code1:=FORMAT(n);
                long:=6;
                rec60246.DF07:=Longeur_Numérique(code1,long);
                n:=n+1;
                rec60246.MODIFY;
                UNTIL rec60246.NEXT=0;
                NumLigne:=n;
                code1:=FORMAT(n);
                long:=6;
                DF07:=Longeur_Numérique(code1,long);

                END
                ELSE
                BEGIN
                NumLigne:=n;
                code1:=FORMAT(n);
                long:=6;
                DF07:=Longeur_Numérique(code1,long);

                END;

                MODIFY;
            end;
        }
        field(36;"Montant TVA";Decimal)
        {
        }
        field(37;"No. Bon de Commande";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Taux TVA";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(39;Adresse;Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"N° Facture")
        {
            SumIndexFields = Montant;
        }
        key(Key2;DF06)
        {
            SumIndexFields = Montant;
        }
    }

    fieldgroups
    {
    }

    var
        REC18 : Record "18";
        code1 : Code[15];
        texte1 : Text[300];
        long : Integer;
        j : Integer;
        m : Integer;
        a : Integer;
        rec60246 : Record "50114";
        n : Integer;
        Rec79 : Record "79";
        MontantTVA : Decimal;

    procedure CAL_Date(var j : Integer;var m : Integer;var a : Integer) date1 : Text[8];
    begin
        IF j<10 THEN
        date1:='0'+FORMAT(j)
        ELSE
        date1:=FORMAT(j);

        IF m<10 THEN
        date1:=date1+'0'+FORMAT(m)
        ELSE
        date1:=date1+FORMAT(m);

        date1:=date1+FORMAT(a);
    end;

    procedure "Longeur_Numérique"(var x : Code[15];var long : Integer) long_num : Code[15];
    begin
        IF STRLEN(x) < long THEN
        BEGIN
        long_num:=x;
        REPEAT
        long_num:='0'+long_num;
        UNTIL STRLEN(long_num)=long
        END;
    end;

    procedure "Longeur_alphaNumérique"(var y : Text[120];var long : Integer) long_al_num : Text[120];
    begin
        IF STRLEN(y)<long THEN
        BEGIN
        long_al_num:=y;
        //MESSAGE('%1',y);
        REPEAT
        long_al_num:=long_al_num+' ';
        UNTIL STRLEN(long_al_num)=long;
        END;
    end;

    procedure Suppresion_Vide(var texte1 : Text[15]) Valeur1 : Code[15];
    var
        text2 : Text[15];
        Long : Integer;
        i : Integer;
        j : Integer;
    begin
        i:=1;
        Long:=STRLEN(texte1);
        REPEAT
        IF (texte1[i]='1')OR(texte1[i]='2')OR(texte1[i]='3')OR(texte1[i]='4')OR(texte1[i]='5')OR(texte1[i]='6')OR(texte1[i]='7')
        OR(texte1[i]='8')OR(texte1[i]='9')OR(texte1[i]='0')  THEN
        BEGIN
        j:=j+1;
        text2[j]:=texte1[i];
        END;
        i:=i+1;
        UNTIL i=Long+1;
        Valeur1:=FORMAT(text2);
    end;
}

