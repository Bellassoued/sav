page 60070 "Rapide Service BOM list"
{
    // version NAVW17.00

    CaptionML = ENU='Rapide Service BOM list',
                FRA='Liste nomenclatures service rapide';
    CardPageID = "Rapide service BOM";
    DataCaptionFields = "No.";
    Editable = false;
    PageType = List;
    SourceTable = Table60013;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Status;Status)
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Nomenclature)
            {
                Image = BOM;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    CLEAR(PGRapdStartBom);
                    PGRapdStartBom.SETRECORD(Rec);
                    PGRapdStartBom.RUNMODAL;
                end;
            }
        }
    }

    var
        ProdBOMWhereUsed : Page "99000811";
        PGRapdStartBom : Page "60069";
}

