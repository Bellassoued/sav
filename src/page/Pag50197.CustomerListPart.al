page 50197 "Customer ListPart"
{
    // version NAVW111.00.00.23572

    // T180001 KT 18/10/2018 : upgrade

    CaptionML = ENU='Customers',
                FRA='Clients';
    CardPageID = "Customer Card";
    Editable = false;
    PageType = ListPart;
    PromotedActionCategoriesML = ENU='New,Process,Report,Approve,New Document,Request Approval,Customer',
                                 FRA='Nouveau,Traiter,État,Approuver,Nouveau document,Demander une approbation,Client';
    RefreshOnActivate = true;
    SourceTable = Table18;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                    ApplicationArea = All;
                    ToolTipML = ENU='Specifies the number of the involved entry or record, according to the specified number series.',
                                FRA='Spécifie le numéro de l''écriture ou de l''enregistrement concerné, en fonction de la souche de numéros spécifiée.';
                }
                field("No. 2";"No. 2")
                {
                }
                field(Name;Name)
                {
                    ApplicationArea = All;
                    ToolTipML = ENU='Specifies the customer''s name. This name will appear on all sales documents for the customer. You can enter a maximum of 50 characters, both numbers and letters.',
                                FRA='Spécifie le nom du client. Ce nom apparaîtra sur tous les documents vente destinés au client. Vous pouvez entrer au maximum 50 caractères, des chiffres et des lettres.';
                }
                field("Name 2";"Name 2")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.',
                                FRA='Spécifie le code du centre de gestion, tel qu''un centre de distribution, associé à l''utilisateur, la société, le client ou le fournisseur concerné.';
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies from which location sales to this customer will be processed by default.',
                                FRA='Spécifie à partir de quel magasin les ventes à ce client seront traitées par défaut.';
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the postal code.',
                                FRA='Spécifie le code postal.';
                    Visible = false;
                }
                field("Country/Region Code";"Country/Region Code")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the country/region of the address.',
                                FRA='Spécifie le pays/la région de l''adresse.';
                    Visible = false;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the customer''s telephone number.',
                                FRA='Spécifie le numéro de téléphone du client.';
                }
                field("IC Partner Code";"IC Partner Code")
                {
                    ApplicationArea = Intercompany;
                    ToolTipML = ENU='Specifies the customer''s intercompany partner code.',
                                FRA='Spécifie le code partenaire intersociété du client.';
                    Visible = false;
                }
                field(Contact;Contact)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the name of the person you regularly contact when you do business with this customer.',
                                FRA='Spécifie le nom de la personne que vous contactez régulièrement lorsque vous traitez avec ce client.';
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies a code for the salesperson who normally handles this customer''s account.',
                                FRA='Spécifie un code pour le vendeur qui s''occupe habituellement du compte de ce client.';
                    Visible = false;
                }
                field(Balance;Balance)
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
                        //ELSE
                        //FctGetListInvoiceArabSoft;
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
                        //CurrPage.SETSELECTIONFILTER(Rec);
                        TESTFIELD("Code recouvreur");
                        RecouvrementEntete.RESET;
                        RecouvrementEntete.SETRANGE("Code coursier","Code recouvreur");
                        RecouvrementEntete.FINDFIRST;
                        BordereauRecouvrement.SETTABLEVIEW(RecouvrementEntete);
                        BordereauRecouvrement.SetCustomerNo("No.");
                        BordereauRecouvrement.RUN;
                        CurrPage.UPDATE;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        CRMCouplingManagement : Codeunit "5331";
        WorkflowWebhookManagement : Codeunit "1543";
    begin
    end;

    trigger OnInit();
    begin
        //SetCustomerNoVisibilityOnFactBoxes;

        //CaptionTxt := CurrPage.CAPTION;
        //SetCaption(CaptionTxt);
        //CurrPage.CAPTION(//aptionTxt);
    end;

    trigger OnOpenPage();
    var
        CRMIntegrationManagement : Codeunit "5330";
    begin
        //CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;

        //SetWorkflowManagementEnabledState;
        SETFILTER("Date Filter",'..%1',WORKDATE);

        // Contextual Power BI FactBox: filtering available reports, setting context, loading Power BI related user settings
    end;

    var
        UserSetup : Record "91";
        EmployeeG : Record "5200";
        RecouvrementLine : Record "70001";
        BordereauRecouvrement : Report "70000";
        RecouvrementEntete : Record "70000";

    local procedure FctGetListInvoice();
    var
        RecRecouvrementEntete : Record "70000";
        RecSalesInvoiceHeader : Record "112";
        PagGetInvoice : Page "70005";
        RecServiceInvoiceHeader : Record "5992";
        PagGetServiceInvoice : Page "50104";
        CustLedgerEntryL : Record "21";
    begin
        TESTFIELD("Code recouvreur");
        RecRecouvrementEntete.RESET;
        RecRecouvrementEntete.SETRANGE("Code coursier","Code recouvreur");
        RecRecouvrementEntete.FINDFIRST;
        RecRecouvrementEntete.TESTFIELD(Status,RecRecouvrementEntete.Status::Open);
        //RecRecouvrementEntete.TESTFIELD("Code client");

        CustLedgerEntryL.RESET;
        //_________________________________________Facture Chrono et PR
        CustLedgerEntryL.SETCURRENTKEY("Entry No.");
        //RecSalesInvoiceHeader.SETRANGE(Recouvrer,FALSE);
        CustLedgerEntryL.SETFILTER("No. Bordereau",'%1','');
        CustLedgerEntryL.SETFILTER("Customer No.",'%1',"No.");
        CustLedgerEntryL.SETFILTER(Open,'%1',TRUE);
        CustLedgerEntryL.SETFILTER("Code Activité",'PR|SAV|CHRONO');
        CustLedgerEntryL.SETRANGE("Document Type",CustLedgerEntryL."Document Type"::Invoice);
        IF NOT CustLedgerEntryL.FINDSET THEN
          EXIT;
        REPEAT

          RecouvrementLine.INIT;
          RecouvrementLine.VALIDATE("No. Bord. Recouvrement",RecRecouvrementEntete."No. Bord. Recouvrement");
          RecouvrementLine."No. Ligne":=GetNextLineNo(RecRecouvrementEntete."No. Bord. Recouvrement");
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
          RecouvrementLine.VALIDATE("Code coursier","Code recouvreur");
         // RecouvrementLine.VALIDATE(Recouvreur,"Code recouvreur");
          RecouvrementLine.MODIFY;
        UNTIL CustLedgerEntryL.NEXT=0;

        //
        // RecServiceInvoiceHeader.RESET;
        // //_________________________________________Facture Chrono et PR
        // RecServiceInvoiceHeader.SETCURRENTKEY("No.");
        // //RecServiceInvoiceHeader.SETRANGE(Recouvrer,FALSE);
        // //RecServiceInvoiceHeader.SETFILTER("No. Bordereau",'%1','');
        // RecServiceInvoiceHeader.SETFILTER(RecServiceInvoiceHeader."Bill-to Customer No.",'%1',"No.");
        // RecServiceInvoiceHeader.SETFILTER(,'%1',TRUE);
        // RecServiceInvoiceHeader.SETRANGE("Order Type",RecServiceInvoiceHeader."Order Type"::PR);
        //
        // IF NOT RecServiceInvoiceHeader.FINDSET THEN
        //  EXIT;
        // REPEAT
        //  RecServiceInvoiceHeader.CALCFIELDS(Amount,"Amount Including VAT","Remaining Amount");
        //  RecouvrementLine.INIT;
        //  RecouvrementLine.VALIDATE("No. Bord. Recouvrement",RecRecouvrementEntete."No. Bord. Recouvrement");
        //  RecouvrementLine."No. Ligne":=GetNextLineNo(RecRecouvrementEntete."No. Bord. Recouvrement");
        //  RecouvrementLine.INSERT(TRUE);
        //  RecouvrementLine."No. Facture":=RecServiceInvoiceHeader."No.";
        //  RecouvrementLine."Mnt TTC Facture":=RecServiceInvoiceHeader."Amount Including VAT";
        //  RecouvrementLine."Mnt Ouvert":=RecServiceInvoiceHeader."Remaining Amount";
        //  RecouvrementLine."Date Echéance":=RecServiceInvoiceHeader."Due Date";
        //  RecouvrementLine."Date Facture":=RecServiceInvoiceHeader."Posting Date";
        //  RecouvrementLine."Centre ge gestion":=RecServiceInvoiceHeader."Responsibility Center";
        //  RecouvrementLine.MODIFY;
        // UNTIL RecServiceInvoiceHeader.NEXT=0;
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

