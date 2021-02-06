table 70005 "Commision par banque"
{
    // version CT16V002.2


    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Type commision";Option)
        {
            OptionCaption = '" ,Caution provisoir,Caution définitive,Caution retenue de garantie,L.C,Domiciliation,Arrivage,Financement,Négociation,Lettre de garantie,SBLC"';
            OptionMembers = " ","Caution provisoir","Caution définitive","Caution retenue de garantie","L.C",Domiciliation,Arrivage,Financement,"Négociation","Lettre de garantie",SBLC;
        }
        field(3;"Libelé commision/Intérêt";Text[50])
        {
        }
        field(4;Banque;Code[20])
        {
            TableRelation = "Bank Account".No.;

            trigger OnValidate();
            begin
                CLEAR(BankAccount);
                BankAccount.GET(Banque);
                "Nom de la banque" := BankAccount.Name;
            end;
        }
        field(5;"Nom de la banque";Code[50])
        {
        }
        field(6;"Montant commision";Decimal)
        {

            trigger OnValidate();
            begin
                IF "Montant commision" <> 0 THEN
                TESTFIELD("% Commission/Int.",0);
            end;
        }
        field(7;"Compte contrepartie";Code[20])
        {
            TableRelation = "G/L Account".No.;
        }
        field(8;"% Commission/Int.";Decimal)
        {
            DecimalPlaces = 3:3;

            trigger OnValidate();
            begin
                IF "% Commission/Int." <> 0 THEN
                TESTFIELD("Montant commision",0);
            end;
        }
        field(9;"Txt Formule";Text[250])
        {
        }
        field(10;"Affecté sur";Option)
        {
            OptionCaption = '" ,Ouverture,Modif Mnt/Date-Val,Acceptation,Réaliation,Frais-Corresp,Intérêt Fin"';
            OptionMembers = " ",Ouverture,"Modif Mnt/Date-Val",Acceptation,"Réaliation","Frais-Corresp","Intérêt Fin";
        }
        field(11;Plafond;Decimal)
        {
        }
        field(12;"Insérer";Boolean)
        {
        }
        field(13;"% TVA";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.",Banque)
        {
        }
        key(Key2;Banque)
        {
        }
    }

    fieldgroups
    {
    }

    var
        BankAccount : Record "270";
        NumLC : Code[20];
}

