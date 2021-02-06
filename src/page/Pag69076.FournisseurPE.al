page 69076 "Fournisseur PE*"
{
    // version MAZDA1004

    CaptionML = ENU='Vendor List',
                FRA='Liste des fournisseurs';
    CardPageID = "Vendor Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Table23;
    SourceTableView = WHERE(No.=FILTER(PE*));

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
                field(Balance;Balance)
                {
                }
                field("Balance (LCY)";"Balance (LCY)")
                {
                }
                field("Dimension Value Code";"Dimension Value Code")
                {
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
                field("Purchaser Code";"Purchaser Code")
                {
                    Visible = false;
                }
                field("Debit Amount";"Debit Amount")
                {
                }
                field("Credit Amount";"Credit Amount")
                {
                }
                field("Vendor Posting Group";"Vendor Posting Group")
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
                field("Payment Terms Code";"Payment Terms Code")
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
                field("Location Code2";"Location Code")
                {
                    Visible = false;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    Visible = false;
                }
                field("Lead Time Calculation";"Lead Time Calculation")
                {
                    Visible = false;
                }
                field("Base Calendar Code";"Base Calendar Code")
                {
                    Visible = false;
                }
                field("Matricule Fiscal";"Matricule Fiscal")
                {
                }
                field("VAT Registration No.";"VAT Registration No.")
                {
                }
            }
        }
        area(factboxes)
        {
            part(;9093)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = false;
            }
            part(;9094)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = true;
            }
            part(;9095)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = true;
            }
            part(;9096)
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
            group("Ven&dor")
            {
                CaptionML = ENU='Ven&dor',
                            FRA='Fo&urnisseur';
                Image = Vendor;
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
                        RunPageLink = Table ID=CONST(23),
                                      No.=FIELD(No.);
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        CaptionML = ENU='Dimensions-&Multiple',
                                    FRA='Affectations - &Multiples';
                        Image = DimensionSets;

                        trigger OnAction();
                        var
                            Vend : Record "23";
                            DefaultDimMultiple : Page "542";
                        begin
                            CurrPage.SETSELECTIONFILTER(Vend);
                            DefaultDimMultiple.SetMultiVendor(Vend);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
                }
                action("Bank Accounts")
                {
                    CaptionML = ENU='Bank Accounts',
                                FRA='Comptes bancaires';
                    Image = BankAccount;
                    RunObject = Page 426;
                    RunPageLink = Vendor No.=FIELD(No.);
                }
                action("C&ontact")
                {
                    CaptionML = ENU='C&ontact',
                                FRA='C&ontact';
                    Image = ContactPerson;

                    trigger OnAction();
                    begin
                        ShowContact;
                    end;
                }
                separator()
                {
                }
                action("Order &Addresses")
                {
                    CaptionML = ENU='Order &Addresses',
                                FRA='&Adresses de commande';
                    Image = Addresses;
                    RunObject = Page 369;
                    RunPageLink = Vendor No.=FIELD(No.);
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 124;
                    RunPageLink = Table Name=CONST(Vendor),
                                  No.=FIELD(No.);
                }
                action("Cross Re&ferences")
                {
                    CaptionML = ENU='Cross Re&ferences',
                                FRA='&Références externes';
                    Image = Change;
                    RunObject = Page 5723;
                    RunPageLink = Cross-Reference Type=CONST(Vendor),
                                  Cross-Reference Type No.=FIELD(No.);
                    RunPageView = SORTING(Cross-Reference Type,Cross-Reference Type No.);
                }
                separator()
                {
                }
            }
            group("&Purchases")
            {
                CaptionML = ENU='&Purchases',
                            FRA='Ac&hats';
                Image = Purchasing;
                action(Items)
                {
                    CaptionML = ENU='Items',
                                FRA='Articles';
                    Image = Item;
                    RunObject = Page 297;
                    RunPageLink = Vendor No.=FIELD(No.);
                    RunPageView = SORTING(Vendor No.);
                }
                action("Invoice &Discounts")
                {
                    CaptionML = ENU='Invoice &Discounts',
                                FRA='Remises &facture';
                    Image = CalculateInvoiceDiscount;
                    RunObject = Page 28;
                    RunPageLink = Code=FIELD(Invoice Disc. Code);
                }
                action(Prices)
                {
                    CaptionML = ENU='Prices',
                                FRA='Prix';
                    Image = Price;
                    RunObject = Page 7012;
                    RunPageLink = Vendor No.=FIELD(No.);
                    RunPageView = SORTING(Vendor No.);
                }
                action("Line Discounts")
                {
                    CaptionML = ENU='Line Discounts',
                                FRA='Remises ligne';
                    Image = LineDiscount;
                    RunObject = Page 7014;
                    RunPageLink = Vendor No.=FIELD(No.);
                    RunPageView = SORTING(Vendor No.);
                }
                action("Prepa&yment Percentages")
                {
                    CaptionML = ENU='Prepa&yment Percentages',
                                FRA='Pourcentages acom&pte';
                    Image = PrepaymentPercentages;
                    RunObject = Page 665;
                    RunPageLink = Vendor No.=FIELD(No.);
                    RunPageView = SORTING(Vendor No.);
                }
                action("S&td. Vend. Purchase Codes")
                {
                    CaptionML = ENU='S&td. Vend. Purchase Codes',
                                FRA='Codes achat fourn. s&td';
                    Image = CodesList;
                    RunObject = Page 178;
                    RunPageLink = Vendor No.=FIELD(No.);
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRA='Documents';
                Image = Administration;
                action(Quotes)
                {
                    CaptionML = ENU='Quotes',
                                FRA='Demandes de prix';
                    Image = Quote;
                    RunObject = Page 9306;
                    RunPageLink = Buy-from Vendor No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Buy-from Vendor No.);
                }
                action(Orders)
                {
                    CaptionML = ENU='Orders',
                                FRA='Commandes';
                    Image = Document;
                    RunObject = Page 9307;
                    RunPageLink = Buy-from Vendor No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Buy-from Vendor No.);
                }
                action("Return Orders")
                {
                    CaptionML = ENU='Return Orders',
                                FRA='Retours';
                    Image = ReturnOrder;
                    RunObject = Page 9311;
                    RunPageLink = Buy-from Vendor No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Buy-from Vendor No.);
                }
                action("Blanket Orders")
                {
                    CaptionML = ENU='Blanket Orders',
                                FRA='Commandes ouvertes';
                    Image = BlanketOrder;
                    RunObject = Page 9310;
                    RunPageLink = Buy-from Vendor No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Buy-from Vendor No.);
                }
            }
            group(History)
            {
                CaptionML = ENU='History',
                            FRA='Historique';
                Image = History;
                action("Ledger E&ntries")
                {
                    CaptionML = ENU='Ledger E&ntries',
                                FRA='É&critures comptables';
                    Image = CustomerLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 29;
                    RunPageLink = Vendor No.=FIELD(No.);
                    RunPageView = SORTING(Vendor No.);
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 152;
                    RunPageLink = No.=FIELD(No.),
                                  Date Filter=FIELD(Date Filter),
                                  Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                  Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                    ShortCutKey = 'F7';
                }
                action(Purchases)
                {
                    CaptionML = ENU='Purchases',
                                FRA='Achats';
                    Image = Purchase;
                    RunObject = Page 156;
                    RunPageLink = No.=FIELD(No.),
                                  Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                  Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                }
                action("Entry Statistics")
                {
                    CaptionML = ENU='Entry Statistics',
                                FRA='Statistiques écritures';
                    Image = EntryStatistics;
                    RunObject = Page 303;
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
                    RunObject = Page 487;
                    RunPageLink = Vendor Filter=FIELD(No.),
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
                        ItemTrackingMgt : Codeunit "6500";
                        ItemTrackingDocManagement : Codeunit "6503";
                    begin
                        //ItemTrackingMgt.CallItemTrackingEntryForm(2,"No.",'','','','','');
                        ItemTrackingDocManagement.ShowItemTrackingForMasterData(2,"No.",'','','','','');
                    end;
                }
            }
        }
        area(creation)
        {
            action("Blanket Purchase Order")
            {
                CaptionML = ENU='Blanket Purchase Order',
                            FRA='Commande ouverte achat';
                Image = BlanketOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 509;
                RunPageLink = Buy-from Vendor No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Purchase Quote")
            {
                CaptionML = ENU='Purchase Quote',
                            FRA='Demande de prix';
                Image = Quote;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 49;
                RunPageLink = Buy-from Vendor No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Purchase Invoice")
            {
                CaptionML = ENU='Purchase Invoice',
                            FRA='Facture achat';
                Image = Invoice;
                Promoted = true;
                PromotedCategory = New;
                RunObject = Page 51;
                RunPageLink = Buy-from Vendor No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Purchase Order")
            {
                CaptionML = ENU='Purchase Order',
                            FRA='Commande achat';
                Image = Document;
                Promoted = true;
                PromotedCategory = New;
                RunObject = Page 50;
                RunPageLink = Buy-from Vendor No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Purchase Credit Memo")
            {
                CaptionML = ENU='Purchase Credit Memo',
                            FRA='Avoir achat';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 52;
                RunPageLink = Buy-from Vendor No.=FIELD(No.);
                RunPageMode = Create;
            }
            action("Purchase Return Order")
            {
                CaptionML = ENU='Purchase Return Order',
                            FRA='Retour achat';
                Image = ReturnOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page 6640;
                RunPageLink = Buy-from Vendor No.=FIELD(No.);
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            action("Payment Journal")
            {
                CaptionML = ENU='Payment Journal',
                            FRA='Feuille paiement';
                Image = PaymentJournal;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 256;
            }
            action("Purchase Journal")
            {
                CaptionML = ENU='Purchase Journal',
                            FRA='Feuille achat';
                Image = Journals;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 254;
            }
        }
        area(reporting)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                action("Vendor - List")
                {
                    CaptionML = ENU='Vendor - List',
                                FRA='Fourn. : Liste';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 301;
                }
                action("Vendor Register")
                {
                    CaptionML = ENU='Vendor Register',
                                FRA='Historique des transactions fournisseur';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 303;
                }
                action("Vendor Item Catalog")
                {
                    CaptionML = ENU='Vendor Item Catalog',
                                FRA='Fourn. : Catalogue articles';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 320;
                }
                action("Vendor - Labels")
                {
                    CaptionML = ENU='Vendor - Labels',
                                FRA='Fournisseur - Étiquettes';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 310;
                }
                action("Vendor - Top 10 List")
                {
                    CaptionML = ENU='Vendor - Top 10 List',
                                FRA='Fourn. : Palmarès';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 311;
                }
            }
            group(Orders)
            {
                CaptionML = ENU='Orders',
                            FRA='Commandes';
                Image = "Report";
                action("Vendor - Order Summary")
                {
                    CaptionML = ENU='Vendor - Order Summary',
                                FRA='Fourn. : Liste des commandes';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 307;
                }
                action("Vendor - Order Detail")
                {
                    CaptionML = ENU='Vendor - Order Detail',
                                FRA='Fourn. : Détail des commandes';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 308;
                }
            }
            group(Purchase)
            {
                CaptionML = ENU='Purchase',
                            FRA='Achats';
                Image = Purchase;
                action("Vendor - Purchase List")
                {
                    CaptionML = ENU='Vendor - Purchase List',
                                FRA='Fourn. : Liste des achats';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 309;
                }
                action("Vendor/Item Purchases")
                {
                    CaptionML = ENU='Vendor/Item Purchases',
                                FRA='Achats d''articles par fournisseur';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 313;
                }
                action("Purchase Statistics")
                {
                    CaptionML = ENU='Purchase Statistics',
                                FRA='Statistiques achat';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 312;
                }
            }
            group("Financial Management")
            {
                CaptionML = ENU='Financial Management',
                            FRA='Gestion financière';
                Image = "Report";
                action("Payments on Hold")
                {
                    CaptionML = ENU='Payments on Hold',
                                FRA='Paiements en attente';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 319;
                }
                action("Vendor - Summary Aging")
                {
                    CaptionML = ENU='Vendor - Summary Aging',
                                FRA='Fourn. : Échéancier';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 305;
                }
                action("Aged Accounts Payable")
                {
                    CaptionML = ENU='Aged Accounts Payable',
                                FRA='Comptabilité fournisseur âgée';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 322;
                }
                action("Vendor - Balance to Date")
                {
                    CaptionML = ENU='Vendor - Balance to Date',
                                FRA='Fourn. : Détail écr. ouvertes';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report 321;
                }
                action("Vendor - Trial Balance")
                {
                    CaptionML = ENU='Vendor - Trial Balance',
                                FRA='Fourn. : Balance';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 329;
                }
                action("Vendor - Detail Trial Balance")
                {
                    CaptionML = ENU='Vendor - Detail Trial Balance',
                                FRA='Fourn. : Grand livre fourn.';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report 304;
                }
            }
        }
    }

    procedure GetSelectionFilter() : Text;
    var
        Vend : Record "23";
        SelectionFilterManagement : Codeunit "46";
    begin
        CurrPage.SETSELECTIONFILTER(Vend);
        EXIT(SelectionFilterManagement.GetSelectionFilterForVendor(Vend));
    end;

    procedure SetSelection(var Vend : Record "23");
    begin
        CurrPage.SETSELECTIONFILTER(Vend);
    end;
}

