page 60061 "Liste Nomenclature ServiceRap"
{
    // version SAV Automobile

    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60011;
    SourceTableView = SORTING(Nbre de Km);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vehicule No.";"Vehicule No.")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field("Kit No.";"Kit No.")
                {
                }
                field("Nbre de Km";"Nbre de Km")
                {
                }
                field("Prix estimatif";"Prix estimatif")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Afficher nomenclature")
            {
                Caption = 'Afficher Nomenclature de Service';
                Image = BOM;
                Promoted = true;
                PromotedIsBig = true;
                RunPageMode = View;

                trigger OnAction();
                begin
                    IF "Kit No." <> '' THEN BEGIN
                      RecGRapSrvBOM.GET("Kit No.");
                      PAGE.RUNMODAL(PAGE::"Rapide service BOM",RecGRapSrvBOM);
                    END
                    ELSE
                      ERROR('Veuillez indiquer une nomenclature !');
                end;
            }
        }
    }

    var
        RecGRapSrvBOM : Record "60013";
        RecBomHeader : Record "60013";
}

