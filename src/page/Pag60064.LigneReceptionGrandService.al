page 60064 "Ligne Reception Grand Service"
{
    PageType = ListPart;
    SourceTable = Table60012;
    SourceTableView = WHERE(Garantie=FILTER(No),
                            Type Effet CLT=CONST(EFFET CLIENT));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Num ligne";"Num ligne")
                {
                }
                field("Code Symptome";"Code Symptome")
                {
                }
                field("Description symptome";"Description symptome")
                {
                    Editable = true;
                }
                field(ACCEPTE;ACCEPTE)
                {
                    Visible = false;
                }
                field("Instruction No.";"Instruction No.")
                {
                }
                field("Instruction Description";"Instruction Description")
                {
                    Editable = false;
                }
                field(Complément;Complément)
                {
                    Editable = false;
                }
                field("Date création";"Date création")
                {
                }
                field("Créé par";"Créé par")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Copier Effet Client")
            {
                Caption = 'Copier Effet Client';
                Image = Copy;
                Promoted = true;

                trigger OnAction();
                begin
                    IF NOT Copie THEN
                      BEGIN
                    VALIDATE(Copie,TRUE);
                    MODIFY;
                    IF Copie  THEN BEGIN
                      RecLigneReceptionGrandService.INIT;
                      RecLigneReceptionGrandService.TRANSFERFIELDS(Rec);
                      RecLigneReceptionGrandService."Type Effet CLT" := RecLigneReceptionGrandService."Type Effet CLT"::LDT;
                      RecLigneReceptionGrandService.Statut           := RecLigneReceptionGrandService.Statut::Approuvée;
                      RecLigneReceptionGrandService.INSERT(TRUE);
                      CurrPage.UPDATE;
                    END;
                    END
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        DejaCopiee:=FALSE;
        IF Copie THEN
          DejaCopiee:=TRUE;
    end;

    trigger OnAfterGetRecord();
    begin
        //KT SAV 020317

        DejaCopiee:=FALSE;
        IF Copie THEN
          DejaCopiee:=TRUE;
        GRecReceptionSAV.RESET;
        IF GRecReceptionSAV.GET("Reception No") THEN
          IF (GRecReceptionSAV."Nbre Impressions">0)THEN
            //GBoolInsertionAutorisee:=FALSE;


        //END KT
    end;

    trigger OnDeleteRecord() : Boolean;
    begin
        IF DejaCopiee THEN
          ERROR('Vous ne pouvez pas supprimer une ligne déjà copiée');
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        //SM MAZDA19
        Garantie := WarrantyCard;

        //SM SAV0045
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        //SM 091117
        UserSetup.GET(USERID);
        IF NOT UserSetup."Modifié Effet OR" THEN
          IF DejaCopiee THEN
            ERROR('Vous ne pouvez pas modifier une ligne déjà copiée');
        //END SM
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        //KT SAV 090317

        DejaCopiee:=FALSE;
        GRecReceptionSAV.RESET;
        IF GRecReceptionSAV.GET("Reception No") THEN
          IF GRecReceptionSAV."Nbre Impressions">0 THEN BEGIN
            Complément:=TRUE;
          END;
        Statut:=Statut::Création;
        //END KT
    end;

    trigger OnOpenPage();
    begin
        //KT SAV 020317
        GBoolInsertionAutorisee:=TRUE;
        //END KT
    end;

    var
        WarrantyCard : Boolean;
        RecLigneReceptionGrandService : Record "60012";
        GBoolInsertionAutorisee : Boolean;
        GRecReceptionSAV : Record "60008";
        DejaCopiee : Boolean;
        UserSetup : Record "91";

    procedure SetFromWarrantyCard();
    begin
        //SM MAZDA19
        WarrantyCard := TRUE;
    end;
}

