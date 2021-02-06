page 70000 "Recouvrement"
{
    // version CT16V002

    DeleteAllowed = false;
    PageType = Document;
    Permissions = TableData 112=rim;
    SourceTable = Table70000;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No. Bord. Recouvrement";"No. Bord. Recouvrement")
                {
                    Editable = false;
                }
                field("Code client";"Code client")
                {
                }
                field("Date Creation";"Date Creation")
                {
                }
                field("Crée par";"Crée par")
                {
                }
                field("Date Modification";"Date Modification")
                {
                }
                field("Modifier par";"Modifier par")
                {
                }
                field("Date impression";"Date impression")
                {
                    CaptionML = ENU='Printed Date',
                                FRA='Date Impression';
                }
                field("Nbre impression";"Nbre impression")
                {
                }
                field(Status;Status)
                {
                    Editable = true;
                }
                field(Etape;Etape)
                {
                }
            }
            part(;70001)
            {
                AccessByPermission = TableData 112=RM;
                SubPageLink = No. Bord. Recouvrement=FIELD(No. Bord. Recouvrement);
                UpdatePropagation = Both;
            }
            part(;70003)
            {
                SubPageLink = No. Bord. Recouvrement=FIELD(No. Bord. Recouvrement);
                UpdatePropagation = Both;
            }
            part(;70004)
            {
                SubPageLink = No. Bord. Recouvrement=FIELD(No. Bord. Recouvrement);
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Function)
            {
                CaptionML = ENU='Function',
                            FRA='Fonction';
                action(Reouvrir)
                {
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        IF Status = Status::Open THEN
                          EXIT;
                        Status := Status::Open;
                        MODIFY(TRUE);
                    end;
                }
                action(Lancer)
                {
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        IF Status = Status::Released THEN
                          EXIT;
                        Status := Status::Released;
                        MODIFY(TRUE);
                    end;
                }
                action(ImprimerBRR)
                {
                    Caption = 'Imprimer Bordereau de Recouvrement';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CurrPage.SETSELECTIONFILTER(Rec);
                        REPORT.RUNMODAL(REPORT::"Bordereau Recouvrement",TRUE,FALSE,Rec);
                        CurrPage.UPDATE;
                    end;
                }
                action("Imprimer Remis Coursier")
                {
                    Caption = 'Imprimer Remis Coursier';
                    Image = PrintDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CurrPage.SETSELECTIONFILTER(Rec);
                        REPORT.RUNMODAL(REPORT::"Remis Coursier BRV",TRUE,FALSE,Rec);
                    end;
                }
                action("Valider Remise BR")
                {
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        LRecRecouvrementLine : Record "70001";
                    begin
                        LRecRecouvrementLine.FctUpdateRecouverLine(Rec,1);
                        Etape := Etape :: "En Cours";
                    end;
                }
                action("Valider Reception Décharge")
                {
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        LRecRecouvrementLine : Record "70001";
                    begin
                        LRecRecouvrementLine.FctUpdateRecouverLine(Rec,2);
                        Etape := Etape :: "En Cours";
                    end;
                }
                action("Calculer Ecart Date")
                {
                    Image = Calculate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        LRecRecouvrementLine : Record "70001";
                    begin
                        LRecRecouvrementLine.FctCalcEcratDateReglEcheance(Rec);
                    end;
                }
                action(Cloturer)
                {
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        LRecRecouvrementLine : Record "70001";
                    begin
                        TESTFIELD(Etape,Etape::"En Cours");
                        IF LRecRecouvrementLine.FctTestEtapeBordereau(Rec) THEN
                          ERROR(Text003)
                           ELSE
                            Etape := Etape::Cloturer
                    end;
                }
                action(Archiver)
                {
                    Image = Archive;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        LRecArchiveRecvrmentEntete : Record "70002";
                        LRecArchiveRecvmentLine : Record "70003";
                        LRecRecouvrementLine : Record "70001";
                    begin

                        TESTFIELD(Etape,Etape::Cloturer);
                        IF Etape = Etape::Cloturer THEN
                          BEGIN
                            LRecArchiveRecvrmentEntete.SETRANGE("No. Bord. Recouvrement","No. Bord. Recouvrement");
                            IF NOT LRecArchiveRecvrmentEntete.FINDFIRST THEN BEGIN
                              LRecArchiveRecvrmentEntete.TRANSFERFIELDS(Rec);
                              Etape := Etape :: Archiver;
                              LRecArchiveRecvrmentEntete.Etape := Etape :: Archiver;
                              LRecArchiveRecvrmentEntete.INSERT;
                              LRecRecouvrementLine.SETRANGE("No. Bord. Recouvrement","No. Bord. Recouvrement");
                              IF LRecRecouvrementLine.FINDSET THEN
                                REPEAT
                                  LRecArchiveRecvmentLine.TRANSFERFIELDS(LRecRecouvrementLine);
                                  LRecArchiveRecvmentLine.INSERT;

                                UNTIL LRecRecouvrementLine.NEXT = 0 ;
                              MESSAGE(Text001,"No. Bord. Recouvrement");
                            END ELSE
                                  ERROR(Text002,"No. Bord. Recouvrement");
                          END ELSE
                              ERROR(Text004);
                    end;
                }
            }
        }
    }

    var
        Text001 : Label 'Document %1 Archiver !';
        Text002 : Label 'Document %1 est  Archivé !';
        Text003 : Label 'Il y a une ou des lignes non traiter !';
        Text004 : Label 'L''Etat du bordereau doit être Cloturer !';
}

