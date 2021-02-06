page 50106 "Campagne Carte"
{
    // version SAVCompagne

    PageType = Card;
    SourceTable = Table50082;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code;Code)
                {
                }
                field(Description;Description)
                {
                }
                field("Date de lancement";"Date de lancement")
                {
                }
                field("Date de création";"Date de création")
                {
                }
                field("Créée par";"Créée par")
                {
                }
                field("Code marque";"Code marque")
                {
                }
                field("Type Compagne";"Type Compagne")
                {
                }
                field(Bloquant;Bloquant)
                {
                }
                field("Nbre total VIN comapgne";"Nbre total VIN comapgne")
                {
                }
                field("Nbre VIN non traité";"Nbre VIN non traité")
                {
                }
                part(;50107)
                {
                    SubPageLink = Code=FIELD(Code);
                }
            }
        }
    }

    actions
    {
    }
}

