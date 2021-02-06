table 50006 "Groupe Retenue"
{
    DrillDownPageID = 50000;
    LookupPageID = 50000;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Designation; Text[80])
        {
        }
        field(3; "% Retenue"; Decimal)
        {
        }
        field(4; "Compte Retenue"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(5; "Type Retenue"; Option)
        {
            OptionCaption = 'Retenu à la source,Retenu de garantie';
            OptionMembers = "à la source","de garantie";
        }
        field(6; Proposition; Option)
        {
            OptionCaption = '" ,Clients,Fournisseurs,Salarié"';
            OptionMembers = " ",Clients,Fournisseurs,"Salarié";
        }
        field(7; annexe; Option)
        {
            Description = 'MZK DEC EMP';
            OptionCaption = '" ,Annexe I,Annexe II,Annexe III,Annexe IV,Annexe V,Annexe VI,Recap,Quittance"';
            OptionMembers = " ","Annexe I","Annexe II","Annexe III","Annexe IV","Annexe V","Annexe VI",Recap,Quittance;
        }
        field(8; "Pos. mnt Brut dans Annexe"; Code[10])
        {
            Description = 'MZK DEC EMP position de montant brut de la retenue appliquée';
        }
        field(9; "Sous Pos. mnt Brut ds  Annexe"; Code[10])
        {
            Description = 'MZK DEC EMP eventuellment la sous position de montant brut de la retenue appliquée';
        }
        field(50000; "Activé"; Boolean)
        {
            Description = 'MZK DEC EMP';
        }
        field(50001; Ristourne; Boolean)
        {
            Description = 'MZK DEC EMP pr les ristournes ne remplir qe le champs montant base';
        }
        field(50002; "Activé R.S"; Boolean)
        {
        }
        field(50003; "Date Début Activation"; Date)
        {
        }
        field(50004; "Priorité"; Option)
        {
            OptionMembers = "0","1";
        }
    }

    keys
    {
        key(Key1; "Type Retenue", "Code")
        {
        }
        key(Key2; "Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Designation)
        {
        }
    }
}

