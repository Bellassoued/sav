table 70004 "Caution"
{
    // version CT16V002.2


    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"No. appel d'offre";Code[100])
        {
        }
        field(3;"Date limite";Date)
        {
        }
        field(4;"Date création";Date)
        {
        }
        field(5;"Créer par";Code[30])
        {
        }
        field(6;"Client existe";Option)
        {
            OptionMembers = Oui,Non;
        }
        field(7;"Code client";Code[20])
        {
            TableRelation = IF (Client existe=CONST(Oui)) Customer;

            trigger OnValidate();
            begin
                IF "Client existe"="Client existe"::Oui THEN BEGIN
                  Customer.GET("Code client");
                  "Nom client"     := Customer.Name;
                  "Adresse client" := Customer.Address;
                  "Contact client" := Customer.Contact;

                END;
            end;
        }
        field(8;"Nom client";Text[150])
        {
        }
        field(9;"Adresse client";Text[50])
        {
        }
        field(10;"Contact client";Text[30])
        {
        }
        field(11;Statut;Option)
        {
            OptionCaption = 'Ouvert,Caution provisoir créée,caution définitif créée,caution retenue de garantie créée';
            OptionMembers = Ouvert,"Caution provisoir créée","caution définitif créée","caution retenue de garantie créée";
        }
        field(12;"No. Series";Code[20])
        {
        }
        field(13;"Activité client";Text[30])
        {
        }
        field(14;"Caution provisoire";Boolean)
        {
        }
        field(15;"Caution définitive";Boolean)
        {
        }
        field(16;"Caution retenue de garantie";Boolean)
        {
            Editable = false;
        }
        field(17;"No. Bord. Cau. Prov.";Code[20])
        {
            TableRelation = "Payment Header";
        }
        field(18;"No. Bord Cau. Def.";Code[20])
        {
            TableRelation = "Payment Header";
        }
        field(19;"No. Bord Cau. RG";Code[20])
        {
            Editable = false;
            TableRelation = "Payment Header";
        }
        field(20;"Code banque";Code[20])
        {
            TableRelation = "Bank Account".No.;
        }
        field(21;"Nbr. Jours Provisoir";Decimal)
        {

            trigger OnValidate();
            begin

                "Date limite" := "A partir de"+ "Nbr. Jours Provisoir";
            end;
        }
        field(22;"Avec Retenu Garantie";Boolean)
        {
        }
        field(23;Objet;Text[150])
        {
        }
        field(24;"% Mnt marché définitive";Decimal)
        {
        }
        field(25;"% Mnt marché Garantie";Decimal)
        {
        }
        field(26;"Montant marché";Decimal)
        {
        }
        field(27;"Date réception provisoire";Date)
        {
        }
        field(28;"Date réception définitive";Date)
        {
        }
        field(29;"A partir de";Date)
        {

            trigger OnValidate();
            begin
                "Date limite" := "A partir de"+ "Nbr. Jours Provisoir";
            end;
        }
        field(30;"Relatif à";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(31;"No. enregistrement";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"No. quitance";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Date quitance";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Nbr. Jours Définitif";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Nbr. Jours garantie";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Caution Fiscale";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Code Fournisseur";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor.No.;

            trigger OnValidate();
            begin

                  Vendor.GET("Code Fournisseur");
                  "Nom client"     := Vendor.Name;
                  "Adresse client" := Vendor.Address;
                  "Contact client" := Vendor.Contact;


            end;
        }
        field(38;"No. Bord Cau. Fiscale";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Header";
        }
        field(39;"Reference caution bancaire";Code[20])
        {
            CalcFormula = Lookup("Payment Header"."Référence Caution bancaire" WHERE (No.=FIELD(No. Bord Cau. RG)));
            Caption = 'Reference caution bancaire';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        InitInsert;
    end;

    var
        Customer : Record "18";
        TXT50000 : Label '"Voulez-vous créer la caution provisoire ? "';
        TXT50001 : Label '"Voulez-vous créer la caution définitive ? "';
        TXT50002 : Label '"Voulez-vous créer la caution retenue de garantie ? "';
        TXT50003 : Label 'Attention il existe des lignes non encore appurées du caution provisoire N° %1';
        SetupAutomobile : Record "70029";
        TXT50004 : Label 'Voulez-vous créer la caution Fiscale ?';
        Vendor : Record "23";
        TXT50005 : Label 'Veuillez ementionner le code client ou fournisseur';

    local procedure InitInsert();
    var
        GLSetup : Record "98";
        NoSeriesMgt : Codeunit "396";
    begin
        IF "No." = '' THEN BEGIN
          GLSetup.GET;
          GLSetup.TESTFIELD(GLSetup."No. caution");
          NoSeriesMgt.InitSeries(GLSetup."No. caution",xRec."No. Series",0D,"No.","No. Series");
        END;

        "Date création" := WORKDATE;
        "Créer par"     := USERID;
    end;

    procedure Caution(NoCaution : Code[20];TypeCaution : Integer);
    var
        GLSetup : Record "98";
        RecPaymentHeader : Record "10865";
        PaymentLine : Record "10866";
        PaymentClass : Record "10860";
        NoSeriesMgt : Codeunit "396";
        PagePaymentSlip : Page "10868";
        OK : Boolean;
        RecCaution : Record "70004";
        BordCautionProvisoire : Record "10865";
        LigneCautionProvisoire : Record "10866";
        BankAccount : Record "270";
    begin
        CLEAR(SetupAutomobile);
        /*SetupAutomobile.GET;
        SetupAutomobile.TESTFIELD("Cpt. Caution Définitive.");
        SetupAutomobile.TESTFIELD("Cpt. Caution Garantie");
        SetupAutomobile.TESTFIELD("Cpt. Caution Prov.");
        SetupAutomobile.TESTFIELD("Contre partie Caution");
        */
        RecCaution.GET(NoCaution);
        RecCaution.TESTFIELD("Code banque");
        IF ("Code client" = '')  AND ("Code Fournisseur" = '') THEN ERROR(TXT50005);
        CLEAR(BankAccount);
        BankAccount.GET(RecCaution."Code banque");
        /*BankAccount.TESTFIELD("Compte Caution Def.");
        BankAccount.TESTFIELD("Compte Caution Prov.");
        BankAccount.TESTFIELD("Compte Caution Garantie");
        BankAccount.TESTFIELD("Compte Caution Garantie");
        */
        CASE TypeCaution OF
          1: OK := CONFIRM(TXT50000);
          2: OK := CONFIRM(TXT50001);
          3: OK := CONFIRM(TXT50002);
          4: OK := CONFIRM(TXT50004);
        END;
        
        
        IF RecCaution."Caution provisoire" THEN
          BEGIN
            LigneCautionProvisoire.RESET;
            LigneCautionProvisoire.SETRANGE("No.",RecCaution."No. Bord. Cau. Prov.");
            LigneCautionProvisoire.SETRANGE("Statut caution bancaire",LigneCautionProvisoire."Statut caution bancaire"::Encours);
            IF LigneCautionProvisoire.FINDFIRST THEN
              MESSAGE(TXT50003,RecCaution."No. Bord. Cau. Prov.");
          END;
        
        IF OK THEN BEGIN
          GLSetup.GET;
          CASE TypeCaution OF
            1: BEGIN
                //TESTFIELD("Caution provisoire",FALSE);
                GLSetup.TESTFIELD("Caution provisoire");
                PaymentClass.GET(GLSetup."Caution provisoire");
               END;
        
            2: BEGIN
                TESTFIELD("Caution définitive",FALSE);
                GLSetup.TESTFIELD("Caution définitive");
                PaymentClass.GET(GLSetup."Caution définitive");
               END;
        
            3: BEGIN
                TESTFIELD("Caution retenue de garantie",FALSE);
                GLSetup.TESTFIELD("Caution retenue de garantie");
                PaymentClass.GET(GLSetup."Caution retenue de garantie");
               END;
        
            4: BEGIN
                TESTFIELD("Caution Fiscale" ,FALSE);
                GLSetup.TESTFIELD("Caution Fiscale");
                PaymentClass.GET(GLSetup."Caution Fiscale");
               END;
        
          END;
        
          RecPaymentHeader.INIT;
          PaymentClass.TESTFIELD("Header No. Series");
          NoSeriesMgt.InitSeries(PaymentClass."Header No. Series",'',0D,RecPaymentHeader."No.",RecPaymentHeader."No. Series");
          RecPaymentHeader.VALIDATE("Payment Class",PaymentClass.Code);
          RecPaymentHeader.VALIDATE("Account Type",PaymentClass."Header Account Type");
          RecPaymentHeader."Account Type" := RecPaymentHeader."Account Type"::"Bank Account";
          BankAccount.GET(RecCaution."Code banque");
          //BankAccount.TESTFIELD("Banque caution");
          RecPaymentHeader.VALIDATE("Account No.",RecCaution."Code banque");
        
          RecPaymentHeader.Suggestions:=PaymentClass.Suggestions;
          RecPaymentHeader.VALIDATE("Posting Date",WORKDATE);
          RecPaymentHeader.VALIDATE(Echéance,"Date limite");
          //RecPaymentHeader."Type Règlement" := FORMAT(RecPaymentClass.Type_Reg);
        
          CASE TypeCaution OF
            1 :
              BEGIN
                RecPaymentHeader."Type caution bancaire" := RecPaymentHeader."Type caution bancaire"::"Caution provisoire";
                RecPaymentHeader."Type caution" := 0;
                END;
            2 : BEGIN
              RecPaymentHeader."Type caution bancaire" := RecPaymentHeader."Type caution bancaire"::"caution définitive";
              RecPaymentHeader."Type caution" := 1;
              END;
            3 :
              BEGIN
                RecPaymentHeader."Type caution bancaire" := RecPaymentHeader."Type caution bancaire"::"caution retenue de garantie";
                RecPaymentHeader."Type caution" := 2;
                END;
            4 :
              BEGIN
                RecPaymentHeader."Type caution bancaire" := RecPaymentHeader."Type caution bancaire"::"caution retenue de garantie";
                RecPaymentHeader."Type caution" := 3;
                END;
          END;
          RecPaymentHeader."Source Code" := 'ENG';
          RecPaymentHeader.INSERT(TRUE);
        
        
        
         CASE TypeCaution OF
            1: BEGIN
                  PaymentLine."No."           :=  RecPaymentHeader."No.";
                  PaymentLine."Line No."      := 10000;
                  PaymentLine."Account Type"  := 0;
                  //PaymentLine.VALIDATE("Account No.",SetupAutomobile."Cpt. Caution Prov.");//old
                  PaymentLine.VALIDATE("Account Type",PaymentLine."Account Type"::Customer);//add
                  PaymentLine.VALIDATE("Account No.",RecCaution."Code client");//add
                  PaymentLine.VALIDATE("Due Date","Date limite");
                  PaymentLine.VALIDATE("Payment Class",PaymentClass.Code);
                  PaymentLine.VALIDATE("Status No.",0);
                  PaymentLine.Compte_Entête := "Code banque";
                  //PaymentLine."Posting Group" :=  BankAccount."Groupe Compta Caution Prov";//add
                  PaymentLine.Libellé := 'Caution Porv. ' + RecCaution."Code client";
                  PaymentLine.Caution := TRUE;
        
                  PaymentLine.INSERT(TRUE);
               END;
            2: BEGIN
                  PaymentLine."No."           :=  RecPaymentHeader."No.";
                  PaymentLine."Line No."      := 10000;
                  PaymentLine."Account Type"  := 0;
                  //PaymentLine.VALIDATE("Account No.",SetupAutomobile."Cpt. Caution Définitive."); //old
                  PaymentLine.VALIDATE("Account Type",PaymentLine."Account Type"::Customer);//add
                  PaymentLine.VALIDATE("Account No.",RecCaution."Code client");//add
                  PaymentLine."Posting Group" :=  BankAccount."Groupe Compta Caution Def";//add
                  PaymentLine.VALIDATE("Due Date","Date limite");
                  PaymentLine.VALIDATE("Payment Class",PaymentClass.Code);
                  PaymentLine.VALIDATE("Status No.",0);
                  PaymentLine.Caution := TRUE;
                  PaymentLine.Compte_Entête := "Code banque";
                  PaymentLine.VALIDATE("Debit Amount",RecCaution."Montant marché"*(RecCaution."% Mnt marché définitive"/100));
                  PaymentLine.Libellé := 'Caution Def. ' + RecCaution."Code client";
                  PaymentLine.INSERT(TRUE);
               END;
            3: BEGIN
                  PaymentLine."No."           :=  RecPaymentHeader."No.";
                  PaymentLine."Line No."      := 10000;
                  PaymentLine."Account Type"  := 0;
                  //PaymentLine.VALIDATE("Account No.",SetupAutomobile."Cpt. Caution Définitive.");//old
                            PaymentLine.VALIDATE("Account Type",PaymentLine."Account Type"::Customer);//add
                  PaymentLine.VALIDATE("Account No.",RecCaution."Code client");//add
                  PaymentLine."Posting Group" :=  BankAccount."Groupe Compta Caution Gar.";//add
                  PaymentLine.VALIDATE("Due Date","Date limite");
                  PaymentLine.VALIDATE("Payment Class",PaymentClass.Code);
                  PaymentLine.VALIDATE("Status No.",0);
                  PaymentLine.Caution := TRUE;
                  PaymentLine.Compte_Entête := "Code banque";
                  PaymentLine.VALIDATE("Debit Amount",RecCaution."Montant marché"*(RecCaution."% Mnt marché Garantie"/100));
                  PaymentLine.Libellé := 'Caution Garantie. ' + RecCaution."Code client";
                  PaymentLine.INSERT(TRUE);
               END;
              4: BEGIN
                PaymentLine."No."           :=  RecPaymentHeader."No.";
                PaymentLine."Line No."      := 10000;
                PaymentLine."Account Type"  := 0;
                PaymentLine.VALIDATE("Account Type",PaymentLine."Account Type"::Vendor);
                PaymentLine.VALIDATE("Account No.",RecCaution."Code Fournisseur");
                PaymentLine."Posting Group" :=  BankAccount."Groupe Compta Caution Fisc.";
                PaymentLine.VALIDATE("Due Date","Date limite");
                PaymentLine.VALIDATE("Payment Class",PaymentClass.Code);
                PaymentLine.VALIDATE("Status No.",0);
                PaymentLine.Caution := TRUE;
                PaymentLine.Compte_Entête := "Code banque";
                PaymentLine.VALIDATE("Debit Amount",RecCaution."Montant marché"*(RecCaution."% Mnt marché Garantie"/100));
                PaymentLine.Libellé := 'Caution Fiscle' + RecCaution."Code client";
                PaymentLine.INSERT(TRUE);
              END;
          END;
        
        
        
          RecPaymentHeader.VALIDATE("No caution","No.");
          RecPaymentHeader.MODIFY(TRUE);
          CLEAR(PaymentLine);
        
        
          MESSAGE('Bordereau No %1 a été crée.',RecPaymentHeader."No.");
          COMMIT;
        
          RecPaymentHeader.SETRANGE("No.",RecPaymentHeader."No.");
          PagePaymentSlip.SETRECORD(RecPaymentHeader);
          PagePaymentSlip.SETTABLEVIEW(RecPaymentHeader);
        //ZMN MIG  PagePaymentSlip.SetCautionVisible(TRUE);
          PagePaymentSlip.RUNMODAL;
        
          CASE TypeCaution OF
            1: BEGIN
                "Caution provisoire"   := TRUE;
                "No. Bord. Cau. Prov." := RecPaymentHeader."No.";
               END;
            2: BEGIN
                "Caution définitive" := TRUE;
                "No. Bord Cau. Def." := RecPaymentHeader."No.";
               END;
            3: BEGIN
                "Caution retenue de garantie" := TRUE;
                "No. Bord Cau. RG"            := RecPaymentHeader."No.";
               END;
            4: BEGIN
                "Caution Fiscale"    := TRUE;
                "No. Bord Cau. Fiscale"            := RecPaymentHeader."No.";
               END;
        
          END;
        
          MODIFY;
        END;

    end;
}

