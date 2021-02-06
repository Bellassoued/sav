table 70032 "Détail profil réglement"
{

    fields
    {
        field(1;"Code profil réglement";Code[20])
        {
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2;"Type de réglement";Code[100])
        {
        }
        field(3;"Etape de réglement";Code[100])
        {
        }
        field(4;"No. ligne";Integer)
        {
        }
        field(5;"Désignation";Code[100])
        {
        }
        field(6;Autoriser;Boolean)
        {
        }
        field(7;"Compte Débit";Code[20])
        {
            TableRelation = "G/L Account".No.;

            trigger OnValidate();
            begin
                CLEAR(GLAccount);
                IF GLAccount.GET("Compte Débit") THEN
                "Nom compte" := GLAccount.Name
                ELSE
                "Nom compte" := '';
            end;
        }
        field(8;"Compte Crédit";Code[20])
        {
            TableRelation = "G/L Account".No.;

            trigger OnValidate();
            begin
                CLEAR(GLAccount);
                IF GLAccount.GET("Compte Crédit") THEN
                "Nom compte" := GLAccount.Name
                ELSE
                "Nom compte" := '';
            end;
        }
        field(9;Coffre;Code[20])
        {
        }
        field(10;"Nom compte";Code[100])
        {
        }
        field(11;"Centre ge Gestion";Code[20])
        {
            CaptionML = ENU='Service Resp. Ctr. Filter',
                        FRA='Filtre centre gestion Tréso';
        }
        field(12;"No. statut précédent";Integer)
        {
        }
        field(13;"No. statut suivant";Integer)
        {
        }
        field(14;"Type action";Option)
        {
            OptionCaption = 'Aucune,Comptabilisation,Édition,Fichier,Création document';
            OptionMembers = "None",Ledger,"Report",File,"Create New Document";
        }
        field(15;"Souche de No.";Code[20])
        {
        }
        field(16;"Cpt Exist Incadea";Code[10])
        {
        }
        field(17;"Code journale";Code[20])
        {
        }
        field(18;Commentaire;Text[50])
        {
        }
        field(19;"Modifié par";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Code profil réglement",Coffre,"Type de réglement","Etape de réglement","No. ligne")
        {
        }
        key(Key2;"Type de réglement","Code profil réglement","No. ligne")
        {
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount : Record "15";
}

