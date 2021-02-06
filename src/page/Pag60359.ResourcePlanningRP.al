page 60359 "Resource Planning RP"
{
    PageType = Card;
    SourceTable = Table152;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Période";GOptPeriod)
                {
                }
                field(Groupe;GCdeGroupCode)
                {
                    TableRelation = "Resource Group";
                }
            }
        }
    }

    actions
    {
    }

    var
        GCdeGroupCode : Code[20];
        GOptPeriod : Option Jour,Semaine,Mois;
}

