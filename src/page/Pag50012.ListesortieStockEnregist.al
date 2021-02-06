page 50012 "Liste sortie Stock Enregisté"
{
    // version DOC STOCK,CT16V001

    CardPageID = "Sorties de stock Montage enreg";
    Editable = false;
    PageType = List;
    SourceTable = 50010;
    SourceTableView = SORTING(N°)
                      WHERE(Type Mvt=CONST(Sortie),
                            Type origine=CONST(Montage));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("N°"; "N°")
                {
                }
                field("Type Mvt"; "Type Mvt")
                {
                }
                field("N° Souche"; "N° Souche")
                {
                }
                field("N° Client"; "N° Client")
                {
                }
                field("Date comptabilisation"; "Date comptabilisation")
                {
                }
                field("Cree par"; "Cree par")
                {
                }
                field("Numero de Chassis"; "Numero de Chassis")
                {
                }
                field("Modèle Vehicule"; "Modèle Vehicule")
                {
                }
                field("Code Variante"; "Code Variante")
                {
                }
                field("Description Véhicule"; "Description Véhicule")
                {
                }
            }
        }
    }

    actions
    {
    }
}

