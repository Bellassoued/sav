page 60372 "Réparateur agrée Activités P2"
{
    PageType = CardPart;
    SourceTable = Table60091;

    layout
    {
        area(content)
        {
            cuegroup("CA PR")
            {
                field("CA PR (Année)";"CA PR (Année)")
                {
                }
                field("CA PR (Mois)";"CA PR (Mois)")
                {
                }
                field("CA PR (Semaine)";"CA PR (Semaine)")
                {
                }
            }
            cuegroup(Achat)
            {
                field("Montant Achat CTR (Année)";"Montant Achat CTR (Année)")
                {
                }
                field("Montant Achat CTR (Mois)";"Montant Achat CTR (Mois)")
                {
                }
                field("Montant Achat CTR (Semaine)";"Montant Achat CTR (Semaine)")
                {
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
        SETFILTER("Vendor Filter",'F00001');
    end;

    var
        RecUserSetup : Record "91";
}

