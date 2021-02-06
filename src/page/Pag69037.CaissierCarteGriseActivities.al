page 69037 "Caissier CarteGrise Activities"
{
    PageType = CardPart;
    SourceTable = Table60017;

    layout
    {
        area(content)
        {
            cuegroup(Coffre)
            {
                Caption = 'Coffre';
                field("Nombre chèques en coffre";"Nombre chèques en coffre")
                {
                }
                field("Nombre effets en coffre";"Nombre effets en coffre")
                {
                }
                field("Carte Grise Envoyé";"Carte Grise Envoyé")
                {
                }
            }
            group("Espéce")
            {
                Caption = 'Espéce';
                field("Versement espèce";"Versement espèce")
                {
                    Caption = 'Versement Espéce de la journée';
                }
            }
            group("Chéque")
            {
                Caption = 'Chéque';
                field("Solde chèques en coffre";"Solde chèques en coffre")
                {
                }
                field("Versement chèques";"Versement chèques")
                {
                    Caption = 'Versement Chèques de la journée';
                }
            }
            group(Effet)
            {
                Caption = 'Effet';
                field("Solde effets en coffre";"Solde effets en coffre")
                {
                }
                field("Versement effets";"Versement effets")
                {
                    Caption = 'Versement Effets de la journée';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        SETRANGE(DateFilter,WORKDATE);
        RecUserSetup.GET(USERID);
        IF RecUserSetup."Filtre coffre"<>'' THEN
          SETRANGE(FiltreCoffre,RecUserSetup."Filtre coffre")
        ELSE SETRANGE(FiltreCoffre);
    end;

    var
        RecUserSetup : Record "91";
}

