table 70045 "CAB Mouvement"
{
    // version TR©CAB1.00

    DrillDownPageID = 70055;
    LookupPageID = 70055;

    fields
    {
        field(1;"Code Mouvement";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Code magasin De";Code[10])
        {
            TableRelation = Location.Code;
        }
        field(3;"Code Casier De";Code[20])
        {
            TableRelation = Bin.Code;
        }
        field(4;"Code a barre";Code[20])
        {
        }
        field(5;"Qté";Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(6;"Code magasin Au";Code[10])
        {
            TableRelation = Location.Code;
        }
        field(7;"Code Casier Au";Code[20])
        {
            TableRelation = Bin.Code;
        }
        field(8;"Date Mouvement";Date)
        {
        }
        field(9;"Type Mouvement";Text[10])
        {
        }
        field(10;Utilisateur;Code[50])
        {
            TableRelation = "User Setup";
        }
        field(11;Terminal;Code[10])
        {
        }
        field(13;"En attente";Boolean)
        {
        }
        field(15;"N° Recept. Entrepôt";Code[20])
        {
            TableRelation = "Posted Whse. Receipt Header".No.;
        }
        field(16;Guid;Guid)
        {
        }
        field(17;"N° Commande Vente";Code[20])
        {
            NotBlank = false;
        }
        field(18;"N° Ordre de réparation";Code[20])
        {
            TableRelation = "Service Header".No. WHERE (Document Type=CONST(Order));
        }
        field(19;"Article en dépasement";Boolean)
        {
        }
        field(20;"Quantité Commandée";Decimal)
        {
        }
        field(22;"Quantité Controlée";Decimal)
        {
        }
        field(23;"Contrôle Validé";Boolean)
        {
        }
        field(24;Remarque;Text[50])
        {
        }
        field(25;"No. Order Transfert";Code[20])
        {
        }
        field(26;"Type Mouvement Transfert";Option)
        {
            OptionCaptionML = ENU=' ,Expedition,Reception',
                              FRA=' ,Expedition,Reception';
            OptionMembers = " ",Expedition,Reception;
        }
        field(27;"No. Colis";Code[20])
        {
        }
        field(28;"Company Name";Text[80])
        {
        }
        field(29;"No. Dossier Import";Code[20])
        {
        }
        field(30;"Rangé";Boolean)
        {
        }
        field(31;Approbateur;Code[50])
        {
            TableRelation = "User Setup";
        }
        field(32;"No Cmd Achat";Code[20])
        {
        }
        field(33;"No. Facture";Code[20])
        {
        }
        field(34;"Date Creation";DateTime)
        {
        }
        field(35;"Date Modification";DateTime)
        {
        }
        field(36;"Sur commande";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37;"No Commande Vente";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Level Bin";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Colis Cloturer";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(40;"Reception Cloturer";Boolean)
        {
            CalcFormula = Lookup("Posted Whse. Receipt Header".Cloturer WHERE (No.=FIELD(N° Recept. Entrepôt),
                                                                               No. Colis=FIELD(No. Colis)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Code Mouvement")
        {
        }
        key(Key2;"Type Mouvement","N° Recept. Entrepôt","N° Commande Vente","N° Ordre de réparation","Code a barre")
        {
        }
        key(Key3;"Code a barre")
        {
        }
        key(Key4;"Type Mouvement","N° Recept. Entrepôt","Code a barre")
        {
            SumIndexFields = "Qté";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Date Creation" := CREATEDATETIME(WORKDATE,TIME);
    end;

    trigger OnModify();
    begin
        "Date Modification" := CREATEDATETIME(WORKDATE,TIME);
    end;

    var
        UserSetup : Record "91";
        text001 : Label 'vous n''avez pas le droit de supprimer des lignes mouvements.';
}

