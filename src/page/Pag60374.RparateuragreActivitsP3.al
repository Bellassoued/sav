page 60374 "Réparateur agrée Activités P3"
{
    PageType = CardPart;
    SourceTable = Table60091;

    layout
    {
        area(content)
        {
            cuegroup("CA SAV")
            {
                field("CA SAV (Année)";"CA SAV (Année)")
                {
                }
                field("CA SAV (Mois)";"CA SAV (Mois)")
                {
                }
                field("CA SAV (Semaine)";"CA SAV (Semaine)")
                {
                }
            }
            cuegroup("Réception")
            {
                field("Nombre d'entrée (Année)";"Nombre d'entrée (Année)")
                {
                    Image = "None";
                }
                field("Nombre d'entrée (Mois)";"Nombre d'entrée (Mois)")
                {
                    Image = "None";
                }
                field("Nombre d'entrée (Semaine)";"Nombre d'entrée (Semaine)")
                {
                    Image = "None";
                }
            }
            cuegroup(Facturation)
            {
                field("Nombre des Factures SAV(Année)";"Nombre des Factures SAV(Année)")
                {
                    Image = "None";
                }
                field("Nombre des Factures SAV(Mois)";"Nombre des Factures SAV(Mois)")
                {
                    Image = "None";
                }
                field("Nombre des Factures SAV(Sem)";"Nombre des Factures SAV(Sem)")
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
        SETRANGE("Filter Date A",CALCDATE('<-CY>',WORKDATE),WORKDATE);
        SETRANGE("Filter Date M",CALCDATE('<-CM>',WORKDATE),WORKDATE);
        SETRANGE("Filter Date S",CALCDATE('<-CW>',WORKDATE),WORKDATE);
    end;

    var
        RecUserSetup : Record "91";
}

