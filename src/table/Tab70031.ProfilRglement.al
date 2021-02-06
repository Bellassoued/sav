table 70031 "Profil Réglement"
{
    LookupPageID = 70033;

    fields
    {
        field(1;"Code Profil";Code[20])
        {
            TableRelation = "Profil utilisateur";

            trigger OnValidate();
            begin
                Profilutilisateur.GET("Code Profil");
                "Description coffre" := Profilutilisateur."Désignation profil"
            end;
        }
        field(2;"Description coffre";Text[200])
        {
        }
        field(3;Coffre;Code[20])
        {
            TableRelation = Coffre;

            trigger OnValidate();
            begin
                CLEAR(RegGCoffre);
                RegGCoffre.GET(Coffre);
                "Description coffre" := RegGCoffre.Désignation;
            end;
        }
        field(4;"Etape réglement";Code[20])
        {
            TableRelation = "Payment Class";
        }
        field(5;"Nbr. User";Integer)
        {
            CalcFormula = Count("User Setup" WHERE (Profil Réglement=FIELD(Code Profil),
                                                    Tréso Resp. Ctr. Filter=FIELD(Centre de Gestion)));
            FieldClass = FlowField;
        }
        field(6;"Filter par Coffre";Boolean)
        {
            Description = 'Filtre par coffre';
        }
        field(7;"Centre de Gestion";Code[20])
        {
            CaptionML = ENU='Service Resp. Ctr. Filter',
                        FRA='Filtre centre gestion Tréso';
            TableRelation = "Responsibility Center";
        }
        field(8;"Admin Encai-Décaiss.";Boolean)
        {
            Description = 'Pour le financier resp. des notifications en banque';
        }
        field(9;"Filter par Centre de gestion";Boolean)
        {
            Description = 'le caissier central admin visualise les Ecr. de son cnetre de gestion';
        }
        field(10;"Code Journal";Code[20])
        {
            TableRelation = "Source Code".Code;

            trigger OnValidate();
            begin
                CLEAR(Detailprofilreglement);
                Detailprofilreglement.SETFILTER(Detailprofilreglement."Code profil réglement",'%1',"Code Profil");
                Detailprofilreglement.SETFILTER(Coffre,'%1',Coffre);
                Detailprofilreglement.SETFILTER("Centre ge Gestion",'%1',"Centre de Gestion");
                Detailprofilreglement.SETFILTER("Type action",'%1',Detailprofilreglement."Type action"::Ledger);
                IF Detailprofilreglement.FIND('-') THEN
                REPEAT
                 Detailprofilreglement."Code journale" := "Code Journal";
                 Detailprofilreglement.MODIFY;
                UNTIL Detailprofilreglement.NEXT = 0;
            end;
        }
        field(11;"Filter Autre Centre Gestion";Text[100])
        {
            TableRelation = "Responsibility Center".Code;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(12;"CaisseRecette par défaut";Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(13;"Code Profil Secandaire";Code[20])
        {
            TableRelation = "Profil utilisateur";

            trigger OnValidate();
            begin
                Profilutilisateur.GET("Code Profil");
                "Description coffre" := Profilutilisateur."Désignation profil"
            end;
        }
        field(14;"Garder Info. B.Reg.";Boolean)
        {
        }
        field(15;"Caisse dépense par défaut";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(16;"Afficher D.A a régler Espèce";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Afficher D.A a régler Chèque";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code Profil",Coffre)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin

        Detailprofilreglement.SETFILTER("Code profil réglement",'%1',"Code Profil");
        Detailprofilreglement.SETFILTER(Coffre,'%1',Coffre);
        Detailprofilreglement.SETFILTER("Centre ge Gestion",'%1',"Centre de Gestion");
        IF Detailprofilreglement.FIND('-') THEN
        REPEAT
          Detailprofilreglement.DELETE;
        UNTIL Detailprofilreglement.NEXT = 0;
    end;

    var
        Profilutilisateur : Record "70053";
        RegGCoffre : Record "60021";
        Detailprofilreglement : Record "70032";
}

