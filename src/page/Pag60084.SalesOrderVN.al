page 60084 "Sales Order VN"
{
    // version SAV Automobile,MAZDA71

    CaptionML = ENU='Sales Order ',
                FRA='Commande vente';
    DeleteAllowed = true;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table36;
    SourceTableView = WHERE(Document Type=FILTER(Order));

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
                    Editable = false;
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field("No. 2";"No. 2")
                {
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                    CaptionML = ENU='Sell-to Customer No.',
                                FRA='N° Client';
                    Editable = AdminVte;
                    Importance = Promoted;
                    ShowMandatory = true;

                    trigger OnValidate();
                    begin
                        SelltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {
                    CaptionML = ENU='Sell-to Contact No.',
                                FRA='N° contact';
                    Editable = AdminVte;
                    Importance = Additional;

                    trigger OnValidate();
                    begin
                        IF GETFILTER("Sell-to Contact No.") = xRec."Sell-to Contact No." THEN
                          IF "Sell-to Contact No." <> xRec."Sell-to Contact No." THEN
                            SETRANGE("Sell-to Contact No.");
                    end;
                }
                field(Phone;Phone)
                {
                }
                field("Code Titre Client";"Code Titre Client")
                {
                }
                field("Code Titre Contact";"Code Titre Contact")
                {
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                    CaptionML = ENU='Sell-to Customer Name',
                                FRA='Nom du client';
                    Editable = AdminVte;
                    QuickEntry = false;
                }
                field("Sell-to Address";"Sell-to Address")
                {
                    CaptionML = ENU='Sell-to Address',
                                FRA='Adresse du client';
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Sell-to Address 2";"Sell-to Address 2")
                {
                    CaptionML = ENU='Sell-to Address 2',
                                FRA='Adresse 2 du client';
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                    CaptionML = ENU='Sell-to Post Code',
                                FRA='Code postal Client';
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Sell-to City";"Sell-to City")
                {
                    CaptionML = ENU='Sell-to City',
                                FRA='Ville Client';
                    Editable = AdminVte;
                    QuickEntry = false;
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = AdminVte;
                    QuickEntry = false;
                    ShowMandatory = true;
                }
                field("Order Date";"Order Date")
                {
                    Editable = BlnAdminDate;
                    Importance = Promoted;
                    QuickEntry = false;
                    ShowMandatory = true;
                }
                field("Document Date";"Document Date")
                {
                    Editable = false;
                    QuickEntry = false;
                }
                field("Quote No.";"Quote No.")
                {
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("External Document No.";"External Document No.")
                {
                    CaptionML = ENU='External Document No.',
                                FRA='N° Bon de Commande';
                    Editable = AdminVte;
                    Importance = Promoted;
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    Editable = ChangeSalesperson;
                    QuickEntry = false;
                    ShowMandatory = true;

                    trigger OnValidate();
                    begin
                        SalespersonCodeOnAfterValidate;
                    end;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Editable = ChangeSalesperson;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    Editable = false;
                    Importance = Additional;
                }
                field(Status;Status)
                {
                    Editable = false;
                    Importance = Promoted;
                    QuickEntry = false;
                }
                field("Apply Stamp fiscal";"Apply Stamp fiscal")
                {
                    Editable = AdminVte;
                }
                field("Specific Order";"Specific Order")
                {
                    Editable = AdminVte;
                }
                field("Specific Order No.";"Specific Order No.")
                {
                    DrillDown = false;
                    Editable = false;
                    TableRelation = "Purchase Request Header".No.;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        //MMS
                        RecgPurchaseReq.FILTERGROUP(2);
                        RecgPurchaseReq.SETRANGE(RecgPurchaseReq."No.","Specific Order No.");
                        RecgPurchaseReq.FILTERGROUP(0);
                        PAGE.RUNMODAL(PAGE::"Purchase Request",RecgPurchaseReq);
                        //
                    end;
                }
                field("Location Code";"Location Code")
                {
                    Editable = AdminVte;
                }
                field("Due Date";"Due Date")
                {
                    Editable = AdminVte;
                    Importance = Promoted;
                }
                field("Payment Method Code";"Payment Method Code")
                {
                    Editable = AdminVte;
                    ShowMandatory = true;
                }
                field("Type Paiement";"Type Paiement")
                {
                    Editable = AdminVte;
                    ShowMandatory = true;

                    trigger OnValidate();
                    var
                        RecTypePaiement : Record "60022";
                    begin
                        RecTypePaiement.GET("Type Paiement");
                        IF RecTypePaiement."Avec Contract" THEN
                          BlnEditNoContact := TRUE
                        ELSE BlnEditNoContact := FALSE
                    end;
                }
                field("Avance sur commande";"Avance sur commande")
                {
                    Caption = 'Montant Avance';
                    Editable = AdminVte;
                    Visible = false;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                    Editable = GBoolAllEditable;
                }
                field("Item Source Location";"Item Source Location")
                {
                    Editable = AdminVte;
                }
                field("Num facture origine";"Num facture origine")
                {
                    Editable = AdminVte;
                    Visible = false;
                }
                field("Facture Complémentaire";"Facture Complémentaire")
                {
                    Editable = false;
                }
                field("No BC Complémentaire";"No BC Complémentaire")
                {
                }
                field("Facture autre DMS";"Facture autre DMS")
                {
                }
                field("No. Facture Cession";"No. Facture Cession")
                {
                }
                field("Date Facture Cession";"Date Facture Cession")
                {
                }
                field("Autorisation MOI";"Autorisation MOI")
                {
                    Visible = BoolAutoMoi;
                }
            }
            part(SalesLines;60085)
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    Editable = AdminVte;
                    Importance = Promoted;
                    ShowMandatory = true;

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("No. Contract";"No. Contract")
                {
                    Editable = BlnEditNoContact;
                }
                field("Customer Price Group";"Customer Price Group")
                {
                    Editable = false;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field(Banque;Banque)
                {
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Bill-to Name";"Bill-to Name")
                {
                    Editable = AdminVte;
                }
                field("Bill-to Address";"Bill-to Address")
                {
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Bill-to City";"Bill-to City")
                {
                    Editable = AdminVte;
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Editable = AdminVte;

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Editable = AdminVte;

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Acceptation Facturation";"Acceptation Facturation")
                {
                    Editable = BolEditAccepFact;
                }
                field("Date Acceptation Facturation";"Date Acceptation Facturation")
                {
                    Editable = false;
                }
                field("Réglement réçu";"Réglement réçu")
                {
                    Editable = AdminVte;
                }
                field("date réglement";"date réglement")
                {
                    Editable = false;
                }
                field("Customer Posting Group";"Customer Posting Group")
                {
                }
                field("Currency Code";"Currency Code")
                {
                    Editable = AdminVte;
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        CLEAR(ChangeExchangeRate);
                        IF "Posting Date" <> 0D THEN
                          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date")
                        ELSE
                          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WORKDATE);
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                          VALIDATE("Currency Factor",ChangeExchangeRate.GetParameter);
                          CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;
                }
                field("Approver dépass. Budget Remise";"Approver dépass. Budget Remise")
                {
                }
                field("Date App. Dépass. Budg. remise";"Date App. Dépass. Budg. remise")
                {
                }
                field("Appro. depass. Budg par";"Appro. depass. Budg par")
                {
                }
                group("Compagne & Avantage")
                {
                    field("Campaign No.";"Campaign No.")
                    {
                        Editable = AdminVte;
                    }
                    field("Entretien 10 000";"Entretien 10 000")
                    {
                        Editable = false;
                    }
                    field("Entretien 20 000";"Entretien 20 000")
                    {
                        Editable = false;
                    }
                    field("Entretien 30 000";"Entretien 30 000")
                    {
                        Editable = false;
                    }
                    field("Carte Carburant";"Carte Carburant")
                    {
                        Editable = false;
                    }
                }
            }
            group("Validation comptable")
            {
                field("No Autorisation administrative";"No Autorisation administrative")
                {
                    Editable = GBoolExonerationEditable;
                }
                field("Date Début autorisation Admin.";"Date Début autorisation Admin.")
                {
                    Editable = GBoolExonerationEditable;
                }
                field("Date Fin exonération Admin.";"Date Fin exonération Admin.")
                {
                    Editable = GBoolExonerationEditable;
                }
                field("Demande exonération";"Demande exonération")
                {
                    Editable = GBoolExonerationEditable;
                }
                field("Exonération validée";"Exonération validée")
                {
                    Editable = GBoolAgentComptable;

                    trigger OnValidate();
                    begin
                        IF "Exonération validée" THEN BEGIN
                          TESTFIELD("No Autorisation administrative");
                          TESTFIELD("Date Début autorisation Admin.")
                        END;
                    end;
                }
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRA='Livraison';
                field("Ship-to Code";"Ship-to Code")
                {
                    Editable = AdminVte;
                    Importance = Promoted;
                }
                field("Ship-to Name";"Ship-to Name")
                {
                    Editable = AdminVte;
                }
                field("Ship-to Address";"Ship-to Address")
                {
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    Editable = AdminVte;
                    Importance = Promoted;
                }
                field("Ship-to City";"Ship-to City")
                {
                    Editable = AdminVte;
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                    Editable = AdminVte;
                    Importance = Additional;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    Editable = AdminVte;
                }
                field("Shipping Time";"Shipping Time")
                {
                    Editable = AdminVte;
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                    Editable = AdminVte;
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Confirmation Commande VN";"Confirmation Commande VN")
                {
                    Editable = AdminVte;
                    Visible = false;
                }
                field("Date Confirmation Client";"Date Confirmation Client")
                {
                }
                field("Promised Delivery Date";"Promised Delivery Date")
                {
                    CaptionML = ENU='Promised Delivery Date',
                                FRA='Date livraison prévue';
                    Editable = AdminVte;
                }
                field(Justificatif;Justificatif)
                {
                }
                field(DateReceptDoss;"Date Recept Doss")
                {
                    Caption = 'Date Recept Doss';
                    Editable = ADVDateRecep;

                    trigger OnValidate();
                    begin
                        IF "Date Recept Doss"<>0D THEN
                         TESTFIELD(Justificatif,TRUE);
                    end;
                }
                field(AI;AI)
                {
                    CaptionML = ENU='CI',
                                FRA='CI';
                }
                field("Dossier complet";"Dossier complet")
                {
                    Editable = ADVDateRecep;

                    trigger OnValidate();
                    begin
                        IF "Dossier complet" THEN
                          TESTFIELD(Justificatif,TRUE);
                    end;
                }
                field("Dossier Validé";"Dossier Validé")
                {

                    trigger OnValidate();
                    begin
                        //KT 06112018 Tester si AI utilisé

                        GRecSalesReceivablesSetup.GET;
                        //SM 221117
                        //SM 241117
                        IF "Dossier Validé" THEN BEGIN
                          //TMP CheckToRelease;
                          TESTFIELD(Justificatif,TRUE);

                          TESTFIELD("Dossier complet",TRUE);
                          TESTFIELD("Date Recept Doss");
                          //END 241117
                          IF GRecSalesReceivablesSetup."Utiliser AI VN" THEN BEGIN
                          FctVerifAIHeader;
                          //KT 071217
                          IF NOT "Facturation avant AI" THEN
                            //END KT
                            TESTFIELD(AI,TRUE)
                          END;
                        END;
                    end;
                }
                field("Délai de Livraison";"Délai de Livraison")
                {
                    Editable = AdminVte;
                }
                field("Facturation avant AI";"Facturation avant AI")
                {
                    CaptionML = ENU='Facturation avant CI',
                                FRA='Facturation avant CI';
                }
                field(Commentaire;Commentaire)
                {
                }
                field("Dossier déposé chez transit";"Dossier déposé chez transit")
                {
                }
                field("Date dépôt chez transit";"Date dépôt chez transit")
                {
                }
                field("Date expiration réservation";"Date expiration réservation")
                {
                }
            }
            group(Transit)
            {
                CaptionML = ENU='Transit',
                            FRA='Transit';
                field("Dossier reçu transit";"Dossier reçu transit")
                {

                    trigger OnValidate();
                    begin
                        RecGUserSetup.GET(USERID);
                        IF NOT RecGUserSetup."Transitaire VN" THEN
                          ERROR('Merci de contacter le service transit');
                    end;
                }
                field("Date réception chez transit";"Date réception chez transit")
                {
                }
                field("Dossier en cours de déd";"Dossier en cours de déd")
                {

                    trigger OnValidate();
                    begin
                        RecGUserSetup.GET(USERID);
                        IF NOT RecGUserSetup."Transitaire VN" THEN
                          ERROR('Merci de contacter le service transit');
                    end;
                }
                field("Date dépôt douane";"Date dépôt douane")
                {
                }
                field("CI déposé chez logisitiques";"CI déposé chez logisitiques")
                {

                    trigger OnValidate();
                    begin
                        RecGUserSetup.GET(USERID);
                        IF NOT RecGUserSetup."Transitaire VN" THEN
                          ERROR('Merci de contacter le service transit');
                    end;
                }
                field("Date dépôt CI logistiques";"Date dépôt CI logistiques")
                {
                }
            }
            group(Prepayment)
            {
                CaptionML = ENU='Prepayment',
                            FRA='Acompte';
                Visible = false;
                field("Prepayment %";"Prepayment %")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        Prepayment37OnAfterValidate;
                    end;
                }
                field("Compress Prepayment";"Compress Prepayment")
                {
                }
                field("Prepmt. Payment Terms Code";"Prepmt. Payment Terms Code")
                {
                }
                field("Prepayment Due Date";"Prepayment Due Date")
                {
                    Importance = Promoted;
                }
                field("Prepmt. Payment Discount %";"Prepmt. Payment Discount %")
                {
                }
                field("Prepmt. Pmt. Discount Date";"Prepmt. Pmt. Discount Date")
                {
                }
            }
            group("Transit ")
            {
                CaptionML = ENU='Transit ',
                            FRA='Transit ';
            }
        }
        area(factboxes)
        {
            part(;9103)
            {
                SubPageLink = Table ID=CONST(36),
                              Document Type=FIELD(Document Type),
                              Document No.=FIELD(No.);
                Visible = OpenApprovalEntriesExistForCurrUser;
            }
            part(;9080)
            {
                SubPageLink = No.=FIELD(Sell-to Customer No.);
                Visible = true;
            }
            part(;9082)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = false;
            }
            part(;9084)
            {
                SubPageLink = No.=FIELD(Sell-to Customer No.);
                Visible = false;
            }
            part(;9087)
            {
                Provider = SalesLines;
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(Document No.),
                              Line No.=FIELD(Line No.);
                Visible = true;
            }
            part(;9089)
            {
                Provider = SalesLines;
                SubPageLink = No.=FIELD(No.);
                Visible = false;
            }
            part(;9092)
            {
                SubPageLink = Table ID=CONST(36),
                              Document Type=FIELD(Document Type),
                              Document No.=FIELD(No.);
                Visible = false;
            }
            part(IncomingDocAttachFactBox;193)
            {
                ShowFilter = false;
                Visible = false;
            }
            part(;9108)
            {
                Provider = SalesLines;
                SubPageLink = No.=FIELD(No.);
                Visible = false;
            }
            part(;9109)
            {
                Provider = SalesLines;
                SubPageLink = No.=FIELD(No.);
                Visible = false;
            }
            part(;9081)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = false;
            }
            part(WorkflowStatus;1528)
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
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
        area(navigation)
        {
            group("O&rder")
            {
                CaptionML = ENU='O&rder',
                            FRA='&Commande';
                Image = "Order";
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    begin
                        CalcInvDiscForHeader;
                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Sales Order Statistics",Rec);
                    end;
                }
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    RunObject = Page 21;
                    RunPageLink = No.=FIELD(Sell-to Customer No.);
                    ShortCutKey = 'Shift+F7';
                }
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
                action("A&pprovals")
                {
                    CaptionML = ENU='A&pprovals',
                                FRA='&Approbations';
                    Image = Approvals;
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalEntries : Page "658";
                    begin
                        ApprovalEntries.Setfilters(DATABASE::"Sales Header","Document Type","No.");
                        ApprovalEntries.RUN;
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 67;
                    RunPageLink = Document Type=FIELD(Document Type),
                                  No.=FIELD(No.),
                                  Document Line No.=CONST(0);
                }
                action("Assembly Orders")
                {
                    CaptionML = ENU='Assembly Orders',
                                FRA='Ordres d''assemblage';
                    Image = AssemblyOrder;
                    Visible = false;

                    trigger OnAction();
                    var
                        AssembleToOrderLink : Record "904";
                    begin
                        AssembleToOrderLink.ShowAsmOrders(Rec);
                    end;
                }
                action("Demande de pièce")
                {
                    Image = Register;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        RecSalesLine : Record "37";
                        RecSalesSetup : Record "311";
                    begin
                        //SM  MAZDA71
                        RecSalesLine.RESET;
                        RecSalesLine.SETRANGE("Document Type","Document Type");
                        RecSalesLine.SETRANGE("Document No.","No.");
                        RecSalesLine.SETRANGE(Type,RecSalesLine.Type::Item);
                        RecSalesSetup.GET;
                        IF RecSalesSetup."Groupe Compta. Véhicule" <> '' THEN
                          RecSalesLine.SETFILTER("Posting Group",'<>%1',RecSalesSetup."Groupe Compta. Véhicule");
                        IF RecSalesLine.FINDSET THEN BEGIN
                          REPEAT
                            RecSalesLine.TESTFIELD("Affecter sur");
                          UNTIL RecSalesLine.NEXT = 0;
                        END;

                        //END SM
                        CDUStockFunction.CreateTransOrderFromSalesOrder("No.");
                    end;
                }
                action("Reception Transfert")
                {
                    Image = TransferOrder;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction();
                    begin

                        RecTransferHeader.SETRANGE(RecTransferHeader."No Service Order","No.");

                        PAGE.RUN(PAGE::"Transfer Order",RecTransferHeader);
                    end;
                }
                action("Import Commande AO")
                {
                    Image = Import;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        ImportCommandeVNAO : XMLport "70047";
                    begin
                        CLEAR(ImportCommandeVNAO);
                        ImportCommandeVNAO.SetDocNo("No.");
                        ImportCommandeVNAO.RUN;
                    end;
                }
                action("Actualiser AI")
                {
                    Visible = false;

                    trigger OnAction();
                    begin
                        //SM 201117
                        FctVerifAIHeader
                    end;
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRA='Documents';
                Image = Documents;
                action("Actualiser affectation")
                {
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        FctAffecterSur;
                    end;
                }
                action("S&hipments")
                {
                    CaptionML = ENU='S&hipments',
                                FRA='Li&vraisons';
                    Image = Shipment;
                    RunObject = Page 142;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                action(Invoices)
                {
                    CaptionML = ENU='Invoices',
                                FRA='Factures';
                    Image = Invoice;
                    RunObject = Page 143;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                action("Approuver Dépass. budget Remise.")
                {
                    Caption = 'Approuver Dépass. budget Remise.';
                    Image = Approval;
                    Visible = AppDepBudg;

                    trigger OnAction();
                    begin
                        CLEAR(RecGUserSetup);
                        RecGUserSetup.GET(USERID);
                        RecGUserSetup.TESTFIELD("D.C.G approve");

                        IF CONFIRM('Eêtes vous sûr devouloir approuver cette commande pour dépassement budget ?',TRUE,FALSE) THEN
                          BEGIN
                            "Approver dépass. Budget Remise" := TRUE;
                            "Appro. depass. Budg par" := USERID;
                            "Date App. Dépass. Budg. remise" := WORKDATE;
                            MODIFY;
                          END;
                    end;
                }
                action("Annuler Approb. Depass. Budget")
                {
                    Caption = 'Annuler Approb. Depass. Budget';
                    Image = Cancel;
                    Visible = AnnAppDepBudg;

                    trigger OnAction();
                    begin
                        CLEAR(RecGUserSetup);
                        RecGUserSetup.GET(USERID);
                        RecGUserSetup.TESTFIELD("D.C.G approve");

                        IF CONFIRM('Eêtes vous sûr devouloir annuler l''approubation pour  cette commande pour dépassement budget ?',TRUE,FALSE) THEN
                          BEGIN
                            "Approver dépass. Budget Remise" := FALSE;
                            "Appro. depass. Budg par" := '';
                            "Date App. Dépass. Budg. remise" := 0D;
                            MODIFY;
                          END;
                    end;
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
                action("In&vt. Put-away/Pick Lines")
                {
                    CaptionML = ENU='In&vt. Put-away/Pick Lines',
                                FRA='Lignes prélè&v./rangement stock';
                    Image = PickLines;
                    RunObject = Page 5774;
                    RunPageLink = Source Document=CONST(Sales Order),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Document,Source No.,Location Code);
                    Visible = false;
                }
                action("Whse. Shipment Lines")
                {
                    CaptionML = ENU='Whse. Shipment Lines',
                                FRA='Lignes expédition entrep.';
                    Image = ShipmentLines;
                    RunObject = Page 7341;
                    RunPageLink = Source Type=CONST(37),
                                  Source Subtype=FIELD(Document Type),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                    Visible = false;
                }
            }
            group(Prepayment)
            {
                CaptionML = ENU='Prepayment',
                            FRA='Acompte';
                Image = Prepayment;
                Visible = false;
                action("Prepa&yment Invoices")
                {
                    CaptionML = ENU='Prepa&yment Invoices',
                                FRA='Factures acom&pte';
                    Image = PrepaymentInvoice;
                    RunObject = Page 143;
                    RunPageLink = Prepayment Order No.=FIELD(No.);
                    RunPageView = SORTING(Prepayment Order No.);
                    Visible = false;
                }
                action("Prepayment Credi&t Memos")
                {
                    CaptionML = ENU='Prepayment Credi&t Memos',
                                FRA='A&voirs acompte';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page 144;
                    RunPageLink = Prepayment Order No.=FIELD(No.);
                    RunPageView = SORTING(Prepayment Order No.);
                    Visible = false;
                }
            }
        }
        area(processing)
        {
            group(Release)
            {
                CaptionML = ENU='Release',
                            FRA='Lancer';
                Image = ReleaseDoc;
                action(Release)
                {
                    CaptionML = ENU='Re&lease',
                                FRA='&Lancer';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    var
                        ReleaseSalesDoc : Codeunit "414";
                        PrepaymentMgt : Codeunit "441";
                        RecLSalesLine : Record "37";
                        RecWarehouseEntry : Record "7312";
                        Bin : Record "7354";
                    begin
                        //SM 280717
                        CheckToRelease();
                        //END SM
                        //VisibiliteRSHOWROOM OR VisibiliteFacturation
                        IF PrepaymentMgt.TestSalesPrepayment(Rec) THEN
                          ERROR(STRSUBSTNO(Text10800,"Document Type","No."));

                        IF PrepaymentMgt.TestSalesPayment(Rec) THEN BEGIN
                          IF NOT CONFIRM(STRSUBSTNO(Text10801,"Document Type","No.")) THEN
                            EXIT;
                          Status := Status::"Pending Prepayment";
                          MODIFY;
                          CurrPage.UPDATE;
                        END ELSE
                          ReleaseSalesDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    CaptionML = ENU='Re&open',
                                FRA='R&ouvrir';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc : Codeunit "414";
                    begin
                        RecGUserSetup.GET(USERID);
                        //IF NOT RecGUserSetup.re droit pour réouvrir commande vente
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                        //ReopenVisible
                    end;
                }
                action("Dossier VN")
                {
                    CaptionML = ENU='Justificatifs dossier VN',
                                FRA='Justificatifs dossier VN';
                    Image = Document;
                    RunObject = Page 60386;
                    RunPageLink = Type Payement=FIELD(Type Paiement),
                                  No Client=FIELD(Sell-to Customer No.),
                                  No. Document=FIELD(No.),
                                  Code Titre=FIELD(Code Titre Client),
                                  Group Compta. Client=FIELD(Customer Posting Group);
                }
                action("Actualiser Prix")
                {
                    Image = CalculateLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    var
                        LRecSalesLine : Record "37";
                    begin
                        IF "Order Type" =  "Order Type"::VN THEN
                         BEGIN
                            LRecSalesLine.SETRANGE("Document Type",LRecSalesLine."Document Type"::Order);
                            LRecSalesLine.SETRANGE("Document No.","No.");
                            LRecSalesLine.SETRANGE("Type VN",LRecSalesLine."Type VN"::Vehicule);
                            IF LRecSalesLine.FINDSET THEN
                              REPEAT
                                //SM 201017
                                LRecSalesLine.SetPriceFromOrderNo(TRUE);
                                //END SM
                                LRecSalesLine.VALIDATE(Quantity,LRecSalesLine.Quantity);
                                LRecSalesLine.MODIFY(TRUE);
                              UNTIL LRecSalesLine.NEXT = 0;
                         END;
                    end;
                }
                action(CommandeAchat)
                {
                    Caption = 'Commande Spécifique';
                    Image = Purchasing;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        CreatePurchaseRequest(Rec,3);
                    end;
                }
                action("Proposer Article")
                {
                    Visible = false;

                    trigger OnAction();
                    begin
                        //<< MMS 09102013
                        CLEAR(RecGPagePropArticle);
                        //Type Document Commande Vente
                        RecGTypeDoc:=2;
                        MESSAGE(Rec."No.");
                        RecGPagePropArticle.SetPurchaseRequest(Rec."No.",RecGTypeDoc);
                        RecGPagePropArticle.RUNMODAL();
                        //>>
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Calculate &Invoice Discount")
                {
                    CaptionML = ENU='Calculate &Invoice Discount',
                                FRA='C&alculer remise facture';
                    Image = CalculateInvoiceDiscount;
                    Visible = false;

                    trigger OnAction();
                    begin
                        ApproveCalcInvDisc;
                    end;
                }
                action("Get St&d. Cust. Sales Codes")
                {
                    CaptionML = ENU='Get St&d. Cust. Sales Codes',
                                FRA='Extraire &codes vente client std';
                    Ellipsis = true;
                    Image = CustomerCode;
                    Visible = false;

                    trigger OnAction();
                    var
                        StdCustSalesCode : Record "172";
                    begin
                        StdCustSalesCode.InsertSalesLines(Rec);
                    end;
                }
                action(CopyDocument)
                {
                    CaptionML = ENU='Copy Document',
                                FRA='Copier document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    begin
                        CopySalesDoc.SetSalesHeader(Rec);
                        CopySalesDoc.RUNMODAL;
                        CLEAR(CopySalesDoc);
                    end;
                }
                action("Move Negative Lines")
                {
                    CaptionML = ENU='Move Negative Lines',
                                FRA='Déplacer lignes négatives';
                    Ellipsis = true;
                    Image = MoveNegativeLines;
                    Visible = false;

                    trigger OnAction();
                    begin
                        CLEAR(MoveNegSalesLines);
                        MoveNegSalesLines.SetSalesHeader(Rec);
                        MoveNegSalesLines.RUNMODAL;
                        MoveNegSalesLines.ShowDocument;
                    end;
                }
                action("Archive Document")
                {
                    CaptionML = ENU='Archi&ve Document',
                                FRA='Archi&ver document';
                    Image = Archive;

                    trigger OnAction();
                    begin
                        ArchiveManagement.ArchiveSalesDocument(Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Send IC Sales Order Cnfmn.")
                {
                    AccessByPermission = TableData 410=R;
                    CaptionML = ENU='Send IC Sales Order Cnfmn.',
                                FRA='Confirmation envoi commande vente IC';
                    Image = IntercompanyOrder;
                    Visible = false;

                    trigger OnAction();
                    var
                        ICInOutboxMgt : Codeunit "427";
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                          ICInOutboxMgt.SendSalesDoc(Rec,FALSE);
                    end;
                }
            }
            group(Plan)
            {
                CaptionML = ENU='Plan',
                            FRA='Planifier';
                Image = Planning;
                Visible = false;
                action("Order &Promising")
                {
                    CaptionML = ENU='Order &Promising',
                                FRA='Pro&messe de livraison';
                    Image = OrderPromising;
                    Visible = false;

                    trigger OnAction();
                    var
                        OrderPromisingLine : Record "99000880" temporary;
                    begin
                        OrderPromisingLine.SETRANGE("Source Type","Document Type");
                        OrderPromisingLine.SETRANGE("Source ID","No.");
                        PAGE.RUNMODAL(PAGE::"Order Promising Lines",OrderPromisingLine);
                    end;
                }
                action("Demand Overview")
                {
                    CaptionML = ENU='Demand Overview',
                                FRA='Aperçu demande';
                    Image = Forecast;
                    Visible = false;

                    trigger OnAction();
                    var
                        DemandOverview : Page "5830";
                    begin
                        DemandOverview.SetCalculationParameter(TRUE);
                        DemandOverview.Initialize(0D,1,"No.",'','');
                        DemandOverview.RUNMODAL;
                    end;
                }
                action("Pla&nning")
                {
                    CaptionML = ENU='Pla&nning',
                                FRA='Pla&nification';
                    Image = Planning;
                    Visible = false;

                    trigger OnAction();
                    var
                        SalesPlanForm : Page "99000883";
                    begin
                        SalesPlanForm.SetSalesOrder("No.");
                        SalesPlanForm.RUNMODAL;
                    end;
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRA='Approbation demande achat';
                Image = SendApprovalRequest;
                Visible = false;
                action(SendApprovalRequest)
                {
                    CaptionML = ENU='Send A&pproval Request',
                                FRA='Envoyer demande d''a&pprobation';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        //SM 280717
                        CheckToRelease();
                        //END SM
                        IF ApprovalsMgmt.CheckSalesApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    CaptionML = ENU='Cancel Approval Re&quest',
                                FRA='Annuler demande d''appro&bation';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
                    end;
                }
                group(Authorize)
                {
                    CaptionML = ENU='Authorize',
                                FRA='Autoriser';
                    Image = AuthorizeCreditCard;
                    Visible = false;
                    action(Authorize)
                    {
                        CaptionML = ENU='Authorize',
                                    FRA='Autoriser';
                        Image = AuthorizeCreditCard;

                        trigger OnAction();
                        begin
                            //KT MIG 90 TO 110 fonction n'existe pas STD Authorize;
                        end;
                    }
                    action("Void A&uthorize")
                    {
                        CaptionML = ENU='Void A&uthorize',
                                    FRA='Annuler l''a&utorisation';
                        Image = VoidCreditCard;

                        trigger OnAction();
                        begin
                            //KT MIG 90 TO 110 fonction n'existe pas STD Void;
                        end;
                    }
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
                Visible = false;
                action("Create Inventor&y Put-away / Pick")
                {
                    CaptionML = ENU='Create Inventor&y Put-away / Pick',
                                FRA='Créer prélèv./rangement stoc&k';
                    Ellipsis = true;
                    Image = CreateInventoryPickup;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    begin
                        CreateInvtPutAwayPick;

                        IF NOT FIND('=><') THEN
                          INIT;
                    end;
                }
                action("Create &Whse. Shipment")
                {
                    CaptionML = ENU='Create &Whse. Shipment',
                                FRA='Créer &expédition entrepôt';
                    Image = NewShipment;
                    Visible = false;

                    trigger OnAction();
                    var
                        GetSourceDocOutbound : Codeunit "5752";
                    begin
                        GetSourceDocOutbound.CreateFromSalesOrder(Rec);

                        IF NOT FIND('=><') THEN
                          INIT;
                    end;
                }
            }
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
                action("Mtre à jour TVA 19")
                {
                    CaptionML = ENU='MAJ TVA',
                                FRA='MAJ TVA 19';
                    Image = VATPostingSetup;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        RecSalesLineTVA : Record "37";
                        ReleaseSalesDocument : Codeunit "414";
                        RecVATProductPostingGroup : Record "324";
                        RecSalesShipmentLine : Record "111";
                        RecSalesHeader : Record "36";
                    begin
                        //IF ("Sales Line"."Qty. Shipped Not Invoiced" = 0) AND ("Sales Line"."Quantity Invoiced" <> 0)THEN
                        //  CurrReport.SKIP ;
                        RecGUserSetup.GET(USERID);
                        //IF (NOT RecGUserSetup."Admin Finance NAV") OR (NOT RecGUserSetup."Responsable Vente PR") THEN
                        //  ERROR('Vous n''avez pas le droit metre à jour les lignes du commande ,Merci de contacter votre administrateur Système!!');
                        RecSalesLineTVA.RESET;
                        RecSalesLineTVA.SETRANGE("Document Type","Document Type");
                        RecSalesLineTVA.SETRANGE("Document No.","No.");
                        IF RecSalesLineTVA.FINDSET THEN
                          REPEAT
                            RecSalesHeader.GET("Document Type","No.");
                            ReleaseSalesDocument.Reopen(RecSalesHeader);
                            IF RecVATProductPostingGroup.GET(RecSalesLineTVA."VAT Prod. Posting Group") AND (RecVATProductPostingGroup.Nature = RecVATProductPostingGroup.Nature::Ancien) THEN
                             BEGIN
                               RecSalesLineTVA.VALIDATE("VAT Prod. Posting Group" ,RecVATProductPostingGroup."Coresp. TVA");
                               RecSalesLineTVA.MODIFY;
                               RecSalesShipmentLine.RESET;
                               RecSalesShipmentLine.SETRANGE("Order No.",RecSalesHeader."No.");
                               RecSalesShipmentLine.SETRANGE("Order Line No.",RecSalesLineTVA."Line No.");
                               RecSalesShipmentLine.SETFILTER("Qty. Shipped Not Invoiced",'<>0');
                               IF RecSalesShipmentLine.FINDSET THEN
                                 REPEAT
                                   RecSalesShipmentLine.VALIDATE("VAT Prod. Posting Group",RecVATProductPostingGroup."Coresp. TVA");
                                   RecSalesShipmentLine.MODIFY;
                                 UNTIL RecSalesShipmentLine.NEXT = 0;
                             END;
                         UNTIL RecSalesLineTVA.NEXT = 0;
                    end;
                }
                action("Mtre à jour TVA 18")
                {
                    CaptionML = ENU='MAJ TVA',
                                FRA='MAJ TVA 18';
                    Image = VATPostingSetup;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        RecSalesLineTVA : Record "37";
                        ReleaseSalesDocument : Codeunit "414";
                        RecVATProductPostingGroup : Record "324";
                        RecSalesShipmentLine : Record "111";
                        RecSalesHeader : Record "36";
                    begin
                        //IF ("Sales Line"."Qty. Shipped Not Invoiced" = 0) AND ("Sales Line"."Quantity Invoiced" <> 0)THEN
                        //  CurrReport.SKIP ;
                        RecGUserSetup.GET(USERID);
                        IF (NOT RecGUserSetup."Admin Finance NAV") OR (NOT RecGUserSetup."Responsable Vente PR") THEN
                          ERROR('Vous n''avez pas le droit metre à jour les lignes du commande ,Merci de contacter votre administrateur Système!!');
                        RecSalesLineTVA.RESET;
                        RecSalesLineTVA.SETRANGE("Document Type","Document Type");
                        RecSalesLineTVA.SETRANGE("Document No.","No.");
                        IF RecSalesLineTVA.FINDSET THEN
                          REPEAT
                            RecSalesHeader.GET("Document Type","No.");
                            ReleaseSalesDocument.Reopen(RecSalesHeader);
                            IF RecVATProductPostingGroup.GET(RecSalesLineTVA."VAT Prod. Posting Group") AND (RecVATProductPostingGroup.Nature = RecVATProductPostingGroup.Nature::Nouveau) THEN
                             BEGIN
                               RecSalesLineTVA.VALIDATE("VAT Prod. Posting Group" ,RecVATProductPostingGroup."Coresp. TVA");
                               RecSalesLineTVA.MODIFY;
                               RecSalesShipmentLine.RESET;
                               RecSalesShipmentLine.SETRANGE("Order No.",RecSalesHeader."No.");
                               RecSalesShipmentLine.SETRANGE("Order Line No.",RecSalesLineTVA."Line No.");
                               RecSalesShipmentLine.SETFILTER("Qty. Shipped Not Invoiced",'<>0');
                               IF RecSalesShipmentLine.FINDSET THEN
                                 REPEAT
                                   RecSalesShipmentLine.VALIDATE("VAT Prod. Posting Group",RecVATProductPostingGroup."Coresp. TVA");
                                   RecSalesShipmentLine.MODIFY;
                                 UNTIL RecSalesShipmentLine.NEXT = 0;
                             END;
                         UNTIL RecSalesLineTVA.NEXT = 0;
                    end;
                }
                action(Post)
                {
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = VisibiliteFacturation;

                    trigger OnAction();
                    begin
                        IF "Facture Complémentaire" THEN
                          VALIDATE(Status,Status::Released);
                        TESTFIELD("Dossier Validé",TRUE);
                        TESTFIELD("Acceptation Facturation",TRUE);
                        Post(CODEUNIT::"Sales-Post (Yes/No)");
                    end;
                }
                action("Post and &Print")
                {
                    CaptionML = ENU='Post and &Print',
                                FRA='Valider et i&mprimer';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';
                    Visible = false;

                    trigger OnAction();
                    begin
                        TESTFIELD("Dossier Validé",TRUE);
                        TESTFIELD("Acceptation Facturation",TRUE);
                        Post(CODEUNIT::"Sales-Post + Print");
                    end;
                }
                action("Test Report")
                {
                    CaptionML = ENU='Test Report',
                                FRA='Impression test';
                    Ellipsis = true;
                    Image = TestReport;
                    Visible = false;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("Post &Batch")
                {
                    CaptionML = ENU='Post &Batch',
                                FRA='Valider par l&ot';
                    Ellipsis = true;
                    Image = PostBatch;
                    Visible = false;

                    trigger OnAction();
                    begin
                        REPORT.RUNMODAL(REPORT::"Batch Post Sales Orders",TRUE,TRUE,Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Remove From Job Queue")
                {
                    CaptionML = ENU='Remove From Job Queue',
                                FRA='Supprimer de la file d''attente des travaux';
                    Image = RemoveLine;
                    Visible = JobQueueVisible;

                    trigger OnAction();
                    begin
                        CancelBackgroundPosting;
                    end;
                }
                group("Prepa&yment")
                {
                    CaptionML = ENU='Prepa&yment',
                                FRA='Acom&pte';
                    Image = Prepayment;
                    Visible = false;
                    action("Prepayment &Test Report")
                    {
                        CaptionML = ENU='Prepayment &Test Report',
                                    FRA='Impression &test acompte';
                        Ellipsis = true;
                        Image = PrepaymentSimulation;

                        trigger OnAction();
                        begin
                            ReportPrint.PrintSalesHeaderPrepmt(Rec);
                        end;
                    }
                    action(PostPrepaymentInvoice)
                    {
                        CaptionML = ENU='Post Prepayment &Invoice',
                                    FRA='Valider &facture acompte';
                        Ellipsis = true;
                        Image = PrepaymentPost;

                        trigger OnAction();
                        var
                            SalesPostYNPrepmt : Codeunit "443";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                              SalesPostYNPrepmt.PostPrepmtInvoiceYN(Rec,FALSE);
                        end;
                    }
                    action("Post and Print Prepmt. Invoic&e")
                    {
                        CaptionML = ENU='Post and Print Prepmt. Invoic&e',
                                    FRA='Valider et imprimer factur&e acompte';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;

                        trigger OnAction();
                        var
                            SalesPostYNPrepmt : Codeunit "443";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                              SalesPostYNPrepmt.PostPrepmtInvoiceYN(Rec,TRUE);
                        end;
                    }
                    action(PostPrepaymentCreditMemo)
                    {
                        CaptionML = ENU='Post Prepayment &Credit Memo',
                                    FRA='Valider &avoir acompte';
                        Ellipsis = true;
                        Image = PrepaymentPost;

                        trigger OnAction();
                        var
                            SalesPostYNPrepmt : Codeunit "443";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                              SalesPostYNPrepmt.PostPrepmtCrMemoYN(Rec,FALSE);
                        end;
                    }
                    action("Post and Print Prepmt. Cr. Mem&o")
                    {
                        CaptionML = ENU='Post and Print Prepmt. Cr. Mem&o',
                                    FRA='Valider et imprimer av&oir acompte';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;

                        trigger OnAction();
                        var
                            SalesPostYNPrepmt : Codeunit "443";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                              SalesPostYNPrepmt.PostPrepmtCrMemoYN(Rec,TRUE);
                        end;
                    }
                }
            }
            group("&Print")
            {
                CaptionML = ENU='&Print',
                            FRA='Im&primer';
                Image = Print;
                action("Order Confirmation")
                {
                    CaptionML = ENU='Order Confirmation',
                                FRA='Confirmation de commande';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        CommandeVNV2 : Report "70058";
                        LRecSalesHeader : Record "36";
                    begin
                        //SM270717
                        TESTFIELD(Status,Status::Released);
                        //END SM
                        //TESTFIELD("Promised Delivery Date");
                        //ZMN 07/11/2018 ZMN DocPrint.PrintSalesOrder(Rec,Usage::"Order Confirmation ");
                        COMMIT;
                        DocPrint.PrintSalesOrder(Rec,Usage::"S.Order VN");
                        /*LRecSalesHeader.GET("Document Type","No.");*/
                        /*
                        
                        LRecSalesHeader.RESET;
                        LRecSalesHeader.SETRANGE("Document Type","Document Type");
                        LRecSalesHeader.SETRANGE("No.","No.");
                        IF LRecSalesHeader.FINDFIRST THEN BEGIN
                        CLEAR(CommandeVNV2);
                        CommandeVNV2.SETTABLEVIEW(LRecSalesHeader);
                        CommandeVNV2.RUN;
                        END;
                        */

                    end;
                }
                action("Work Order")
                {
                    CaptionML = ENU='Work Order',
                                FRA='Ordre de fabrication';
                    Ellipsis = true;
                    Image = Print;
                    Visible = false;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec,Usage::"Work Order");
                    end;
                }
                action("Pick Instruction")
                {
                    CaptionML = ENU='Pick Instruction',
                                FRA='Instruction prélèvement';
                    Image = Print;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec,Usage::"Pick Instruction");
                    end;
                }
                action("Réservation voiture")
                {
                    Image = Reserve;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        "RéservationventesVN" : Report "70069";
                        SalesHeader : Record "36";
                    begin
                        PrePrintTest;
                        //TESTFIELD("Promised Delivery Date");
                        IF "Promised Delivery Date" = 0D THEN
                          ERROR(Text50000,"No.");
                        SalesHeader.RESET;
                        SalesHeader.SETRANGE("Document Type",Rec."Document Type");
                        SalesHeader.SETRANGE("No.","No.");
                        SalesHeader.FINDFIRST;
                        CLEAR(RéservationventesVN);
                        RéservationventesVN.SETTABLEVIEW(SalesHeader);
                        RéservationventesVN.RUN;
                    end;
                }
                action("Imprimer Facture Cession")
                {
                    Image = Reserve;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RepCommandeVNCession : Report "60136";
                        SalesHeader : Record "36";
                    begin
                        PrePrintTest;

                        SalesHeader.RESET;
                        SalesHeader.SETRANGE("Document Type",Rec."Document Type");
                        SalesHeader.SETRANGE("No.","No.");
                        SalesHeader.FINDFIRST;
                        TESTFIELD("Order Type","Order Type"::VN);
                        //TESTFIELD("Facturation avant AI");
                        COMMIT;
                        CLEAR(RepCommandeVNCession);
                        RepCommandeVNCession.SETTABLEVIEW(SalesHeader);
                        RepCommandeVNCession.RUN;
                    end;
                }
                action("Attestation de vente")
                {
                    Image = Certificate;
                    Promoted = true;

                    trigger OnAction();
                    begin
                        //FINDFIRST;
                        //ZMN
                        COMMIT;
                        RecGUserSetup.GET(USERID);
                        IF NOT(RecGUserSetup.Admin_Vente_VN ) THEN
                          ERROR('Cet état ne peut être imprimé que par l''ADV');
                        TESTFIELD(Status,Status::Released);
                        GRecSalesHeader.RESET;
                        GRecSalesHeader.SETRANGE("Document Type","Document Type");
                        GRecSalesHeader.SETRANGE("No.","No.");
                        IF GRecSalesHeader.FINDFIRST THEN BEGIN
                        CLEAR(AttestationDeVentesCMD);
                        AttestationDeVentesCMD.SETTABLEVIEW(GRecSalesHeader);
                        AttestationDeVentesCMD.RUN;
                        //GRecSalesHeader.SETRECFILTER;
                        //REPORT.RUN(60273,TRUE,FALSE,GRecSalesHeader);
                        END;
                    end;
                }
                action("Actualiser taux de change")
                {

                    trigger OnAction();
                    begin
                        IF "Currency Code"<>'' THEN BEGIN
                          CurrencyExchangeRate.RESET;
                          CurrencyExchangeRate.SETRANGE("Currency Code","Currency Code");
                          CurrencyExchangeRate.SETRANGE("Starting Date","Posting Date");
                          IF NOT CurrencyExchangeRate.FINDFIRST THEN
                            ERROR(CurrencyRateError)
                          ELSE BEGIN
                            IF CurrencyExchangeRate."Taux de change vente"<>0 THEN
                              VALIDATE("Currency Factor",1/CurrencyExchangeRate."Taux de change vente")
                            ELSE
                              VALIDATE("Currency Factor",0);
                            END;

                        END;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        DynamicEditable := CurrPage.EDITABLE;
        
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
        IF "créer par"=USERID THEN
          GBoolExonerationEditable:=TRUE;
        
        IF RecGUserSetup."Modifier date accep. Fact." THEN
          BolEditAccepFact := TRUE;
        GBoolDateRecepEditable:="Date Recept Doss"=0D;
        //KT 080117
        IF TODAY>080117D THEN BEGIN
          ReopenVisible:=RecGUserSetup.Admin_Vente_VN;
          IF ("Date Recept Doss"=0D) THEN
            ReopenVisible:=ReopenVisible OR VisibiliteRSHOWROOM
          ELSE IF ClientTaxiLou  THEN
            ReopenVisible:=ReopenVisible OR (NOT "Dossier Validé");
          IF USERID='GRPLOUKIL\SBSKAIS.TIMOUMI' THEN
          IF NOT ReopenVisible THEN BEGIN
          //MESSAGE('%1',ReopenVisible);
          //CurrPage.UPDATE;
        END;
        END;
        
        //add rh
        AppDepBudg := FALSE;
        AnnAppDepBudg := FALSE;
        CLEAR(RecGUserSetup);
        RecGUserSetup.GET(USERID);
        IF RecGUserSetup."D.C.G approve" THEN
        BEGIN
        AppDepBudg := TRUE;
        AnnAppDepBudg := TRUE;
        END
        
        
        /*
        IF "Sell-to Customer No."  <> '' THEN
        BEGIN
        DecMontantavance := 0;
        RecPaymentHeader.RESET;
        RecPaymentHeader.SETRANGE("Applies-to Doc. Type",RecPaymentHeader."Applies-to Doc. Type"::"Commande VN");
        RecPaymentHeader.SETRANGE("Applies-to Doc. No.","No.");
        // RecPaymentHeader.SETRANGE("Enc CHQ Annulé",FALSE);
        // RecPaymentHeader.SETRANGE("Enc Esp Annulé",FALSE);
        IF RecPaymentHeader.FINDSET THEN
          REPEAT
            //MESSAGE('Bordereau  %1',RecPaymentHeader."No.");
            //MESSAGE('Bordereau %1',RecPaymentHeader."No.");
            RecCustLedgerEntry.RESET;
            RecCustLedgerEntry.SETRANGE("Document No.",RecPaymentHeader."No.");
            RecCustLedgerEntry.SETRANGE("Customer No.","Bill-to Customer No.");
            RecCustLedgerEntry.SETRANGE(Open,TRUE);
            IF RecCustLedgerEntry.FINDSET THEN BEGIN
                RecCustLedgerEntry.CALCFIELDS(Amount);
                DecMontantavance := DecMontantavance + ABS(RecCustLedgerEntry.Amount);
            END;
          UNTIL RecPaymentHeader.NEXT = 0;
         "Avance sur commande":= DecMontantavance;
         MODIFY;
        END;
        */
        //IF DecMontantavance<>0 THEN
         //MESSAGE('%1',DecMontantavance);

    end;

    trigger OnAfterGetRecord();
    begin
        SetControlVisibility;
        RecGUserSetup.GET(USERID);
        IF ("créer par"=USERID) OR (RecGUserSetup.Admin_Vente_VN) THEN
          GBoolExonerationEditable:=TRUE;
        //FctAffecterSur;

        IF RecGUserSetup."Modifier date accep. Fact." THEN
          BolEditAccepFact := TRUE;
        GBoolDateRecepEditable:="Date Recept Doss"=0D;
        //KT 080117
        ReopenVisible:=RecGUserSetup.Admin_Vente_VN;
        IF ("Date Recept Doss"=0D) THEN
          ReopenVisible:=ReopenVisible OR VisibiliteRSHOWROOM
        ELSE IF ClientTaxiLou  THEN
          ReopenVisible:=ReopenVisible OR (NOT "Dossier Validé");



        IF "Sell-to Customer No."  <> '' THEN
        BEGIN
        DecMontantavance := 0;
        RecPaymentHeader.RESET;
        RecPaymentHeader.SETRANGE("Applies-to Doc. Type",RecPaymentHeader."Applies-to Doc. Type"::"Commande VN");
        RecPaymentHeader.SETRANGE("Applies-to Doc. No.","No.");
        // RecPaymentHeader.SETRANGE("Enc CHQ Annulé",FALSE);
        // RecPaymentHeader.SETRANGE("Enc Esp Annulé",FALSE);
        IF RecPaymentHeader.FINDSET THEN
          REPEAT
            //MESSAGE('Bordereau  %1',RecPaymentHeader."No.");
            //MESSAGE('Bordereau %1',RecPaymentHeader."No.");
            RecCustLedgerEntry.RESET;
            RecCustLedgerEntry.SETRANGE("Document No.",RecPaymentHeader."No.");
            RecCustLedgerEntry.SETRANGE("Customer No.","Bill-to Customer No.");
            RecCustLedgerEntry.SETRANGE(Open,TRUE);
            IF RecCustLedgerEntry.FINDSET THEN BEGIN
                RecCustLedgerEntry.CALCFIELDS(Amount);
                DecMontantavance := DecMontantavance + ABS(RecCustLedgerEntry.Amount);
            END;
          UNTIL RecPaymentHeader.NEXT = 0;
         "Avance sur commande":= DecMontantavance;
         MODIFY;
        END;
    end;

    trigger OnDeleteRecord() : Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInit();
    begin
        BolEditAccepFact := FALSE;
        BlnEditNoContact := FALSE;
        BoolAutoMoi := FALSE;
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        CheckCreditMaxBeforeInsert;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Responsibility Center" := UserMgt.GetSalesFilter;
        "Order Type" := "Order Type"::VN;
    end;

    trigger OnOpenPage();
    begin
        //SM 020817
        RecGUserSetup.GET(USERID);
        IF NOT RecGUserSetup."Autoriser Facturation VN" THEN BEGIN
        IF NOT RecGUserSetup."Autoriser Facturation VN" THEN BEGIN
        IF NOT RecGUserSetup.Admin_Vente_VN  THEN BEGIN
          IF UserMgt.GetSalesFilter <> '' THEN BEGIN
            FILTERGROUP(2);
            SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);
            FILTERGROUP(0);
          END;
        END;
        GBoolAllEditable:= RecGUserSetup."Modifier client/Client Facturé" ;
        IF (NOT RecGUserSetup.Admin_Vente_VN) AND (NOT RecGUserSetup."Responsable agence VN") THEN BEGIN
          SETRANGE("Salesperson Code",RecGUserSetup."Salespers./Purch. Code");
        END;
        IF RecGUserSetup."Agent comptable" THEN
          GBoolAgentComptable:=TRUE;
        //SM
        END;
        END;
        SETRANGE("Date Filter",0D,WORKDATE - 1);
        
        //<<ZMN 07/09/2017
        BlnAdminDate := FALSE;
        RecGUserSetup.GET(USERID);
        IF RecGUserSetup.Admin_Vente_VN OR RecGUserSetup."Responsable agence VN" THEN
          BlnAdminDate := TRUE;
        //>>ZMN 07/09/2017
        //KT 01012019
        ChangeSalesperson:=FALSE;
        IF RecGUserSetup.Admin_Vente_VN THEN
          ChangeSalesperson:=TRUE;
        
        //EN DKT
        
        //RH 250717
        AdminVte := FALSE;
        RecGUserSetup.GET(USERID);
        BoolAutoMoi := RecGUserSetup."Admin IT NAV";
        IF  RecGUserSetup.Admin_Vente_VN THEN BEGIN
              AdminVte := TRUE;
        END ELSE BEGIN
          IF ("Document Date" <> 0D) AND ("Document Date"  < TODAY) THEN
              AdminVte := FALSE
          ELSE
              AdminVte := TRUE;
        END;
        
        ADVDateRecep := RecGUserSetup.Admin_Vente_VN;
        
        //SM 3007717
        ClientTaxiLou := FALSE;
        IF RecCustomerTaxiLou.GET("Sell-to Customer No.") THEN BEGIN
          IF (RecCustomerTaxiLou."Code Titre" = 'LOU_TRR') OR  (RecCustomerTaxiLou."Code Titre" = 'TAXI') OR  (RecCustomerTaxiLou."Code Titre" = 'TAXCOLLECT') THEN
               ClientTaxiLou := TRUE;
        END;
        //END SM
        /*
        
        
        IF  NOT RecGUserSetup."Responsable agence VN"  THEN
          begin
            IF "Document Date" <> 0D  THEN
              IF  "Document Date"  < TODAY  THEN
         DateClt := FALSE;
        */
        //SM 270717
        RecGUserSetup.GET(USERID);
        VisibiliteFacturation := RecGUserSetup.Admin_Vente_VN;
        VisibiliteRSHOWROOM := RecGUserSetup."Responsable agence VN";
        ReopenVisible:=RecGUserSetup.Admin_Vente_VN;
        //END SM
        
        IF RecGUserSetup."Modifier date accep. Fact." THEN
          BolEditAccepFact := TRUE;
        
        //add rh
        AppDepBudg := FALSE;
        AnnAppDepBudg := FALSE;
        CLEAR(RecGUserSetup);
        RecGUserSetup.GET(USERID);
        IF RecGUserSetup."D.C.G approve" THEN
        BEGIN
        AppDepBudg := TRUE;
        AnnAppDepBudg := TRUE;
        END
        

    end;

    var
        Text000 : TextConst ENU='Unable to execute this function while in view only mode.',FRA='Impossible d''exécuter cette fonction quand vous êtes en mode visualisation seule.';
        CopySalesDoc : Report "292";
        MoveNegSalesLines : Report "6699";
        ReportPrint : Codeunit "228";
        DocPrint : Codeunit "229";
        ArchiveManagement : Codeunit "5063";
        ChangeExchangeRate : Page "511";
        UserMgt : Codeunit "5700";
        Usage : Option "Order Confirmation","Work Order","Pick Instruction","S.Order VN";
        [InDataSet]
        JobQueueVisible : Boolean;
        Text10800 : TextConst ENU='There are unposted prepayment amounts on the document of type %1 with the number %2.',FRA='Il existe des montants acompte non validés sur le document de type %1 portant le numéro %2.';
        Text10801 : TextConst ENU='There are unpaid prepayment invoices related to the document of type %1 with the number %2.',FRA='Il existe des factures d''acompte impayées liées au document de type %1 portant le numéro %2.';
        Text001 : TextConst ENU='Do you want to change %1 in all related records in the warehouse?',FRA='Souhaitez-vous modifier %1 dans tous les enregistrements associés de l''entrepôt ?';
        Text002 : TextConst ENU='The update has been interrupted to respect the warning.',FRA='La mise à jour a été interrompue pour respecter l''alerte.';
        RecGUserSetup : Record "91";
        RecGPurchaseSetup : Record "312";
        CodLDefaultSeriesCode : Code[20];
        CuGNoSeriesMgt : Codeunit "396";
        LstNumber : Code[10];
        CstText003 : Label 'La commande doit étre lancé pour la transformer en demande achat.';
        CstText004 : Label '"La Commande Vente Num %1 a été transférer en demande achat sous le Num %2 "';
        CstText005 : Label 'Il existe une demande achat lancé sous le numéro %1 pour la commande vente %2';
        CstText006 : Label 'Il faut indiqué si cette commande est spécifique!';
        RecgPurchaseReq : Record "50005";
        RecGPagePropArticle : Page "60010";
        RecGTypeDoc : Integer;
        DynamicEditable : Boolean;
        CDUStockFunction : Codeunit "50000";
        RecTransferHeader : Record "5740";
        HasIncomingDocument : Boolean;
        DocNoVisible : Boolean;
        ExternalDocNoMandatory : Boolean;
        OpenApprovalEntriesExistForCurrUser : Boolean;
        OpenApprovalEntriesExist : Boolean;
        ShowWorkflowStatus : Boolean;
        ApprovalsMgmt : Codeunit "1535";
        DatersV : Date;
        AdminVte : Boolean;
        DateClt : Boolean;
        VisibiliteFacturation : Boolean;
        VisibiliteRSHOWROOM : Boolean;
        ClientTaxiLou : Boolean;
        RecCustomerTaxiLou : Record "18";
        ADVDateRecep : Boolean;
        Text50000 : TextConst FRA='Date livraison prévu doit avoir une valeur dans En-tête vente: Type document=Commande, N° = %1. Il ne peut pas être vide ou nul.';
        BlnAdminDate : Boolean;
        "BlNoBCComplémentaireEditable" : Boolean;
        GBoolExonerationEditable : Boolean;
        GBoolAgentComptable : Boolean;
        GRecServiceLine : Record "5902";
        GRecServiceInvoiceLine : Record "5993";
        GRecSalesLine : Record "37";
        GRecBOMComponent : Record "90";
        GRecItem : Record "27";
        GRecServiceHeader : Record "5900";
        GRecServiceInvoiceHeader : Record "5992";
        GRecServiceItemLine : Record "5901";
        GRecServiceLedgerEntry : Record "5907";
        GBoolAllEditable : Boolean;
        BolEditAccepFact : Boolean;
        GBoolDateRecepEditable : Boolean;
        ListVINCompagne : Record "50076";
        ReopenVisible : Boolean;
        GRecSalesReceivablesSetup : Record "311";
        ChangeSalesperson : Boolean;
        RecPaymentHeader : Record "10865";
        RecCustLedgerEntry : Record "21";
        DecMontantavance : Decimal;
        BlnEditNoContact : Boolean;
        GRecSalesHeader : Record "36";
        AttestationDeVentesCMD : Report "60273";
        CurrencyExchangeRate : Record "330";
        CurrencyRateError : Label 'Taux de change devise non saisi pour cette date. Consultez le service Finances.';
        RateDiffError : Label 'Le taux de change de la commande est différent du cour de la date facture';
        AppDepBudg : Boolean;
        AnnAppDepBudg : Boolean;
        BoolAutoMoi : Boolean;

    local procedure Post(PostingCodeunitID : Integer);
    begin
        SendToPosting(PostingCodeunitID);
        IF "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting" THEN
          CurrPage.CLOSE;
        CurrPage.UPDATE(FALSE);
    end;

    procedure UpdateAllowed() : Boolean;
    begin
        IF CurrPage.EDITABLE = FALSE THEN
          ERROR(Text000);
        EXIT(TRUE);
    end;

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.SalesLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        IF GETFILTER("Sell-to Customer No.") = xRec."Sell-to Customer No." THEN
          IF "Sell-to Customer No." <> xRec."Sell-to Customer No." THEN
            SETRANGE("Sell-to Customer No.");
        CurrPage.UPDATE;
    end;

    local procedure SalespersonCodeOnAfterValidate();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure PricesIncludingVATOnAfterValid();
    begin
        CurrPage.UPDATE;
    end;

    local procedure Prepayment37OnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    procedure CreatePurchaseRequest(RecSalesOrder : Record "36";TypeDoc : Integer);
    var
        RecLPurchReqHdr : Record "50005";
        RecLPurchReqLine : Record "50008";
        RecLorderLine : Record "37";
        IntLineNo : Integer;
        RecLPurchReqHdrTmp : Record "50005";
    begin

        //Le statut de la commande vente doit étre lancé
        IF RecSalesOrder.Status=0 THEN
           ERROR(CstText003);

        //Verifier si la commande est déstiner pour une demande achat
        IF NOT RecSalesOrder."Specific Order" THEN
           ERROR(CstText006);

        //Verifier si cette commande vente posséde une DA
        IF RecSalesOrder."Specific Order No." <>'' THEN
           ERROR(CstText005,RecSalesOrder."Specific Order No.",RecSalesOrder."No.");


        // Créer l'entête DA
        //RecGUserSetup.GET(USERID);
        RecLPurchReqHdr.INIT ;
        //RecGPurchaseSetup.GET;
        IF RecLPurchReqHdr.INSERT(TRUE) THEN
          BEGIN
            RecLPurchReqHdr."Request User ID":=USERID;
            RecLPurchReqHdr."Request Date":=TODAY;
            RecLPurchReqHdr."Source No.":=RecSalesOrder."No.";
            RecLPurchReqHdr."Source Type":=RecLPurchReqHdr."Source Type"::Sales ;
            RecLPurchReqHdr."Customer No." := RecSalesOrder."Sell-to Customer No.";
            IF  RecLPurchReqHdr.MODIFY THEN;
        END;

        RecSalesOrder."Specific Order No." :=RecLPurchReqHdr."No.";
        IF  RecSalesOrder.MODIFY THEN;


        // Créer les lignes DA
        RecLorderLine.RESET;
        RecLorderLine.SETRANGE(RecLorderLine."Document Type",RecLorderLine."Document Type"::Order);
        RecLorderLine.SETRANGE(RecLorderLine."Document No.","No.");
        IF RecLorderLine.COUNT <> 0 THEN
          IF RecLorderLine.FINDSET THEN
            BEGIN
              REPEAT
                // Affectation des Champs DA
                RecLPurchReqLine.INIT;
                RecLPurchReqLine."Request No." := RecLPurchReqHdr."No." ;
                RecLPurchReqLine."Line No.":=RecLorderLine."Line No.";
               // Type ligne
                CASE  RecLorderLine.Type OF
                       RecLorderLine.Type::Item:RecLPurchReqLine.Type :=RecLPurchReqLine.Type::Item;
                       RecLorderLine.Type::"Charge (Item)" :RecLPurchReqLine.Type :=RecLPurchReqLine.Type::"Charge (Item)";
                       RecLorderLine.Type::"Fixed Asset" :RecLPurchReqLine.Type :=RecLPurchReqLine.Type::"Existing Fixed Asset";
                       ELSE   RecLPurchReqLine.Type :=RecLPurchReqLine.Type::" ";
                END;

                RecLPurchReqLine."Item No." := RecLorderLine."No.";
                RecLPurchReqLine."Variant code" :=RecLorderLine."Variant Code";
                RecLPurchReqLine."Location Code" :=RecLorderLine."Location Code";
                RecLPurchReqLine.Description := RecLorderLine.Description;
                RecLPurchReqLine."Unit of Measure Code" :=RecLorderLine."Unit of Measure Code";
                RecLPurchReqLine.Quantity :=RecLorderLine.Quantity;
                RecLPurchReqLine."Currency Code" :=RecLorderLine."Currency Code";
                RecLPurchReqLine."Unit Cost" :=RecLorderLine."Unit Cost";
                RecLPurchReqLine."Purchaseperson Code" :=RecLorderLine."Purchase Order No.";
                RecLPurchReqLine.Montant :=RecLorderLine.Amount;
                RecLPurchReqLine."Code Client" := RecLorderLine."Bill-to Customer No.";
                RecLPurchReqLine."% Remise" :=RecLorderLine."Line Discount %" ;
                IF RecLPurchReqLine.INSERT THEN;
            UNTIL RecLorderLine.NEXT = 0 ;
        END;

        MESSAGE(CstText004,RecSalesOrder."No.",RecLPurchReqHdr."No.");
    end;

    local procedure SetControlVisibility();
    var
        ApprovalsMgmt : Codeunit "1535";
    begin
        JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        HasIncomingDocument := "Incoming Document Entry No." <> 0;
        SetExtDocNoMandatoryCondition;

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;

    local procedure SetDocNoVisible();
    var
        DocumentNoVisibility : Codeunit "1400";
        DocType : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.SalesDocumentNoIsVisible(DocType::Order,"No.");
    end;

    local procedure SetExtDocNoMandatoryCondition();
    var
        SalesReceivablesSetup : Record "311";
    begin
        SalesReceivablesSetup.GET;
        ExternalDocNoMandatory := SalesReceivablesSetup."Ext. Doc. No. Mandatory"
    end;

    local procedure CheckToRelease();
    var
        RecLSalesLine : Record "37";
        RecWarehouseEntry : Record "7312";
        Bin : Record "7354";
        LRecServiceItem : Record "5940";
        LRecSalesReceivablesSetup : Record "311";
        LTextVINEnAvarie : Text[250];
        Campaign : Record "5071";
        "ListeModèlesCompagne" : Record "50079";
        ListeAccessoirsCompagne : Record "50080";
        RecLSalesLineAccessoires : Record "37";
        NbrAcc : Integer;
        NbrAccTotal : Integer;
        CodeCarteCarburant : Code[20];
        RecLSalesLineCarburant : Record "37";
        LRecSalesLine : Record "37";
        LRecTypePaiement : Record "60022";
        LRecSalesLine2 : Record "37";
        ItemTmp : Record "27";
    begin
        //SM 230817
        //KT
        IF NOT "Facture Complémentaire" THEN
        FctAffecterSur;
        IF "Campaign No." <> '' THEN BEGIN
          Campaign.GET("Campaign No.");
        TESTFIELD("Payment Method Code");
        TESTFIELD("Payment Terms Code");
          IF ("Document Date" > Campaign."Ending Date") OR ("Document Date" < Campaign."Starting Date") THEN
            ERROR('Date Document hors date validité de la compagne!');
          IF (Campaign."Client Leasing" <> '') AND (Campaign."Client Leasing" <> "Bill-to Customer No.") THEN
            ERROR('Client Leasing doit être %1 pour la compagne %2',Campaign."Client Leasing","Campaign No.");
        
           //Modele
          RecLSalesLine.RESET;
          RecLSalesLine.SETRANGE("Document Type",RecLSalesLine."Document Type"::Order);
          RecLSalesLine.SETRANGE("Document No.","No.");
          RecLSalesLine.SETRANGE(Campaign,TRUE);
          RecLSalesLine.SETRANGE("Type VN",RecLSalesLine."Type VN"::Vehicule);
          IF RecLSalesLine.FINDSET THEN BEGIN
            REPEAT
              RecLSalesLine.CALCFIELDS(VIN);
              CodeCarteCarburant := '';
              ListeModèlesCompagne.RESET;
              ListeModèlesCompagne.SETRANGE("Code Compagne","Campaign No.");
              ListeModèlesCompagne.SETRANGE("Code Modèle",RecLSalesLine."No.");
              IF ListeModèlesCompagne.ISEMPTY THEN
                ERROR('Le modèle suivant %1 %2 ne fait pas partie de la compagne.',RecLSalesLine."No.",RecLSalesLine.Description);
              IF ListeModèlesCompagne.FINDFIRST AND (Campaign."Carte Carburant" <> '') THEN
                CodeCarteCarburant := ListeModèlesCompagne."Type Carte Carburant";
        
              //Accessoire
              IF RecLSalesLine.VIN <> '' THEN BEGIN
        
                NbrAcc :=0;
                NbrAccTotal := 0;
                ListeAccessoirsCompagne.RESET;
                ListeAccessoirsCompagne.SETRANGE("Code Compagne","Campaign No.");
                NbrAccTotal := ListeAccessoirsCompagne.COUNT;
        
                RecLSalesLineAccessoires.RESET;
                RecLSalesLineAccessoires.SETRANGE("Document Type",RecLSalesLineAccessoires."Document Type"::Order);
                RecLSalesLineAccessoires.SETRANGE("Document No.","No.");
                RecLSalesLineAccessoires.SETRANGE(Campaign,TRUE);
                RecLSalesLineAccessoires.SETRANGE("Type VN",RecLSalesLineAccessoires."Type VN"::Accessoire);
                RecLSalesLineAccessoires.SETRANGE("Affecter sur",RecLSalesLine.VIN);
                IF CodeCarteCarburant <> '' THEN
                  RecLSalesLineAccessoires.SETFILTER("No.",'<>%1',CodeCarteCarburant);
        
                IF RecLSalesLineAccessoires.FINDSET THEN BEGIN
                  REPEAT
                    ListeAccessoirsCompagne.RESET;
                    ListeAccessoirsCompagne.SETRANGE("Code Compagne","Campaign No.");
                    ListeAccessoirsCompagne.SETRANGE("Code Accessoirs",RecLSalesLineAccessoires."No.");
                    IF ListeAccessoirsCompagne.ISEMPTY THEN
                      ERROR('Accessoires no %1 existe pas la compagne %2',RecLSalesLineAccessoires."No.","Campaign No.")
                    ELSE NbrAcc +=1;
        
                  UNTIL RecLSalesLineAccessoires.NEXT = 0;
        
                END;
        
                IF (NOT Campaign."Tous les accessoirs") AND (NbrAcc <> Campaign."Nbre Accessoirs à choisir") THEN
                  ERROR('Nombre Accessoires compagne doit être %1 pour le VIN %2',Campaign."Nbre Accessoirs à choisir",RecLSalesLine.VIN);
                IF Campaign."Tous les accessoirs" AND (NbrAcc <> NbrAccTotal) THEN
                  ERROR('Nombre Accessoires compagne doit être %1 pour le VIN %2',NbrAccTotal,RecLSalesLine.VIN);
        
              END;
              //Carburant
              IF Campaign."Carte Carburant" <> '' THEN BEGIN
                RecLSalesLineCarburant.RESET;
                RecLSalesLineCarburant.SETRANGE("Document Type",RecLSalesLineCarburant."Document Type"::Order);
                RecLSalesLineCarburant.SETRANGE("Document No.","No.");
                RecLSalesLineCarburant.SETRANGE(Campaign,TRUE);
                RecLSalesLineCarburant.SETRANGE("Type VN",RecLSalesLineCarburant."Type VN"::Accessoire);
                RecLSalesLineCarburant.SETRANGE("Affecter sur",RecLSalesLine.VIN);
                RecLSalesLineCarburant.SETRANGE("No.",CodeCarteCarburant);
                IF RecLSalesLineCarburant.ISEMPTY OR  (RecLSalesLineCarburant.COUNT <> 1)  THEN
                  ERROR('Une seule Carte Carburant %1 doit affecter sur le VIN %2',CodeCarteCarburant,RecLSalesLine.VIN);
        
              END;
            UNTIL RecLSalesLine.NEXT = 0;
          END ELSE BEGIN
            ERROR('Aucun véhicule n est dans la compagne %1',"Campaign No.");
          END;
        
        END;
        //END SM 230817
        //SM 270717
        /*KT TMP 03012019 IF NOT "Facture Complémentaire" THEN
        IF "Promised Delivery Date" = 0D THEN
          ERROR('Merci de saisir date livraison prévue');*/
        //END SM
        LRecSalesReceivablesSetup.GET;
        //SM 280717
        RecLSalesLine.RESET;
        RecLSalesLine.SETRANGE("Document Type",RecLSalesLine."Document Type"::Order);
        RecLSalesLine.SETRANGE("Document No.","No.");
        RecLSalesLine.SETRANGE("Type VN",RecLSalesLine."Type VN"::Vehicule);
        IF RecLSalesLine.FINDSET THEN BEGIN
          REPEAT
            RecLSalesLine.CALCFIELDS(VIN);
        
            RecWarehouseEntry.RESET;
            RecWarehouseEntry.SETRANGE("Serial No.",RecLSalesLine.VIN);
            RecWarehouseEntry.SETRANGE("Item No.",RecLSalesLine."No.");
            RecWarehouseEntry.SETRANGE("Variant Code",RecLSalesLine."Variant Code");
            RecWarehouseEntry.SETRANGE("Location Code",RecLSalesLine."Location Code");
            IF RecWarehouseEntry.FINDLAST AND (RecLSalesLine.VIN <> '') THEN
             IF Bin.GET(RecLSalesLine."Location Code",RecWarehouseEntry."Bin Code") AND Bin."Not available" THEN
              ERROR('Véhicule Non Disponible à la vente, Non enours réceptionner');
        
          UNTIL RecLSalesLine.NEXT = 0;
        END;
        //END SM
        //SM 280817 Compagne
        RecLSalesLine.RESET;
        RecLSalesLine.SETRANGE("Document Type",RecLSalesLine."Document Type"::Order);
        RecLSalesLine.SETRANGE("Document No.","No.");
        RecLSalesLine.SETRANGE("Type VN",RecLSalesLine."Type VN"::Vehicule);
        IF RecLSalesLine.FINDSET THEN BEGIN
          REPEAT
            RecLSalesLine.CALCFIELDS(VIN);
            /*LRecServiceItem.RESET;
            LRecServiceItem.SETRANGE("Serial No.",RecLSalesLine.VIN);
            IF LRecServiceItem.FINDFIRST THEN BEGIN
              LRecServiceItem.CALCFIELDS(Compagne);
              IF LRecServiceItem.Compagne THEN BEGIN
                LRecServiceItem.CALCFIELDS("Compagne Bloquant");
                IF LRecServiceItem."Compagne Bloquant" THEN
                  ERROR('Le VIN %1 est en compagne SAV !',RecLSalesLine.VIN);
              END;
            END;*/
            ListVINCompagne.RESET;
            ListVINCompagne.SETRANGE(VIN,LRecSalesLine.VIN);
            ListVINCompagne.SETRANGE("Compagne Bloquant",TRUE);
            ListVINCompagne.SETRANGE(Traiter,FALSE);
            IF ListVINCompagne.FINDFIRST THEN
                ERROR('Le VIN %1 est en campagne SAV !',RecLSalesLine.VIN);
          UNTIL RecLSalesLine.NEXT = 0;
        END;
        //END SM
        //KT 180817
        RecLSalesLine.RESET;
        RecLSalesLine.SETRANGE("Document Type",RecLSalesLine."Document Type"::Order);
        RecLSalesLine.SETRANGE("Document No.","No.");
        RecLSalesLine.SETRANGE("Type VN",RecLSalesLine."Type VN"::Vehicule);
        IF RecLSalesLine.FINDSET THEN BEGIN
          LTextVINEnAvarie:='';
          REPEAT
            RecLSalesLine.CALCFIELDS(VIN);
            LRecServiceItem.RESET;
            LRecServiceItem.SETRANGE("Serial No.",RecLSalesLine.VIN);
            IF LRecServiceItem.FINDFIRST THEN BEGIN
              LRecServiceItem.CALCFIELDS(Avarie);
              IF LRecServiceItem.Avarie THEN
                LTextVINEnAvarie:=LTextVINEnAvarie+', '+LRecServiceItem."Serial No.";
            END;
          UNTIL RecLSalesLine.NEXT = 0;
          IF (LRecSalesReceivablesSetup."Lancer commande VIN avarie"=LRecSalesReceivablesSetup."Lancer commande VIN avarie"::Alerter) AND (LTextVINEnAvarie <> '') THEN
            MESSAGE('Alerte: le(s) véhicule(s) %1 constaté(s) avarie',LTextVINEnAvarie)
          ELSE IF (LRecSalesReceivablesSetup."Lancer commande VIN avarie"=LRecSalesReceivablesSetup."Lancer commande VIN avarie"::Bloquer)  AND (LTextVINEnAvarie <> '') THEN
            ERROR('Le(s) véhicule(s) %1 constaté(s) avarie, la commande ne peut pas être lancée',LTextVINEnAvarie);
        END;
        //END KT
        //KT 250817
        LRecSalesLine.RESET;
        LRecSalesLine.SETRANGE("Document Type","Document Type");
        LRecSalesLine.SETRANGE("Document No.","No.");
        LRecSalesLine.SETRANGE("Unit Price",0);
        IF LRecSalesLine.FINDFIRST THEN
        BEGIN
         CLEAR(ItemTmp);
         IF ItemTmp.GET(LRecSalesLine."No.") THEN
         IF NOT ItemTmp."Article Pack" THEN
          ERROR('Prix de vente manquant ligne vente %1, %2, %3',LRecSalesLine."Line No.",LRecSalesLine."Type VN",LRecSalesLine."No.");
        END;
        //END KT
        //KT 040917
        LRecTypePaiement.GET("Type Paiement");
        IF LRecTypePaiement.Banque THEN
          TESTFIELD(Banque);
        //END KT
        //KT200917
        LRecSalesLine2.RESET;
        LRecSalesLine2.SETRANGE("Document No.","No.");
        LRecSalesLine2.SETRANGE("Document Type","Document Type");
        LRecSalesLine2.SETFILTER("Type VN",'<>%1',LRecSalesLine2."Type VN"::Vehicule);
        //LRecSalesLine2.SETFILTER("No.",'<>%1','IMMAT');
        LRecSalesLine2.SETFILTER(Type,'<>%1&<>%2&<>%3',LRecSalesLine2.Type::"Charge (Item)",LRecSalesLine2.Type::"G/L Account",LRecSalesLine2.Type::" ");
        
        LRecSalesLine2.SETRANGE("Affecter sur ligne",0);
        
        
        IF NOT LRecSalesLine2.ISEMPTY THEN
        IF NOT "Facture Complémentaire" THEN
          ERROR('Affecter sur doit avoir une valeur dans les lignes accessoires et frais');
        //END KT
        IF NOT "Facture Complémentaire" THEN
        IF "Demande exonération" THEN BEGIN
          TESTFIELD("Date B.Commande exonération");
          TESTFIELD("No Autorisation administrative");
          TESTFIELD("Exonération validée");
        END;
        //KT 041017
        ItemExists;

    end;

    procedure FctAffecterSur();
    var
        LRecSalesLine : Record "37";
        LRecSalesLine2 : Record "37";
        LRecSalesLine3 : Record "37";
    begin
        //KT 100717 En cours
        GRecSalesReceivablesSetup.GET;
        LRecSalesLine2.RESET;
        LRecSalesLine2.SETRANGE("Document Type","Document Type");
        LRecSalesLine2.SETRANGE("Document No.","No.");
        IF LRecSalesLine2.FINDSET THEN BEGIN
          REPEAT
            //IF LRecSalesLine2."Affecter sur"='' THEN
            IF (LRecSalesLine2."Type VN"<>LRecSalesLine2."Type VN"::Vehicule) THEN BEGIN
              IF NOT ( LRecSalesLine2."No." IN [GRecSalesReceivablesSetup."Frais Immatriculation",
                GRecSalesReceivablesSetup."Frais Redevence Comp. Véhicule",GRecSalesReceivablesSetup."Frais TME",GRecSalesReceivablesSetup."Frais plaque"
                 , GRecSalesReceivablesSetup."Frais Fodec",GRecSalesReceivablesSetup."Frais RPD",GRecSalesReceivablesSetup."Frais RTAI",GRecSalesReceivablesSetup."Frais TVA"
                 ,GRecSalesReceivablesSetup."Autre Frais"])  THEN BEGIN
              LRecSalesLine.RESET;
              LRecSalesLine.SETRANGE("Document Type",LRecSalesLine2."Document Type");
              LRecSalesLine.SETRANGE("Document No.",LRecSalesLine2."Document No.");
              LRecSalesLine.SETRANGE("Type VN",LRecSalesLine."Type VN"::Vehicule);
              LRecSalesLine.SETFILTER("Line No.",'<%1',LRecSalesLine2."Line No.");
              IF LRecSalesLine.FINDLAST THEN BEGIN
                LRecSalesLine.CALCFIELDS(VIN);
                LRecSalesLine.CALCFIELDS("VIN Sur Arrivage");
                //MODIF KK_28092017
                //OLD LRecSalesLine2."Affecter sur":= LRecSalesLine.VIN;
                IF LRecSalesLine.VIN <> '' THEN BEGIN
                  LRecSalesLine2."Affecter sur" := LRecSalesLine.VIN;
                  LRecSalesLine2."Affecter sur ligne":=LRecSalesLine."Line No.";
                END
                ELSE BEGIN
                  LRecSalesLine2."Affecter sur" := LRecSalesLine."VIN Sur Arrivage";
                  LRecSalesLine2."Affecter sur ligne":=LRecSalesLine."Line No.";
                END;
                LRecSalesLine2.MODIFY;
              END;
            END ELSE BEGIN
                  /*    LRecSalesLine.CALCFIELDS(VIN);
                LRecSalesLine.CALCFIELDS("VIN Sur Arrivage");
                //MODIF KK_28092017
              //OLD LRecSalesLine2."Affecter sur":= LRecSalesLine.VIN;
              IF LRecSalesLine.VIN <> '' THEN
                LRecSalesLine2."Affecter sur" := LRecSalesLine.VIN
              ELSE
                LRecSalesLine2."Affecter sur" := LRecSalesLine."VIN Sur Arrivage";
              LRecSalesLine2.MODIFY;*/
              LRecSalesLine2."Affecter sur":='';
              LRecSalesLine2."Affecter sur ligne":=LRecSalesLine2."Line No.";
              LRecSalesLine2.MODIFY;
              END;
              END ELSE BEGIN
                LRecSalesLine2.CALCFIELDS(VIN);
                LRecSalesLine2."Affecter sur":=LRecSalesLine2.VIN;
                LRecSalesLine2."Affecter sur ligne":=LRecSalesLine2."Line No.";
                LRecSalesLine2.MODIFY;
              END;
          UNTIL LRecSalesLine2.NEXT=0;
        END;

    end;

    procedure ItemExists();
    var
        RecLSalesLine : Record "37";
        LRecSalesLineExist : Record "37";
        SalesOrderSubformVN : Page "60085";
    begin
        //KT 041017
        LRecSalesLineExist.RESET;
        LRecSalesLineExist.SETRANGE("Document Type","Document Type");
        LRecSalesLineExist.SETRANGE("Document No.","No.");
        LRecSalesLineExist.SETRANGE("Type VN",LRecSalesLineExist."Type VN"::Accessoire);
        IF LRecSalesLineExist.FINDSET THEN
          REPEAT
            IF (LRecSalesLineExist."Type VN"=LRecSalesLineExist."Type VN"::Accessoire)  AND (LRecSalesLineExist."Affecter sur"<>'')THEN BEGIN
              RecLSalesLine.RESET;
              RecLSalesLine.SETRANGE("Document Type",LRecSalesLineExist."Document Type");
              RecLSalesLine.SETRANGE("Document No.",LRecSalesLineExist."Document No.");
              RecLSalesLine.SETRANGE(Type,LRecSalesLineExist.Type);
              RecLSalesLine.SETRANGE("No.",LRecSalesLineExist."No.");
              RecLSalesLine.SETRANGE("Affecter sur",LRecSalesLineExist."Affecter sur");
              RecLSalesLine.SETFILTER("Line No.",'<>%1',LRecSalesLineExist."Line No.");
              IF NOT RecLSalesLine.ISEMPTY THEN
                ERROR('Article %1 déjà saisi pour le véhicule %2 ',LRecSalesLineExist."No.",LRecSalesLineExist."Affecter sur");
            END;
          UNTIL LRecSalesLineExist.NEXT=0;
    end;

    local procedure PrePrintTest();
    begin
        GRecSalesLine.RESET;
        GRecSalesLine.SETRANGE("Document Type","Document Type");
        GRecSalesLine.SETRANGE("Document No.","No.");
        IF GRecSalesLine.FINDSET THEN BEGIN
          REPEAT
            IF GRecSalesLine."Type VN"=GRecSalesLine."Type VN"::Accessoire THEN
              GRecSalesLine.TESTFIELD("Affecter sur")
            ELSE IF GRecSalesLine."Type VN"=GRecSalesLine."Type VN"::Vehicule THEN BEGIN
              GRecSalesLine.CALCFIELDS(VIN,"VIN Sur Arrivage");
              IF (GRecSalesLine.VIN='') AND (GRecSalesLine."VIN Sur Arrivage"='') THEN
                ERROR('Vin non saisi ligne %1', GRecSalesLine."Line No.");
            END;
          UNTIL GRecSalesLine.NEXT=0;
        END;
    end;

    procedure FctVerifAIHeader() : Boolean;
    var
        LRecSalesHeader : Record "36";
        LRecServiceItem : Record "5940";
        AIByVIN : Boolean;
        LRecSalesLine : Record "37";
    begin
        //KT 231017
        AIByVIN := TRUE;

        LRecSalesLine.RESET;
        LRecSalesLine.SETRANGE("Document Type","Document Type");
        LRecSalesLine.SETRANGE("Document No.","No.");
        LRecSalesLine.SETRANGE("Type VN",LRecSalesLine."Type VN"::Vehicule);
        IF LRecSalesLine.FINDSET THEN BEGIN
        REPEAT
          LRecSalesLine.CALCFIELDS(VIN);
          LRecServiceItem.RESET;
          LRecServiceItem.SETRANGE("Serial No.",LRecSalesLine.VIN);
          IF LRecServiceItem.FINDFIRST AND (NOT LRecServiceItem.AI) THEN
            AIByVIN := FALSE;

        UNTIL  LRecSalesLine.NEXT = 0;
        IF AI <> AIByVIN THEN BEGIN
          AI:=AIByVIN;
          MODIFY;
        END;
        END ELSE BEGIN
        IF AI <> FALSE THEN BEGIN
          AI:=FALSE;
          MODIFY;
        END;
        END;
    end;
}

