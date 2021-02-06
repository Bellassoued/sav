page 50034 "Sorties de stock Montage enreg"
{
    // version DOC STOCK

    CaptionML = ENU='Inventory Outbound Movement',
                FRA='Sorties de stock enregistrés';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Document;
    SourceTable = Table50010;
    SourceTableView = SORTING(N°)
                      WHERE(Type Mvt=CONST(Sortie),
                            Type origine=CONST(Montage));

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
                    CaptionML = ENU='Type',
                                FRA='Type Mouvement';
                    Editable = false;
                }
                field("Type origine";"Type origine")
                {
                    Editable = false;
                }
                field("Sourec Doc Type";"Sourec Doc Type")
                {
                }
                field("Source No.";"Source No.")
                {
                }
                field("Date comptabilisation";"Date comptabilisation")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {

                    trigger OnValidate();
                    var
                        RecLItemJournalLine : Record "83";
                    begin
                    end;
                }
                field(LibelleOrigine;LibelleOrigine)
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
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
                        REPORT.RUN(60056,TRUE,FALSE,RecEcritArt);
                    END;
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin

        IF RecGLocation.GET("Transfer-from Code") THEN
          LibelleOrigine := RecGLocation.Name ;
    end;

    var
        OptGTypeMvt : Option "0","1";
        UserMngt : Codeunit "5700";
        RecEcritArt : Record "32";
        Tex001 : Label 'Ce document ne peut être modifié';
        RecGItemLedgentry : Record "32";
        PgeEcrArticle : Page "60078";
        RecGInventorySetup : Record "313";
        LibelleOrigine : Text[250];
        RecGLocation : Record "14";
}

