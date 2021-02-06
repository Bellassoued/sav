page 60395 "Liste Réclamations"
{
    // version Gestion RDV

    CardPageID = "Entête réception12";
    PageType = List;
    SourceTable = Table60095;
    SourceTableView = WHERE(Type=FILTER(Réclamation));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Réception";"No. Réception")
                {
                }
                field(Type;Type)
                {
                    Editable = false;
                }
                field("Date réception";"Date réception")
                {
                }
                field("Code Client";"Code Client")
                {
                }
                field("No. chassis";"No. chassis")
                {
                }
                field("Réçu par";"Réçu par")
                {
                }
                field("Temp de réception";"Temp de réception")
                {
                }
                field("No. Téléphone demandeur";"No. Téléphone demandeur")
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
        Type := Type::Réclamation;
    end;
}

