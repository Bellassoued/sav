page 60170 "Ligne Regle repartition buffer"
{
    PageType = List;
    SourceTable = Table60043;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Valeur Axe";"Valeur Axe")
                {
                }
                field(Pourcentage;Pourcentage)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    begin

        VALIDATE("Code Règle",LocalCodeRegle);
        VALIDATE("Code Axe",LocalCodeAxe);
    end;

    var
        LocalCodeRegle : Code[20];
        LocalCodeAxe : Code[20];

    procedure InitLignesRegle("Code Regle" : Code[20];"Code Axe" : Code[20]);
    begin

        LocalCodeRegle := "Code Regle" ;
        LocalCodeAxe := "Code Axe" ;
    end;
}

