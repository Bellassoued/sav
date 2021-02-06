table 70098 "User Setup Mapping"
{
    // version AURES

    CaptionML = ENU='User Setup',
                FRA='Paramètres utilisateur';
    DataPerCompany = false;
    DrillDownPageID = 119;
    LookupPageID = 119;

    fields
    {
        field(1;"User ID";Code[50])
        {
            CaptionML = ENU='User ID',
                        FRA='Code utilisateur';
            NotBlank = true;
            TableRelation = User."User Name";
            ValidateTableRelation = false;

            trigger OnLookup();
            var
                UserMgt : Codeunit "418";
            begin
            end;

            trigger OnValidate();
            var
                UserMgt : Codeunit "418";
            begin
            end;
        }
        field(10;"Salespers./Purch. Code";Code[10])
        {
            CaptionML = ENU='Salespers./Purch. Code',
                        FRA='Code vendeur/acheteur';
            TableRelation = Salesperson/Purchaser.Code;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate();
            var
                UserSetup : Record "91";
            begin
            end;
        }
        field(17;"E-Mail";Text[100])
        {
            CaptionML = ENU='E-Mail',
                        FRA='E-mail';
            ExtendedDatatype = EMail;
        }
        field(5700;"Sales Resp. Ctr. Filter";Code[10])
        {
            CaptionML = ENU='Sales Resp. Ctr. Filter',
                        FRA='Filtre centre gestion vente';
            TableRelation = "Responsibility Center".Code;
        }
        field(5701;"Purchase Resp. Ctr. Filter";Code[10])
        {
            CaptionML = ENU='Purchase Resp. Ctr. Filter',
                        FRA='Filtre centre gestion achat';
            TableRelation = "Responsibility Center";
        }
        field(5900;"Service Resp. Ctr. Filter";Code[10])
        {
            CaptionML = ENU='Service Resp. Ctr. Filter',
                        FRA='Filtre centre gestion service';
            TableRelation = "Responsibility Center";
        }
        field(50006;"Mag Reservation/Defaut";Code[20])
        {
            TableRelation = Location;
        }
        field(60000;"PDA user";Integer)
        {
        }
        field(60001;"PDA paswword";Integer)
        {
        }
        field(60002;"PDA User Menu List";Text[30])
        {
        }
        field(60006;"Responsable agence VN";Boolean)
        {
        }
        field(60007;"User Activity";Option)
        {
            CaptionML = ENU='User Activity',
                        FRA='Activité Utilisateur';
            Description = 'SM MAZDA307';
            OptionCaptionML = ENU=' ,PR,VN,Service,Frais Généraux,Marketing,Project',
                              FRA=' ,PR,VN,Service,Frais Généraux,Marketing,Project';
            OptionMembers = " ",PR,VN,Service,"Frais Généraux",Marketing,Projet;
        }
        field(70007;"caisse-Depense-par defaut";Code[10])
        {
            TableRelation = "Bank Account".No. WHERE (Caisse=FILTER(Dépense));
        }
        field(70008;"caisse-Recette-par defaut";Code[10])
        {
            TableRelation = "Bank Account".No. WHERE (Caisse=FILTER(Recette));
        }
        field(70071;"Profil Réglement";Code[200])
        {
            TableRelation = "Profil utilisateur"."Code profil";
        }
        field(70085;"Tréso Resp. Ctr. Filter";Code[20])
        {
            CaptionML = ENU='Service Resp. Ctr. Filter',
                        FRA='Filtre centre gestion Tréso';
            TableRelation = "Responsibility Center";
        }
        field(70086;"Profile ID";Code[30])
        {
            CaptionML = ENU='Profile ID',
                        FRA='ID profil';
            TableRelation = Profile;
        }
        field(70087;"Filter Coffre";Code[20])
        {
            TableRelation = Coffre.Code;
        }
        field(70088;"Default Mag";Code[20])
        {
            Description = 'sm050717';
            TableRelation = "Warehouse Employee"."Location Code" WHERE (User ID=FIELD(User ID));
        }
        field(70089;"Profile ID GROS";Integer)
        {
            CaptionML = ENU='Profile ID',
                        FRA='ID profil';
        }
    }

    keys
    {
        key(Key1;"User ID","Profile ID","Sales Resp. Ctr. Filter","Purchase Resp. Ctr. Filter","Service Resp. Ctr. Filter","Mag Reservation/Defaut","Filter Coffre","Default Mag")
        {
        }
        key(Key2;"Salespers./Purch. Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        NotificationSetup : Record "1512";
    begin
    end;

    var
        Text001 : TextConst ENU='The %1 Salesperson/Purchaser code is already assigned to another User ID %2.',FRA='Le code vendeur/acheteur %1 est déjà attribué à un autre code utilisateur %2.';
        Text003 : TextConst ENU='You cannot have both a %1 and %2. ',FRA='Vous ne pouvez pas avoir à la fois un %1 et un %2. ';
        Text004 : TextConst ENU='The %1 User ID does not have a %2 assigned.',FRA='Le code utilisateur %1 n''a pas de %2 attribué(e).';
        Text005 : TextConst ENU='You cannot have approval limits less than zero.',FRA='Vous ne pouvez pas avoir de limite d''approbation inférieure à zéro.';
        GLSetup : Record "98";
}

