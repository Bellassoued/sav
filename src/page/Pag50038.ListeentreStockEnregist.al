page 50038 "Liste entrée Stock Enregisté"
{
    // version DOC STOCK

    CardPageID = "Item ledger entries inputs";
    Editable = false;
    PageType = List;
    SourceTable = Table50010;
    SourceTableView = SORTING(N°)
                      WHERE(Type Mvt=CONST(Entrée),
                            Type origine=CONST(Démontage));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("N°";"N°")
                {
                }
                field("Type Mvt";"Type Mvt")
                {
                }
                field("N° Souche";"N° Souche")
                {
                }
                field("N° Client";"N° Client")
                {
                }
                field("Date comptabilisation";"Date comptabilisation")
                {
                }
                field("Cree par";"Cree par")
                {
                }
                field("Numero de Chassis";"Numero de Chassis")
                {
                }
            }
        }
    }

    actions
    {
    }
}

