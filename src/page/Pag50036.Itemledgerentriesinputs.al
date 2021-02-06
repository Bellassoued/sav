page 50036 "Item ledger entries inputs"
{
    // version DOC STOCK

    CaptionML = ENU='Inventory Inbound Movement',
                FRA='Entrée de stock enregistré';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Document;
    SourceTable = Table50010;
    SourceTableView = WHERE(Type Mvt=FILTER(Entrée));

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                field("N°";"N°")
                {
                    Editable = false;
                }
                field("Type Mvt";"Type Mvt")
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("N° Client";"N° Client")
                {
                }
                field("Date comptabilisation";"Date comptabilisation")
                {
                    Editable = false;
                }
                field("Cree par";"Cree par")
                {
                    Editable = false;
                }
                field("Valide par";"Valide par")
                {
                    Editable = false;
                }
                field("Numero de Chassis";"Numero de Chassis")
                {
                }
                field("Modèle Vehicule";"Modèle Vehicule")
                {
                }
                field("Code Variante";"Code Variante")
                {
                }
                field("Description Véhicule";"Description Véhicule")
                {
                }
            }
            part(SubPage1;50035)
            {
                SubPageLink = Document No.=FIELD(N°);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                CaptionML = ENU='Print',
                            FRA='Imprimer';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    RecLItemJournalLine : Record "83";
                begin
                    RecEcritArt.RESET;
                    RecEcritArt.SETRANGE("Document No.","N°");
                    IF RecEcritArt.FINDFIRST THEN
                    BEGIN
                        REPORT.RUN(60055,TRUE,FALSE,RecEcritArt);
                    END;
                end;
            }
        }
    }

    var
        OptGTypeMvt : Option "0","1";
        UserMngt : Codeunit "5700";
        RecEcritArt : Record "32";
        Tex001 : Label 'Ce document ne peut être modifié';
}

