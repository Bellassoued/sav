page 50011 "Liste Sortie Stock montage"
{
    // version DOC STOCK,CT16V001

    CardPageID = "document Sortie stock Montage";
    Editable = false;
    PageType = List;
    SourceTable = 50009;
    SourceTableView = SORTING(N°)
                      WHERE(Type Mvt=CONST(Sortie),
                            Type origine=CONST(Montage));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Type Mvt"; "Type Mvt")
                {
                }
                field("N°"; "N°")
                {
                }
                field("Transfer-to Code"; "Transfer-to Code")
                {
                }
                field("N° Souche"; "N° Souche")
                {
                }
                field("Date comptabilisation"; "Date comptabilisation")
                {
                }
                field("Cree par"; "Cree par")
                {
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Document de stock")
            {
                Caption = 'Document de stock';
                action(Fiche)
                {
                    Caption = 'Fiche';
                    ShortCutKey = 'Ctrl+F7';

                    trigger OnAction();
                    begin
                        IF "Type Mvt" = "Type Mvt"::Transfert THEN
                            PAGE.RUN(PAGE::Page50227, Rec)
                        ELSE
                            PAGE.RUN(PAGE::Page50226, Rec)
                    end;
                }
            }
        }
    }
}

