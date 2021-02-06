page 60169 "Ligne Regles de repartition"
{
    PageType = ListPart;
    SourceTable = Table60042;

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

        IF RecGEnteteRegle.GET("Code Règle") THEN
          BEGIN
            //RecGEnteteRegle.TESTFIELD(RecGEnteteRegle."Code Axes");
            VALIDATE("Code Axe",RecGEnteteRegle."Code Axes");
          END;
    end;

    var
        RecGEnteteRegle : Record "60041";
}

