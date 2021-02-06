page 60181 "Version Article"
{
    // version CT16V002

    CardPageID = "Fiche vesion";
    PageType = List;
    SourceTable = Table50033;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code version";"Code version")
                {
                    Caption = 'KATASHIKI';
                }
                field(Description;Description)
                {
                }
                field(Biton;Biton)
                {
                    Visible = false;
                }
                field("Biton Par Défaut";"Biton Par Défaut")
                {
                    Visible = false;
                }
                field("Code devise";"Code devise")
                {
                }
                field("Pays de provenance";"Pays de provenance")
                {
                }
                field("Formule mois de production";"Formule mois de production")
                {
                }
                field("Durée Transit (Jour)";"Durée Transit (Jour)")
                {
                }
                field("Durée de livraison stock";"Durée de livraison stock")
                {
                }
                field("Format VIN";"Format VIN")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Prix Version")
            {
                Image = Price;
                RunObject = Page 70078;
                RunPageLink = Code version=FIELD(Code version);
            }
        }
    }
}

