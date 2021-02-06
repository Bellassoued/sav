table 70053 "Profil utilisateur"
{
    DrillDownPageID = 70261;
    LookupPageID = 70261;

    fields
    {
        field(1;"Code profil";Code[20])
        {
        }
        field(2;"Désignation profil";Text[50])
        {
        }
        field(5;"Nbr. User";Integer)
        {
            CalcFormula = Count("User Setup" WHERE (Profil Réglement=FIELD(Code profil)));
            FieldClass = FlowField;
        }
        field(70130;"Détail Coffre";Option)
        {
            Description = 'a supprimer et ne pas utiliser';
            OptionCaption = 'CHRONO,VN,PR,SAV,CENTRAL';
            OptionMembers = CHRONO,VN,PR,SAV,CENTRAL;
        }
        field(70131;"Coffre par défaut";Boolean)
        {
        }
        field(70132;VN;Boolean)
        {

            trigger OnValidate();
            begin
                TESTFIELD("Coffre par défaut",FALSE);
            end;
        }
        field(70133;PR;Boolean)
        {

            trigger OnValidate();
            begin
                TESTFIELD("Coffre par défaut",FALSE);
            end;
        }
        field(70134;Chrono;Boolean)
        {

            trigger OnValidate();
            begin
                TESTFIELD("Coffre par défaut",FALSE);
            end;
        }
        field(70135;SAV;Boolean)
        {

            trigger OnValidate();
            begin
                TESTFIELD("Coffre par défaut",FALSE);
            end;
        }
        field(70136;Central;Boolean)
        {

            trigger OnValidate();
            begin
                TESTFIELD("Coffre par défaut",FALSE);
            end;
        }
        field(70137;"Siège";Boolean)
        {
        }
        field(70138;"Garder Info. Br.Reglement";Boolean)
        {
        }
        field(70139;Notification;Boolean)
        {
        }
        field(70140;"AssM-1";Boolean)
        {
        }
        field(70141;"AssM-2";Boolean)
        {
        }
        field(70142;"AssM-3";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Code profil")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Code profil","Désignation profil","Coffre par défaut",Central,"Siège","Garder Info. Br.Reglement",Notification)
        {
        }
    }
}

