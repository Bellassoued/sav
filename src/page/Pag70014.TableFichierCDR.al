page 70014 "Table Fichier CDR"
{
    // version PR00011

    PageType = List;
    SourceTable = Table70011;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Séquence CDR";"Séquence CDR")
                {
                }
                field(Champ3;Champ3)
                {
                }
                field("Nom Tarif";"Nom Tarif")
                {
                }
                field("Réference ( Tassée à gauche)";"Réference ( Tassée à gauche)")
                {
                }
                field("Désignation Francais";"Désignation Francais")
                {
                }
                field("Désignation Anglaise";"Désignation Anglaise")
                {
                }
                field(Vehicule;Vehicule)
                {
                }
                field(Tarif;Tarif)
                {
                }
                field("Unité de  conditionnement";"Unité de  conditionnement")
                {
                }
                field(Volume;Volume)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group()
            {
                action(Import)
                {
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        XmlImportFicheCDR.RUN;
                        CurrPage.UPDATE;
                    end;
                }
            }
        }
    }

    var
        XmlImportFicheCDR : XMLport "70001";
}

