page 50198 "Recouvrement commission"
{
    // version CT16V002

    AutoSplitKey = true;
    Caption = 'Recouvrement Line';
    PageType = ListPart;
    Permissions = TableData 112=rim;
    SourceTable = Table70001;
    SourceTableView = WHERE(Commission à payer=CONST(Yes));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Facture";"No. Facture")
                {
                }
                field("No. Bon de commande";"No. Bon de commande")
                {
                }
                field("No. Contrat Leasing";"No. Contrat Leasing")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field("Mnt TTC Facture";"Mnt TTC Facture")
                {
                }
                field("Date Echéance";"Date Echéance")
                {
                    Style = Strong;
                    StyleExpr = true;
                }
                field("Code Client";"Code Client")
                {
                }
                field("Nom Client";"Nom Client")
                {
                }
                field("Date reglement";"Date reglement")
                {
                }
                field("Mnt Reglement";"Mnt Reglement")
                {
                }
                field("Commission théorique";"Commission théorique")
                {
                }
                field("Ecart date Ech. Regl.";"Ecart date Ech. Regl.")
                {
                }
                field("% commission";"% commission")
                {
                }
                field("Commission calculée";"Commission calculée")
                {
                }
                field("Commission à payer";"Commission à payer")
                {
                }
                field("Date proposition commission";"Date proposition commission")
                {
                }
                field("Date paiement commission";"Date paiement commission")
                {
                }
                field("Commission payée";"Commission payée")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Fonction)
            {
                CaptionML = ENU='Fonction',
                            FRA='Fonction';
                action("Get List invoice")
                {
                    AccessByPermission = TableData 112=RM;
                    CaptionML = ENU='Get List invoice',
                                FRA='Extraire list des factures';

                    trigger OnAction();
                    begin
                        UserSetup.GET(USERID);

                        IF NOT UserSetup."Recouvrement PR/SAV" THEN
                        FctGetListInvoice
                        ELSE
                        FctGetListInvoiceArabSoft;
                    end;
                }
            }
        }
    }

    var
        Text001 : Label 'Etape de la bordereau %1 doit être deffirent de %2 ou %3';
        UserSetup : Record "91";

    local procedure FctGetListInvoice();
    var
        RecRecouvrementEntete : Record "70000";
        RecSalesInvoiceHeader : Record "112";
        PagGetInvoice : Page "70005";
        RecServiceInvoiceHeader : Record "5992";
        PagGetServiceInvoice : Page "50104";
    begin
        RecRecouvrementEntete.GET("No. Bord. Recouvrement");
        RecRecouvrementEntete.TESTFIELD(Status,RecRecouvrementEntete.Status::Open);
        RecRecouvrementEntete.TESTFIELD("Code client");
        IF (RecRecouvrementEntete.Etape=RecRecouvrementEntete.Etape::Archiver) OR
            (RecRecouvrementEntete.Etape=RecRecouvrementEntete.Etape::Cloturer) THEN
              ERROR(Text001,"No. Bord. Recouvrement",RecRecouvrementEntete.Etape::Archiver,RecRecouvrementEntete.Etape::Cloturer);
        
        //_________________________________________Facture Chrono et PR
        RecSalesInvoiceHeader.SETCURRENTKEY("No.");
        //RecSalesInvoiceHeader.SETRANGE(Recouvrer,FALSE);
        RecSalesInvoiceHeader.SETFILTER("No. Bordereau",'%1','');
        RecSalesInvoiceHeader.SETFILTER(RecSalesInvoiceHeader."Bill-to Customer No.",'%1',RecRecouvrementEntete."Code client");
        RecSalesInvoiceHeader.SETFILTER(Open,'%1',TRUE);
        //
        PagGetInvoice.SETTABLEVIEW(RecSalesInvoiceHeader);
        PagGetInvoice.LOOKUPMODE := TRUE;
        PagGetInvoice.FctSetRecouvrement(RecRecouvrementEntete);
        IF PagGetInvoice.RUNMODAL <> ACTION::Cancel THEN;
        
        
        
        
        /*
        //____________________________________________Facture service
        RecServiceInvoiceHeader.SETCURRENTKEY("No.");
        RecServiceInvoiceHeader.SETFILTER("No. Bordereau Recouv.",'%1','');
        RecServiceInvoiceHeader.SETFILTER("Bill-to Customer No.",'%1',RecRecouvrementEntete."Code client");
        PagGetServiceInvoice.SETTABLEVIEW(RecServiceInvoiceHeader);
        PagGetServiceInvoice.LOOKUPMODE := TRUE;
        PagGetServiceInvoice.FctSetRecouvrement(RecRecouvrementEntete);
        IF PagGetServiceInvoice.RUNMODAL <> ACTION::Cancel THEN;
        */

    end;

    local procedure FctGetListInvoiceArabSoft();
    var
        RecRecouvrementEntete : Record "70000";
        RecCusLeadgerEntry : Record "21";
        PagGetInvoice : Page "69098";
    begin
        RecRecouvrementEntete.GET("No. Bord. Recouvrement");
        RecRecouvrementEntete.TESTFIELD(Status,RecRecouvrementEntete.Status::Open);
        RecRecouvrementEntete.TESTFIELD("Code client");
        IF (RecRecouvrementEntete.Etape=RecRecouvrementEntete.Etape::Archiver) OR
            (RecRecouvrementEntete.Etape=RecRecouvrementEntete.Etape::Cloturer) THEN
              ERROR(Text001,"No. Bord. Recouvrement",RecRecouvrementEntete.Etape::Archiver,RecRecouvrementEntete.Etape::Cloturer);

        //_________________________________________Facture Chrono et PR
        RecCusLeadgerEntry.SETCURRENTKEY("Customer No.");
        //RecSalesInvoiceHeader.SETRANGE(Recouvrer,FALSE);
        RecCusLeadgerEntry.SETFILTER("No. Bordereau",'%1','');
        RecCusLeadgerEntry.SETFILTER("Customer No.",'%1', RecRecouvrementEntete."Code client");
        RecCusLeadgerEntry.SETFILTER("Document Type",'%1',RecCusLeadgerEntry."Document Type"::Invoice);
        RecCusLeadgerEntry.SETFILTER(Open,'%1',TRUE);
        //
        PagGetInvoice.SETTABLEVIEW(RecCusLeadgerEntry);
        PagGetInvoice.LOOKUPMODE := TRUE;
        PagGetInvoice.FctSetRecouvrement(RecRecouvrementEntete);
        IF PagGetInvoice.RUNMODAL <> ACTION::Cancel THEN;

    end;
}

