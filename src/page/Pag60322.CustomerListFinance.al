page 60322 "Customer List Finance"
{
    // version NAVW19.00.00.44974,CT16V001

    // CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Customer List',
                FRA='Liste des clients';
    CardPageID = "Customer Card";
    Editable = false;
    PageType = List;
    PromotedActionCategoriesML = ENU='New,Process,Report,Approve',
                                 FRA='Nouveau,Traitement,État,Approuver';
    SourceTable = Table18;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Post Code";"Post Code")
                {
                    Visible = false;
                }
                field("Country/Region Code";"Country/Region Code")
                {
                    Visible = false;
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Fax No.";"Fax No.")
                {
                    Visible = false;
                }
                field("IC Partner Code";"IC Partner Code")
                {
                    Visible = false;
                }
                field(Contact;Contact)
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    Visible = false;
                }
                field("Customer Posting Group";"Customer Posting Group")
                {
                    Visible = false;
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                    Visible = false;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                    Visible = false;
                }
                field("Customer Price Group";"Customer Price Group")
                {
                    Visible = false;
                }
                field("Customer Disc. Group";"Customer Disc. Group")
                {
                    Visible = false;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    Visible = false;
                }
                field("Reminder Terms Code";"Reminder Terms Code")
                {
                    Visible = false;
                }
                field("Fin. Charge Terms Code";"Fin. Charge Terms Code")
                {
                    Visible = false;
                }
                field("Currency Code";"Currency Code")
                {
                    Visible = false;
                }
                field("Language Code";"Language Code")
                {
                    Visible = false;
                }
                field("Search Name";"Search Name")
                {
                }
                field(Blocked;Blocked)
                {
                    Visible = false;
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    Visible = false;
                }
                field("Application Method";"Application Method")
                {
                    Visible = false;
                }
                field("Combine Shipments";"Combine Shipments")
                {
                    Visible = false;
                }
                field(Reserve;Reserve)
                {
                    Visible = false;
                }
                field("Shipping Advice";"Shipping Advice")
                {
                    Visible = false;
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                    Visible = false;
                }
                field("Base Calendar Code";"Base Calendar Code")
                {
                    Visible = false;
                }
                field("Ancien Code Client";"Ancien Code Client")
                {
                }
                field(County;County)
                {
                }
                field("Address 2";"Address 2")
                {
                }
                field("Type Client";"Type Client")
                {
                }
                field("Type Contact";"Type Contact")
                {
                }
                field("VAT Registration No.";"VAT Registration No.")
                {
                    CaptionML = ENU='VAT Registration No.',
                                FRA='Matricule Fiscal';
                }
                field(Statut;Statut)
                {
                    Editable = false;
                }
                field(Région;Région)
                {
                }
                field(Catégorie;Catégorie)
                {
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field("Chain Name";"Chain Name")
                {
                }
                field("En-Cours autorisé";"Credit Limit (LCY)")
                {
                    CaptionML = ENU='Credit Limit (LCY)',
                                FRA='En-Cours autorisé';
                }
                field("Balance (LCY)";"Balance (LCY)")
                {

                    trigger OnDrillDown();
                    begin
                        DtldCustLedgEntry.SETRANGE("Customer No.","No.");
                        COPYFILTER("Global Dimension 1 Filter",DtldCustLedgEntry."Initial Entry Global Dim. 1");
                        COPYFILTER("Global Dimension 2 Filter",DtldCustLedgEntry."Initial Entry Global Dim. 2");
                        COPYFILTER("Currency Filter",DtldCustLedgEntry."Currency Code");
                        CustLedgEntry.DrillDownOnEntries(DtldCustLedgEntry);
                    end;
                }
                field("Livré Non Facturé";"Shipped Not Invoiced")
                {
                }
                field("Chèques en coffre";"Chèques en coffre")
                {
                }
                field("Chèques versés à l'encaissement";"Chèques versés à l'enaci")
                {
                    Caption = 'Chèques versés à l''encaissement';
                }
                field("Chèques Impayés";"Chèques retournés impayés")
                {
                    Caption = 'Chèques Impayés';
                }
                field("Effets en coffre";"Effets en coffre")
                {
                }
                field("Effets remis à l'encaissement";"Effets remis à l'encaissement")
                {
                }
                field("Effets remis à l'escompte";"Effets remis à l'escompte")
                {
                }
                field("Effets impayés";"Effets impayés")
                {
                }
                field("Effet Notifié non Echu";"Effet Notifié non Echu")
                {

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        CLEAR(PaymentLine);
                        PaymentLine.SETFILTER("Account No.",'%1',"No.");
                        PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
                        PaymentLine.SETFILTER("Copied To No.",'%1','');
                        PaymentLine.SETFILTER("Status No.",'%1',70000);
                        PaymentLine.SETFILTER("Due Date",'>=%1',WORKDATE);
                        PAGE.RUNMODAL(0,PaymentLine);
                    end;
                }
                field("Nbr Effet Impayé";"Nbr Effet Impayé")
                {
                }
                field("Nbr chèque Impayé";"Nbr chèque Impayé")
                {
                }
                field("Ancticédent Eff Impayé";"Ancticédent Eff Impayé")
                {
                }
                field("AncticédentChq Impayé";"AncticédentChq Impayé")
                {
                }
                field("En Cour Client";EnCourClient)
                {
                    Caption = 'En Cour Client';
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("En Cour Client AUTO";EnCourClientAuto)
                {
                }
                field("Correspondance AUTO";"Correspondance AUTO")
                {
                    Editable = false;
                }
                field("Libelle mode de paiement";"Libelle mode de paiement")
                {
                }
                field("Libelle condition de paiement";"Libelle condition de paiement")
                {
                }
                field("Libelle remise";"Libelle remise")
                {
                }
            }
        }
        area(factboxes)
        {
            part(;5360)
            {
                SubPageLink = No.=FIELD(No.);
                Visible = CRMIsCoupledToRecord;
            }
            part(;875)
            {
                SubPageLink = Source Type=CONST(Customer),
                              Source No.=FIELD(No.);
                Visible = SocialListeningVisible;
            }
            part(;876)
            {
                SubPageLink = Source Type=CONST(Customer),
                              Source No.=FIELD(No.);
                UpdatePropagation = Both;
                Visible = SocialListeningSetupVisible;
            }
            part(;9080)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = true;
            }
            part(;9081)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = false;
            }
            part(;9082)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = true;
            }
            part(;9084)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = false;
            }
            part(;9085)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = false;
            }
            part(;9086)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = false;
            }
            systempart(;Links)
            {
                Visible = true;
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
            group("&Customer")
            {
                CaptionML = ENU='&Customer',
                            FRA='&Client';
                Image = Customer;
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Commentaire&s';
                    Image = ViewComments;
                    RunObject = Page 124;
                    RunPageLink = Table Name=CONST(Customer),
                                  No.=FIELD(No.);
                }
                group(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        CaptionML = ENU='Dimensions-Single',
                                    FRA='Affectations - Simples';
                        Image = Dimensions;
                        RunObject = Page 540;
                        RunPageLink = Table ID=CONST(18),
                                      No.=FIELD(No.);
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData 348=R;
                        CaptionML = ENU='Dimensions-&Multiple',
                                    FRA='Affectations - &Multiples';
                        Image = DimensionSets;

                        trigger OnAction();
                        var
                            Cust : Record "18";
                            DefaultDimMultiple : Page "542";
                        begin
                            CurrPage.SETSELECTIONFILTER(Cust);
                            DefaultDimMultiple.SetMultiCust(Cust);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
                }
                action("Bank Accounts")
                {
                    CaptionML = ENU='Bank Accounts',
                                FRA='Comptes bancaires';
                    Image = BankAccount;
                    RunObject = Page 424;
                    RunPageLink = Customer No.=FIELD(No.);
                }
                action("Direct Debit Mandates")
                {
                    CaptionML = ENU='Direct Debit Mandates',
                                FRA='Mandats de prélèvement';
                    Image = MakeAgreement;
                    RunObject = Page 1230;
                    RunPageLink = Customer No.=FIELD(No.);
                }
                action("Ship-&to Addresses")
                {
                    CaptionML = ENU='Ship-&to Addresses',
                                FRA='&Adresses destinataire';
                    Image = ShipAddress;
                    RunObject = Page 301;
                    RunPageLink = Customer No.=FIELD(No.);
                }
                action("C&ontact")
                {
                    AccessByPermission = TableData 5050=R;
                    CaptionML = ENU='C&ontact',
                                FRA='C&ontact';
                    Image = ContactPerson;

                    trigger OnAction();
                    begin
                        ShowContact;
                    end;
                }
                action("Cross Re&ferences")
                {
                    CaptionML = ENU='Cross Re&ferences',
                                FRA='&Références externes';
                    Image = Change;
                    RunObject = Page 5723;
                    RunPageLink = Cross-Reference Type=CONST(Customer),
                                  Cross-Reference Type No.=FIELD(No.);
                    RunPageView = SORTING(Cross-Reference Type,Cross-Reference Type No.);
                }
                action(ApprovalEntries)
                {
                    CaptionML = ENU='Approvals',
                                FRA='Approbations';
                    Image = Approvals;

                    trigger OnAction();
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                    end;
                }
            }
            group(ActionGroupCRM)
            {
                CaptionML = ENU='Dynamics CRM',
                            FRA='Dynamics CRM';
                Visible = CRMIntegrationEnabled;
                action(CRMGotoAccount)
                {
                    CaptionML = ENU='Account',
                                FRA='Compte';
                    Image = CoupledCustomer;
                    ToolTipML = ENU='Open the coupled Microsoft Dynamics CRM account.',
                                FRA='Ouvrez le compte Microsoft Dynamics CRM couplé.';

                    trigger OnAction();
                    var
                        CRMIntegrationManagement : Codeunit "5330";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(RECORDID);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData 5331=IM;
                    CaptionML = ENU='Synchronize Now',
                                FRA='Synchroniser maintenant';
                    Image = Refresh;
                    ToolTipML = ENU='Send or get updated data to or from Microsoft Dynamics CRM.',
                                FRA='Envoyez/recevez des données mises à jour à/de Microsoft Dynamics CRM.';

                    trigger OnAction();
                    var
                        Customer : Record "18";
                        CRMIntegrationManagement : Codeunit "5330";
                        CustomerRecordRef : RecordRef;
                    begin
                        CurrPage.SETSELECTIONFILTER(Customer);
                        Customer.NEXT;

                        IF Customer.COUNT = 1 THEN
                          CRMIntegrationManagement.UpdateOneNow(Customer.RECORDID)
                        ELSE BEGIN
                          CustomerRecordRef.GETTABLE(Customer);
                          CRMIntegrationManagement.UpdateMultipleNow(CustomerRecordRef);
                        END
                    end;
                }
                action(UpdateStatisticsInCRM)
                {
                    CaptionML = ENU='Update Account Statistics',
                                FRA='Mettre à jour les statistiques compte';
                    Enabled = CRMIsCoupledToRecord;
                    Image = UpdateXML;
                    ToolTipML = ENU='Send Customer Statistics data to Microsoft Dynamics CRM to update the Account Statistics factbox',
                                FRA='Envoyer les données Statistiques client à Microsoft Dynamics CRM pour mettre à jour le récapitulatif Statistiques compte';

                    trigger OnAction();
                    var
                        CRMIntegrationManagement : Codeunit "5330";
                    begin
                        CRMIntegrationManagement.CreateOrUpdateCRMAccountStatistics(Rec);
                    end;
                }
                group(Coupling)
                {
                    CaptionML = Comment='Coupling is a noun',
                                ENU='Coupling',
                                FRA='Couplage';
                    Image = LinkAccount;
                    ToolTipML = ENU='Create, change, or delete a coupling between the Microsoft Dynamics NAV record and a Microsoft Dynamics CRM record.',
                                FRA='Créez, modifiez ou supprimez un couplage entre l''enregistrement Microsoft Dynamics NAV et un enregistrement Microsoft Dynamics CRM.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData 5331=IM;
                        CaptionML = ENU='Set Up Coupling',
                                    FRA='Configurer le couplage';
                        Image = LinkAccount;
                        ToolTipML = ENU='Create or modify the coupling to a Microsoft Dynamics CRM account.',
                                    FRA='Créez ou modifiez le couplage avec un compte Microsoft Dynamics CRM.';

                        trigger OnAction();
                        var
                            CRMIntegrationManagement : Codeunit "5330";
                        begin
                            CRMIntegrationManagement.DefineCoupling(RECORDID);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData 5331=IM;
                        CaptionML = ENU='Delete Coupling',
                                    FRA='Supprimer le couplage';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTipML = ENU='Delete the coupling to a Microsoft Dynamics CRM account.',
                                    FRA='Supprimez le couplage avec un compte Microsoft Dynamics CRM.';

                        trigger OnAction();
                        var
                            CRMCouplingManagement : Codeunit "5331";
                        begin
                            CRMCouplingManagement.RemoveCoupling(RECORDID);
                        end;
                    }
                }
                group(Create)
                {
                    CaptionML = ENU='Create',
                                FRA='Créer';
                    Image = NewCustomer;
                    action(CreateInCRM)
                    {
                        CaptionML = ENU='Create Account in Dynamics CRM',
                                    FRA='Créer un compte dans Dynamics CRM';
                        Image = NewCustomer;

                        trigger OnAction();
                        var
                            Customer : Record "18";
                            CRMIntegrationManagement : Codeunit "5330";
                            CustomerRecordRef : RecordRef;
                        begin
                            CurrPage.SETSELECTIONFILTER(Customer);
                            Customer.NEXT;

                            IF Customer.COUNT = 1 THEN
                              CRMIntegrationManagement.CreateNewRecordInCRM(RECORDID,FALSE)
                            ELSE BEGIN
                              CustomerRecordRef.GETTABLE(Customer);
                              CRMIntegrationManagement.CreateNewRecordsInCRM(CustomerRecordRef);
                            END
                        end;
                    }
                    action(CreateFromCRM)
                    {
                        CaptionML = ENU='Create Customer in Dynamics NAV',
                                    FRA='Créer un client dans Dynamics NAV';
                        Image = NewCustomer;

                        trigger OnAction();
                        var
                            CRMIntegrationManagement : Codeunit "5330";
                        begin
                            CRMIntegrationManagement.ManageCreateNewRecordFromCRM(DATABASE::Customer);
                        end;
                    }
                }
            }
            group(History)
            {
                CaptionML = ENU='History',
                            FRA='Historique';
                Image = History;
                action(CustomerLedgerEntries)
                {
                    CaptionML = ENU='Ledger E&ntries',
                                FRA='É&critures comptables';
                    Image = CustomerLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 25;
                    RunPageLink = Customer No.=FIELD(No.);
                    RunPageView = SORTING(Customer No.);
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 151;
                    RunPageLink = No.=FIELD(No.),
                                  Date Filter=FIELD(Date Filter),
                                  Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                  Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                    ShortCutKey = 'F7';
                }
                action("S&ales")
                {
                    CaptionML = ENU='S&ales',
                                FRA='&Ventes';
                    Image = Sales;
                    RunObject = Page 155;
                    RunPageLink = No.=FIELD(No.),
                                  Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                  Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                }
                action("Entry Statistics")
                {
                    CaptionML = ENU='Entry Statistics',
                                FRA='Statistiques écritures';
                    Image = EntryStatistics;
                    RunObject = Page 302;
                    RunPageLink = No.=FIELD(No.),
                                  Date Filter=FIELD(Date Filter),
                                  Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                  Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                }
                action("Statistics by C&urrencies")
                {
                    CaptionML = ENU='Statistics by C&urrencies',
                                FRA='Statistiques par &devise';
                    Image = Currencies;
                    RunObject = Page 486;
                    RunPageLink = Customer Filter=FIELD(No.),
                                  Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                  Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),
                                  Date Filter=FIELD(Date Filter);
                }
                action("Item &Tracking Entries")
                {
                    CaptionML = ENU='Item &Tracking Entries',
                                FRA='&Ecritures traçabilité';
                    Image = ItemTrackingLedger;

                    trigger OnAction();
                    var
                        ItemTrackingDocMgt : Codeunit "6503";
                    begin
                        ItemTrackingDocMgt.ShowItemTrackingForMasterData(1,"No.",'','','','','');
                    end;
                }
            }
            group("S&ales")
            {
                CaptionML = ENU='S&ales',
                            FRA='&Ventes';
                Image = Sales;
                action("Attestations de suspension de TVA")
                {
                    RunObject = Page 60318;
                }
                action(Sales_InvoiceDiscounts)
                {
                    CaptionML = ENU='Invoice &Discounts',
                                FRA='Remises &facture';
                    Image = CalculateInvoiceDiscount;
                    RunObject = Page 23;
                    RunPageLink = Code=FIELD(Invoice Disc. Code);
                }
                action(Sales_Prices)
                {
                    CaptionML = ENU='Prices',
                                FRA='Prix';
                    Image = Price;
                    RunObject = Page 7002;
                    RunPageLink = Sales Type=CONST(Customer),
                                  Sales Code=FIELD(No.);
                    RunPageView = SORTING(Sales Type,Sales Code);
                }
                action(Sales_LineDiscounts)
                {
                    CaptionML = ENU='Line Discounts',
                                FRA='Remises ligne';
                    Image = LineDiscount;
                    RunObject = Page 7004;
                    RunPageLink = Sales Type=CONST(Customer),
                                  Sales Code=FIELD(No.);
                    RunPageView = SORTING(Sales Type,Sales Code);
                }
                action("Prepa&yment Percentages")
                {
                    CaptionML = ENU='Prepa&yment Percentages',
                                FRA='Pourcentages acom&pte';
                    Image = PrepaymentPercentages;
                    RunObject = Page 664;
                    RunPageLink = Sales Type=CONST(Customer),
                                  Sales Code=FIELD(No.);
                    RunPageView = SORTING(Sales Type,Sales Code);
                }
                action("S&td. Cust. Sales Codes")
                {
                    CaptionML = ENU='S&td. Cust. Sales Codes',
                                FRA='Codes &vente std client';
                    Image = CodesList;
                    RunObject = Page 173;
                    RunPageLink = Customer No.=FIELD(No.);
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRA='Documents';
                Image = Documents;
                action(Quotes)
                {
                    CaptionML = ENU='Quotes',
                                FRA='Devis';
                    Image = Quote;
                    RunObject = Page 9300;
                    RunPageLink = Sell-to Customer No.=FIELD(No.);
                    RunPageView = SORTING(Sell-to Customer No.);
                }
                action(Orders)
                {
                    CaptionML = ENU='Orders',
                                FRA='Commandes';
                    Image = Document;
                    RunObject = Page 9305;
                    RunPageLink = Sell-to Customer No.=FIELD(No.);
                    RunPageView = SORTING(Sell-to Customer No.);
                }
                action("Return Orders")
                {
                    CaptionML = ENU='Return Orders',
                                FRA='Retours';
                    Image = ReturnOrder;
                    RunObject = Page 9304;
                    RunPageLink = Sell-to Customer No.=FIELD(No.);
                    RunPageView = SORTING(Sell-to Customer No.);
                }
                group("Issued Documents")
                {
                    CaptionML = ENU='Issued Documents',
                                FRA='Documents émis';
                    Image = Documents;
                    action("Issued &Reminders")
                    {
                        CaptionML = ENU='Issued &Reminders',
                                    FRA='&Relances émises';
                        Image = OrderReminder;
                        RunObject = Page 440;
                        RunPageLink = Customer No.=FIELD(No.);
                        RunPageView = SORTING(Customer No.,Posting Date);
                    }
                    action("Issued &Finance Charge Memos")
                    {
                        CaptionML = ENU='Issued &Finance Charge Memos',
                                    FRA='Fact&ures d''intérêts émises';
                        Image = FinChargeMemo;
                        RunObject = Page 452;
                        RunPageLink = Customer No.=FIELD(No.);
                        RunPageView = SORTING(Customer No.,Posting Date);
                    }
                }
                action("Blanket Orders")
                {
                    CaptionML = ENU='Blanket Orders',
                                FRA='Commandes ouvertes';
                    Image = BlanketOrder;
                    RunObject = Page 9303;
                    RunPageLink = Sell-to Customer No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Sell-to Customer No.);
                }
            }
            group("Credit Card")
            {
                CaptionML = ENU='Credit Card',
                            FRA='Carte de crédit';
                Image = CreditCard;
                group("Credit Cards")
                {
                    CaptionML = ENU='Credit Cards',
                                FRA='Cartes de crédit';
                    Image = CreditCard;
                }
            }
            group(Service)
            {
                CaptionML = ENU='Service',
                            FRA='Service';
                Image = ServiceItem;
                action("Service Orders")
                {
                    CaptionML = ENU='Service Orders',
                                FRA='Commandes service';
                    Image = Document;
                    RunObject = Page 9318;
                    RunPageLink = Customer No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Customer No.);
                }
                action("Ser&vice Contracts")
                {
                    CaptionML = ENU='Ser&vice Contracts',
                                FRA='&Contrats de service';
                    Image = ServiceAgreement;
                    RunObject = Page 6065;
                    RunPageLink = Customer No.=FIELD(No.);
                    RunPageView = SORTING(Customer No.,Ship-to Code);
                }
                action("Service &Items")
                {
                    CaptionML = ENU='Service &Items',
                                FRA='Ar&ticles de service';
                    Image = ServiceItem;
                    RunObject = Page 5988;
                    RunPageLink = Customer No.=FIELD(No.);
                    RunPageView = SORTING(Customer No.,Ship-to Code,Item No.,Serial No.);
                }
            }
        }
        area(creation)
        {
            action("Blanket Sales Order")
            {
                CaptionML = ENU='Blanket Sales Order',
                            FRA='Commande ouverte vente';
                Image = BlanketOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 507;
                RunPageLink = Sell-to Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Sales Quote")
            {
                CaptionML = ENU='Sales Quote',
                            FRA='Devis';
                Image = Quote;
                Promoted = true;
                PromotedCategory = New;
                RunObject = Page 41;
                RunPageLink = Sell-to Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Sales Invoice")
            {
                CaptionML = ENU='Sales Invoice',
                            FRA='Facture vente';
                Image = Invoice;
                Promoted = true;
                PromotedCategory = New;
                RunObject = Page 43;
                RunPageLink = Sell-to Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Sales Order")
            {
                CaptionML = ENU='Sales Order',
                            FRA='Commande vente';
                Image = Document;
                Promoted = true;
                PromotedCategory = New;
                RunObject = Page 42;
                RunPageLink = Sell-to Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Sales Credit Memo")
            {
                CaptionML = ENU='Sales Credit Memo',
                            FRA='Avoir vente';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 44;
                RunPageLink = Sell-to Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Sales Return Order")
            {
                CaptionML = ENU='Sales Return Order',
                            FRA='Retour vente';
                Image = ReturnOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 6630;
                RunPageLink = Sell-to Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Service Quote")
            {
                CaptionML = ENU='Service Quote',
                            FRA='Devis service';
                Image = Quote;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 5964;
                RunPageLink = Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Service Invoice")
            {
                CaptionML = ENU='Service Invoice',
                            FRA='Facture service';
                Image = Invoice;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 5933;
                RunPageLink = Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Service Order")
            {
                CaptionML = ENU='Service Order',
                            FRA='Commande service';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 5900;
                RunPageLink = Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Service Credit Memo")
            {
                CaptionML = ENU='Service Credit Memo',
                            FRA='Avoir service';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 5935;
                RunPageLink = Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action(Reminder)
            {
                CaptionML = ENU='Reminder',
                            FRA='Relance';
                Image = Reminder;
                Promoted = true;
                PromotedCategory = New;
                RunObject = Page 434;
                RunPageLink = Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Finance Charge Memo")
            {
                CaptionML = ENU='Finance Charge Memo',
                            FRA='Facture d''intérêts';
                Image = FinChargeMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 446;
                RunPageLink = Customer No.=FIELD(No.);
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRA='Approbation demande achat';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    CaptionML = ENU='Send A&pproval Request',
                                FRA='Envoyer demande d''a&pprobation';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        IF ApprovalsMgmt.CheckCustomerApprovalsWorkflowEnabled(Rec) THEN
                          ApprovalsMgmt.OnSendCustomerForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    CaptionML = ENU='Cancel Approval Re&quest',
                                FRA='Annuler demande d''appro&bation';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.OnCancelCustomerApprovalRequest(Rec);
                    end;
                }
            }
            action("Cash Receipt Journal")
            {
                CaptionML = ENU='Cash Receipt Journal',
                            FRA='Feuille règlement';
                Image = CashReceiptJournal;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 255;
            }
            action("Sales Journal")
            {
                CaptionML = ENU='Sales Journal',
                            FRA='Feuille vente';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 253;
            }
        }
        area(reporting)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                action("Véhicules")
                {
                    Image = ServiceItem;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page 60066;
                    RunPageLink = Customer No.=FIELD(No.);
                }
                action("Customer List")
                {
                    CaptionML = ENU='Customer List',
                                FRA='Liste des clients';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 101;
                }
                action("Customer Register")
                {
                    CaptionML = ENU='Customer Register',
                                FRA='Historique des transactions client';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 103;
                }
                action("Customer - Top 10 List")
                {
                    CaptionML = ENU='Customer - Top 10 List',
                                FRA='Clients : Palmarès';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 111;
                }
            }
            group(Sales)
            {
                CaptionML = ENU='Sales',
                            FRA='Ventes';
                Image = Sales;
                action("Customer - Order Summary")
                {
                    CaptionML = ENU='Customer - Order Summary',
                                FRA='Clients : Liste des commandes';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 107;
                }
                action("Customer - Order Detail")
                {
                    CaptionML = ENU='Customer - Order Detail',
                                FRA='Clients : Détail des commandes';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 108;
                }
                action("Customer - Sales List")
                {
                    CaptionML = ENU='Customer - Sales List',
                                FRA='Clients : Liste des ventes';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 119;
                }
                action("Sales Statistics")
                {
                    CaptionML = ENU='Sales Statistics',
                                FRA='Statistiques vente';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 112;
                }
                action("Customer/Item Sales")
                {
                    CaptionML = ENU='Customer/Item Sales',
                                FRA='Ventes d''articles par client';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 113;
                }
            }
            group("Financial Management")
            {
                CaptionML = ENU='Financial Management',
                            FRA='Gestion financière';
                Image = "Report";
                action("Customer - Detail Trial Bal.")
                {
                    CaptionML = ENU='Customer - Detail Trial Bal.',
                                FRA='Clients : Grand livre client';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 104;
                }
                action("Customer - Summary Aging")
                {
                    CaptionML = ENU='Customer - Summary Aging',
                                FRA='Clients : Échéancier';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 105;
                }
                action("Customer Detailed Aging")
                {
                    CaptionML = ENU='Customer Detailed Aging',
                                FRA='Écritures clients échues';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 106;
                }
                action(Statement)
                {
                    CaptionML = ENU='Statement',
                                FRA='Relevé';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Codeunit 8810;
                }
                action(Reminder)
                {
                    CaptionML = ENU='Reminder',
                                FRA='Relance';
                    Image = Reminder;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 117;
                }
                action("Aged Accounts Receivable")
                {
                    CaptionML = ENU='Aged Accounts Receivable',
                                FRA='Comptabilité client âgée';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 120;
                }
                action("Customer - Balance to Date")
                {
                    CaptionML = ENU='Customer - Balance to Date',
                                FRA='Clients : Écritures ouvertes';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 121;
                }
                action("Customer - Trial Balance")
                {
                    CaptionML = ENU='Customer - Trial Balance',
                                FRA='Clients : Balance';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 129;
                }
                action("Customer - Payment Receipt")
                {
                    CaptionML = ENU='Customer - Payment Receipt',
                                FRA='Reçu paiement client';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 211;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        CRMCouplingManagement : Codeunit "5331";
    begin
        SetSocialListeningFactboxVisibility;

        CRMIsCoupledToRecord :=
          CRMCouplingManagement.IsRecordCoupledToCRM(RECORDID) AND CRMIntegrationEnabled;
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;

    trigger OnAfterGetRecord();
    begin
        SetSocialListeningFactboxVisibility;

        CLEAR(PaymentLine);
        PaymentLine.SETFILTER("Account No.",'%1',"No.");
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-EFF');
        PaymentLine.SETFILTER("Copied To No.",'%1','');
        PaymentLine.SETFILTER("Status No.",'%1',70000);
        PaymentLine.SETFILTER("Due Date",'>=%1',WORKDATE);
        PaymentLine.CALCSUMS(Amount);
        "Effet Notifié non Echu" := ABS(PaymentLine.Amount);

        CALCFIELDS("Balance (LCY)","Shipped Not Invoiced (LCY)","Chèques versés à l'enaci","Effets remis à l'encaissement","Effets remis à l'escompte",
        "Chèques en coffre","Effets en coffre");

        EnCourClient :=  "Balance (LCY)" + ABS("Chèques versés à l'enaci") + ABS("Effets remis à l'encaissement") + ABS("Effets remis à l'escompte") +
         +ABS("Shipped Not Invoiced (LCY)") +ABS("Chèques en coffre")+ABS("Effets en coffre") + ABS("Effet Notifié non Echu");


        "Effets remis à l'escompte" := -"Effets remis à l'escompte";
        "Effets remis à l'encaissement" := -"Effets remis à l'encaissement";
        "Chèques versés à l'enaci" := -"Chèques versés à l'enaci";
        "Chèques en coffre" := -"Chèques en coffre";
        "Effets en coffre" := -"Effets en coffre";



        //AUTO
        EnCourClientAuto := 0;
        CLEAR(CustomerAuto);
        //CustomerAuto.CHANGECOMPANY('AURES AUTO');
        IF "Correspondance AUTO" <> '' THEN
         BEGIN
          CustomerAuto.GET("Correspondance AUTO");
          CLEAR(PaymentLineAuto);
         // PaymentLineAuto.CHANGECOMPANY('AURES AUTO');
          PaymentLineAuto.SETFILTER("Account No.",'%1',CustomerAuto."No.");
          PaymentLineAuto.SETFILTER("Payment Class",'%1','ENC-EFF');
          PaymentLineAuto.SETFILTER("Copied To No.",'%1','');
          PaymentLineAuto.SETFILTER("Status No.",'%1',70000);
          PaymentLineAuto.SETFILTER("Due Date",'>=%1',WORKDATE);
          PaymentLineAuto.CALCSUMS(Amount);
          CustomerAuto.CALCFIELDS("Balance (LCY)","Shipped Not Invoiced (LCY)","Chèques versés à l'enaci","Effets remis à l'encaissement","Effets remis à l'escompte",
          "Chèques en coffre","Effets en coffre");
          EnCourClientAuto :=  CustomerAuto."Balance (LCY)" + ABS(CustomerAuto."Chèques versés à l'enaci") + ABS(CustomerAuto."Effets remis à l'encaissement") + ABS(CustomerAuto."Effets remis à l'escompte") +
           +ABS(CustomerAuto."Shipped Not Invoiced (LCY)") +ABS(CustomerAuto."Chèques en coffre")+ABS(CustomerAuto."Effets en coffre") + ABS(PaymentLineAuto.Amount);;
         END;
    end;

    trigger OnOpenPage();
    var
        CRMIntegrationManagement : Codeunit "5330";
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    end;

    var
        ApprovalsMgmt : Codeunit "1535";
        SocialListeningSetupVisible : Boolean;
        SocialListeningVisible : Boolean;
        CRMIntegrationEnabled : Boolean;
        CRMIsCoupledToRecord : Boolean;
        OpenApprovalEntriesExist : Boolean;
        EnCourClient : Decimal;
        PaymentLine : Record "10866";
        PaymentLinesList : Page "10872";
        DtldCustLedgEntry : Record "379";
        CustLedgEntry : Record "21";
        EnCourClientAuto : Decimal;
        PaymentLineAuto : Record "10866";
        CustomerAuto : Record "18";

    procedure GetSelectionFilter() : Text;
    var
        Cust : Record "18";
        SelectionFilterManagement : Codeunit "46";
    begin
        CurrPage.SETSELECTIONFILTER(Cust);
        EXIT(SelectionFilterManagement.GetSelectionFilterForCustomer(Cust));
    end;

    procedure SetSelection(var Cust : Record "18");
    begin
        CurrPage.SETSELECTIONFILTER(Cust);
    end;

    local procedure SetSocialListeningFactboxVisibility();
    var
        SocialListeningMgt : Codeunit "871";
    begin
        SocialListeningMgt.GetCustFactboxVisibility(Rec,SocialListeningSetupVisible,SocialListeningVisible);
    end;
}

