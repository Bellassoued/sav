page 60370 "Réparateur agrée Activités P1"
{
    PageType = CardPart;
    SourceTable = Table60091;

    layout
    {
        area(content)
        {
            cuegroup("VIN Vendu")
            {
                field("VIN Vendu (Année)";"VIN Vendu (Année)")
                {
                    Image = "None";
                }
                field("VIN Vendu (Mois)";"VIN Vendu (Mois)")
                {
                    Image = "None";
                }
                field("VIN Vendu (Semaine)";"VIN Vendu (Semaine)")
                {
                    Image = "None";
                }
            }
            cuegroup("VIN Livée")
            {
                field("VIN Livrée (Année)";"VIN Livrée (Année)")
                {
                    Image = "None";
                }
                field("VIN Livrée (Mois)";"VIN Livrée (Mois)")
                {
                    Image = "None";
                }
                field("VIN Livrée (Semaine)";"VIN Livrée (Semaine)")
                {
                    Image = "None";
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        RESET;
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;

        RecUserSetup.GET(USERID);
        SETRANGE("Filter Date A",CALCDATE('<-CY>',WORKDATE),WORKDATE);
        SETRANGE("Filter Date M",CALCDATE('<-CM>',WORKDATE),WORKDATE);
        SETRANGE("Filter Date S",CALCDATE('<-CW>',WORKDATE),WORKDATE);
        IF RecUserSetup."Salespers./Purch. Code" <> '' THEN
          SETFILTER("SalesPersone Filter",RecUserSetup."Salespers./Purch. Code");
    end;

    var
        RecUserSetup : Record "91";
}

