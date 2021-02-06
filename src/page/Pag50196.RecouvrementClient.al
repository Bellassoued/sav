page 50196 "Recouvrement Client"
{
    // version CT16V002

    DeleteAllowed = false;
    PageType = Document;
    Permissions = TableData 21=rm,
                  TableData 112=rim;
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
                field("Crée par";"Crée par")
                {
                }
                field("Code coursier";"Code coursier")
                {
                }
                field("Nom coursier";"Nom coursier")
                {
                }
                field(Mois;Mois)
                {
                    Visible = false;
                }
                field(Année;Année)
                {
                    Visible = false;
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
                    Visible = false;
                }
                field(Etape;Etape)
                {
                    Visible = false;
                }
                field("Commission proposée";"Commission proposée")
                {
                }
                field("Commission payée";"Commission payée")
                {
                }
            }
            part(Clients;50197)
            {
                CaptionML = ENU='Clients',
                            FRA='Clients';
                SubPageLink = Code recouvreur=FIELD(Code coursier);
                SubPageView = WHERE(Balance=FILTER(<>0));
            }
            part(;70001)
            {
                SubPageLink = No. Bord. Recouvrement=FIELD(No. Bord. Recouvrement);
                UpdatePropagation = Both;
            }
            part("Proposition commission";50198)
            {
                CaptionML = ENU='Proposition commission',
                            FRA='Proposition commission';
                SubPageLink = No. Bord. Recouvrement=FIELD(No. Bord. Recouvrement);
                SubPageView = SORTING(No. Bord. Recouvrement,No. Ligne)
                              WHERE(Commission payée=CONST(No));
                UpdatePropagation = Both;
            }
            part(;70004)
            {
                SubPageLink = No. Bord. Recouvrement=FIELD(No. Bord. Recouvrement);
                UpdatePropagation = Both;
                Visible = false;
            }
            part("Commissions payées";50198)
            {
                CaptionML = ENU='Commissions payées',
                            FRA='Commissions payées';
                SubPageLink = No. Bord. Recouvrement=FIELD(No. Bord. Recouvrement);
                SubPageView = SORTING(No. Bord. Recouvrement,No. Ligne)
                              WHERE(Commission payée=CONST(Yes));
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
                    Visible = false;

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
                    Visible = false;

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
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        CurrPage.SETSELECTIONFILTER(Rec);
                        REPORT.RUNMODAL(REPORT::"Bordereau Recouvrement 2",TRUE,FALSE,Rec);
                        CurrPage.UPDATE;
                    end;
                }
                action("Imprimer Remis Coursier")
                {
                    Caption = 'Imprimer Remis Coursier';
                    Image = PrintDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

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
                    Visible = false;

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
                    Visible = false;

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
                    Visible = false;

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
                    Visible = false;

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
                    Visible = false;

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
                action("Get List invoice")
                {
                    AccessByPermission = TableData 112=RM;
                    CaptionML = ENU='Get List invoice',
                                FRA='Extraire list des factures';
                    Image = GetLines;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        UserSetup.GET(USERID);

                        //IF NOT UserSetup."Recouvrement PR/SAV" THEN
                          FctGetListInvoice;
                        //ELSE
                        //FctGetListInvoiceArabSoft;
                        MESSAGE('Extraction terminée');
                    end;
                }
                action("Calculer Commission")
                {
                    Image = CalculateSimulation;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        RecouvrementEntete.RESET;
                        RecouvrementEntete.SETRANGE("No. Bord. Recouvrement","No. Bord. Recouvrement");
                        RecouvrementLineG.FINDFIRST;
                        CLEAR(CalculCommissionRecouvrement);
                        CalculCommissionRecouvrement.SETTABLEVIEW(RecouvrementEntete);
                        CalculCommissionRecouvrement.RUN;
                    end;
                }
                action("Valider paiement commission ")
                {
                    Image = Check;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        RecouvrementLine.RESET;
                        RecouvrementLine.SETRANGE("No. Bord. Recouvrement","No. Bord. Recouvrement");
                        RecouvrementLine.SETRANGE("Commission à payer",TRUE);
                        RecouvrementLine.SETRANGE("Commission payée",FALSE);
                        IF RecouvrementLine.FINDSET THEN BEGIN
                          REPEAT
                          RecouvrementLine."Commission payée":=TRUE;
                          RecouvrementLine."Date paiement commission":=TODAY;
                          RecouvrementLine.MODIFY;
                          UNTIL RecouvrementLine.NEXT=0;
                        END;
                    end;
                }
                action("Imprimer relevé commissions")
                {
                    Image = Print;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        RecouvrementEntete.RESET;
                        RecouvrementEntete.SETRANGE("No. Bord. Recouvrement","No. Bord. Recouvrement");
                        RecouvrementLineG.FINDFIRST;
                        CLEAR(CommissionRecouvrement);
                        CommissionRecouvrement.SETTABLEVIEW(RecouvrementEntete);
                        CommissionRecouvrement.RUN;
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
        RecouvrementLineG : Record "70001";
        Parametrescommissionrecouv : Record "50124";
        CustomerG : Record "18";
        UserSetup : Record "91";
        RecouvrementLine : Record "70001";
        CalculCommissionRecouvrement : Report "50146";
        RecouvrementEntete : Record "70000";
        CommissionRecouvrement : Report "50145";

    local procedure FctGetListInvoice();
    var
        RecRecouvrementEntete : Record "70000";
        RecSalesInvoiceHeader : Record "112";
        PagGetInvoice : Page "70005";
        RecServiceInvoiceHeader : Record "5992";
        PagGetServiceInvoice : Page "50104";
        CustLedgerEntryL : Record "21";
        CustomerL : Record "18";
    begin
        TESTFIELD("Code coursier");
        TESTFIELD(Status,Status::Open);
        //RecRecouvrementEntete.TESTFIELD("Code client");
        CustomerL.RESET;
        CustomerL.SETRANGE("Code recouvreur","Code coursier");
        CustomerL.FINDSET;
        REPEAT
        CustLedgerEntryL.RESET;
        //_________________________________________Facture Chrono et PR
        CustLedgerEntryL.SETCURRENTKEY("Entry No.");
        //RecSalesInvoiceHeader.SETRANGE(Recouvrer,FALSE);
        CustLedgerEntryL.SETFILTER("No. Bordereau",'%1','');
        CustLedgerEntryL.SETFILTER("Customer No.",'%1',CustomerL."No.");
        //CustLedgerEntryL.SETFILTER(Open,'%1',TRUE);
        CustLedgerEntryL.SETFILTER("Source Code",'<>%1','VTEOD');
        CustLedgerEntryL.SETFILTER("Code Activité",'PR|SAV|CHRONO');
        CustLedgerEntryL.SETRANGE("Document Type",CustLedgerEntryL."Document Type"::Invoice);
        IF  CustLedgerEntryL.FINDSET THEN
          REPEAT

            RecouvrementLine.INIT;
            RecouvrementLine.VALIDATE("No. Bord. Recouvrement","No. Bord. Recouvrement");
            RecouvrementLine."No. Ligne":=GetNextLineNo("No. Bord. Recouvrement");
            RecouvrementLine.INSERT(TRUE);
            IF CustLedgerEntryL."Code Activité"='PR' THEN BEGIN
              RecSalesInvoiceHeader.GET(CustLedgerEntryL."Document No.");
              RecSalesInvoiceHeader.CALCFIELDS(Amount,"Amount Including VAT","Remaining Amount");
              RecouvrementLine."Mnt TTC Facture":=RecSalesInvoiceHeader."Amount Including VAT";
          END ELSE BEGIN
              RecServiceInvoiceHeader.GET(CustLedgerEntryL."Document No.");
              RecServiceInvoiceHeader.CALCFIELDS(Amount,"Amount Including VAT");
              RecouvrementLine."Mnt TTC Facture":=RecServiceInvoiceHeader."Amount Including VAT";
          END;
          RecouvrementLine."No. Facture":=CustLedgerEntryL."Document No.";

          RecouvrementLine."Mnt Ouvert":=CustLedgerEntryL."Remaining Amount";
          RecouvrementLine."Date Echéance":=CustLedgerEntryL."Due Date";
          RecouvrementLine."Date Facture":=CustLedgerEntryL."Posting Date";
          RecouvrementLine."Centre ge gestion":=CustLedgerEntryL."Responsibility Center";
          RecouvrementLine."No Sequence Document No.":=CustLedgerEntryL."Entry No.";
          RecouvrementLine.VALIDATE("Code Client",CustLedgerEntryL."Customer No.");
          //RecouvrementLine."Nom Client":=CustLedgerEntryL.Name;
          RecouvrementLine.VALIDATE("Code coursier","Code coursier");
         // RecouvrementLine.VALIDATE(Recouvreur,"Code recouvreur");
          RecouvrementLine.MODIFY;
          CustLedgerEntryL."No. Bordereau":="No. Bord. Recouvrement";
          CustLedgerEntryL.MODIFY;
        UNTIL CustLedgerEntryL.NEXT=0;

        UNTIL CustomerL.NEXT=0;
    end;

    local procedure GetNextLineNo(BordRecouv : Code[20]) : Integer;
    var
        RecouvrementLineL : Record "70001";
    begin
        RecouvrementLineL.RESET;
        RecouvrementLineL.SETRANGE("No. Bord. Recouvrement",BordRecouv);
        IF RecouvrementLineL.FINDLAST THEN
          EXIT(RecouvrementLineL."No. Ligne"+100);
        EXIT(100);
    end;
}

