page 60069 "Rapide service BOM"
{
    // version NAVW17.00

    CaptionML = ENU='Rapide Service BOM',
                FRA='Nomenclature de service rapide';
    PageType = ListPlus;
    SourceTable = Table60013;

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                field("No.";"No.")
                {

                    trigger OnAssistEdit();
                    begin
                        //IF AssistEdit(xRec) THEN
                        //  CurrPage.UPDATE;
                    end;
                }
                field(Description;Description)
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field(Status;Status)
                {
                }
                field("Last Date Modified";"Last Date Modified")
                {
                }
                field(Prix;Prix)
                {
                }
            }
            part(ProdBOMLine;60071)
            {
                Editable = Status<>1;
                SubPageLink = Rapid Service BOM No.=FIELD(No.);
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
        area(processing)
        {
            action("Copier Nomenclature")
            {

                trigger OnAction();
                begin

                    RepCopyServiceBOM.InitTargetBom("No.");
                    RepCopyServiceBOM.RUN ;
                end;
            }
        }
    }

    var
        ProdBOMHeader : Record "99000771";
        ProdBOMWhereUsed : Page "99000811";
        ProductionBOMCopy : Codeunit "99000768";
        VersionMgt : Codeunit "99000756";
        ActiveVersionCode : Code[20];
        RepCopyServiceBOM : Report "60026";
        Text001 : ;
}

