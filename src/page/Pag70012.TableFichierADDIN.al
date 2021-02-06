page 70012 "Table Fichier ADDIN"
{
    // version PR00011

    PageType = List;
    SourceTable = Table70009;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Séquence;Séquence)
                {
                }
                field(Réference;Réference)
                {
                }
                field(Déscription;Déscription)
                {
                }
                field("Code Famille";"Code Famille")
                {
                }
                field("Déscription Famille";"Déscription Famille")
                {
                }
                field("Niveau de Concurrence";"Niveau de Concurrence")
                {
                }
                field(crénne;crénne)
                {
                }
                field(Index;Index)
                {
                }
                field(Ségment;Ségment)
                {
                }
                field(Poids;Poids)
                {
                }
                field(Volume;Volume)
                {
                }
                field("unite de vente";"unite de vente")
                {
                }
                field("volume integer";"volume integer")
                {
                }
                field("volume final";"volume final")
                {
                }
                field(traiterconv;traiterconv)
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
                        XmlImportFicheADDIN.RUN;
                        CurrPage.UPDATE;
                    end;
                }
            }
        }
    }

    var
        XmlImportFicheADDIN : XMLport "70000";
}

