page 69013 "Responsable Magasin"
{
    // version NAVW17.10

    CaptionML = ENU='Role Center',
                FRA='Tableau de bord';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69060)
                {
                }
            }
            group()
            {
                part(;9150)
                {
                }
                part(;9152)
                {
                }
                systempart(;MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Customer - &Order Summary")
            {
                CaptionML = ENU='Customer - &Order Summary',
                            FRA='Clients : Liste des c&ommandes';
                Image = "Report";
                RunObject = Report 107;
            }
            action("Customer - &Top 10 List")
            {
                CaptionML = ENU='Customer - &Top 10 List',
                            FRA='Clien&ts : Palmarès';
                Image = "Report";
                RunObject = Report 111;
            }
            action("Customer/&Item Sales")
            {
                CaptionML = ENU='Customer/&Item Sales',
                            FRA='Client/Ventes d''art&icles';
                Image = "Report";
                RunObject = Report 113;
            }
            action(Inventaire)
            {
                RunObject = Page 69069;
            }
            separator()
            {
            }
            action("Salesperson - Sales &Statistics")
            {
                CaptionML = ENU='Salesperson - Sales &Statistics',
                            FRA='Vendeurs : &Statistiques ventes';
                Image = "Report";
                RunObject = Report 114;
            }
            action("Price &List")
            {
                CaptionML = ENU='Price &List',
                            FRA='&Liste des prix';
                Image = "Report";
                RunObject = Report 715;
            }
            action("Inventory - Sales &Back Orders")
            {
                CaptionML = ENU='Inventory - Sales &Back Orders',
                            FRA='Stoc&ks : Commandes à livrer';
                Image = "Report";
                RunObject = Report 718;
            }
            action(Items)
            {
                CaptionML = ENU='Items',
                            FRA='Articles';
                Image = Item;
                RunObject = Page 31;
            }
            action("Regroupement des BL")
            {
                Image = CalculateInventory;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Report 60046;
            }
            separator()
            {
            }
            action("CA PR par Clientt")
            {
                CaptionML = ENU='CA PR par Clientt',
                            FRA='CA PR par Client';
                Image = "Report";
                RunObject = Report 60035;
            }
            action("CA PR par Centre de Gestion")
            {
                CaptionML = ENU='CA PR par Centre de Gestion',
                            FRA='CA PR par Centre de Gestion';
                Image = "Report";
                RunObject = Report 60037;
            }
            action("<Report CA PR par client centre Finterne")
            {
                CaptionML = ENU='CA PR par Centre de Gestion',
                            FRA='CA PR C. Gestion +FInterne';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60071;
            }
            action("CA par C.Gestion Liv/NFact PR")
            {
                CaptionML = ENU='CA par C.Gestion Liv/NFact PR',
                            FRA='CA PR Bl Non facturer';
                Image = "Report";
                RunObject = Report 60040;
            }
            action("Feuille reclassement")
            {
                Caption = 'Feuille reclassement';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 393;
            }
            action("Feuille inventaire")
            {
                Caption = 'Feuille inventaire';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 392;
            }
            action("Report Stock consolide")
            {
                Caption = 'Report Stock consolide';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60140;
            }
            action("PRIX/STOCK par magasin")
            {
                Caption = 'PRIX/STOCK par magasin';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 50097;
            }
            action("Suivie Stock Magasin")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60034;
            }
            action("Journée Commercial PR")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60061;
            }
            action("Feuille Article")
            {
                Image = InventoryJournal;
                RunObject = Page 40;
            }
        }
        area(embedding)
        {
            action("Liste des Prix PR")
            {
                RunObject = Page 60117;
                RunPageView = SORTING(Item No.,Sales Type,Sales Code,Starting Date,Currency Code,Variant Code,Unit of Measure Code,Minimum Quantity)
                              ORDER(Ascending)
                              WHERE(Groupe compta stock=FILTER(<>VEHICULES));
            }
            action(Items)
            {
                CaptionML = ENU='Items',
                            FRA='Articles';
                Image = Item;
                RunObject = Page 31;
            }
            action(Customers)
            {
                CaptionML = ENU='Customers',
                            FRA='Clients';
                Image = Customer;
                RunObject = Page 22;
            }
            action("Ordres de transfert à envoyer")
            {
                RunObject = Page 60149;
            }
            action("Ordres de transfert à recevoir")
            {
                RunObject = Page 50024;
            }
            action("Liste des accesoirs")
            {
                Caption = 'Liste des accesoirs';
                RunObject = Page 60128;
            }
        }
        area(sections)
        {
            group(VentePr)
            {
                Caption = 'Vente Pr';
                action("Sales Quotes")
                {
                    CaptionML = ENU='Sales Quotes',
                                FRA='Devis';
                    Image = Quote;
                    RunObject = Page 60022;
                }
                action("Sales Orders")
                {
                    CaptionML = ENU='Sales Orders',
                                FRA='Commandes en cours';
                    Image = "Order";
                    RunObject = Page 60025;
                }
                action("Sales Orders")
                {
                    CaptionML = ENU='Sales Orders',
                                FRA='Facture en cours';
                    Image = "Order";
                    RunObject = Page 60034;
                }
                action("Shipped Not Invoiced")
                {
                    CaptionML = ENU='Shipped Not Invoiced',
                                FRA='Livré non facturé';
                    RunObject = Page 60025;
                    RunPageView = WHERE(Shipped Not Invoiced=CONST(Yes));
                }
                action("Shipped Not Invoiced")
                {
                    CaptionML = ENU='Shipped Not Invoiced',
                                FRA='Commandes non livrés';
                    RunObject = Page 60025;
                    RunPageView = WHERE(Shipped Not Invoiced=CONST(No));
                }
                action("Completely Shipped Not Invoiced")
                {
                    CaptionML = ENU='Completely Shipped Not Invoiced',
                                FRA='Complètement livré non facturé';
                    RunObject = Page 60025;
                    RunPageView = WHERE(Completely Shipped=CONST(Yes),
                                        Invoice=CONST(No));
                }
                action(UpdateSalesPrice)
                {
                    Caption = 'Mise à jour prix de vente';
                    Image = UpdateUnitCost;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page 69028;
                }
            }
            group(StockPr)
            {
                Caption = 'Stock PR';
                action("Ordres de transfert1")
                {
                    Caption = 'Ordres de transfert';
                    RunObject = Page 5742;
                }
            }
            group(Achat)
            {
                Caption = 'Achat Pr';
                action("Commande achat")
                {
                    Caption = 'Commande Achat ouverte';
                    RunObject = Page 9310;
                }
            }
            group("Posted Documents")
            {
                CaptionML = ENU='Posted Documents',
                            FRA='Documents validés';
                Image = FiledPosted;
                action("Posted Sales Shipments")
                {
                    CaptionML = ENU='Posted Sales Shipments',
                                FRA='Expéditions vente enregistrées';
                    Image = PostedShipment;
                    RunObject = Page 60052;
                }
                action("Posted Sales Invoices")
                {
                    CaptionML = ENU='Posted Sales Invoices',
                                FRA='Factures vente enregistrées';
                    Image = PostedOrder;
                    RunObject = Page 60049;
                }
                action("Posted Return Receipts")
                {
                    CaptionML = ENU='Posted Return Receipts',
                                FRA='Réceptions retour enregistrées';
                    Image = PostedReturnReceipt;
                    RunObject = Page 60058;
                }
                action("Posted Sales Credit Memos")
                {
                    CaptionML = ENU='Posted Sales Credit Memos',
                                FRA='Avoirs vente enregistrés';
                    Image = PostedOrder;
                    RunObject = Page 60055;
                }
                separator()
                {
                }
                action("Expéditions transfer de ")
                {
                    CaptionML = ENU='Posted Transfer Shipments from',
                                FRA='Expéditions transfer de';
                    RunObject = Page 50025;
                }
                action("Expéditions transfer vers")
                {
                    RunObject = Page 50039;
                }
                action("Réceptions transfer de")
                {
                    Caption = 'Réceptions transfer de';
                    RunObject = Page 50040;
                }
                action("Réceptions transfer vers")
                {
                    Caption = 'Réceptions transfer vers';
                    RunObject = Page 50041;
                }
            }
        }
        area(creation)
        {
            action("<Page Sales Quote>")
            {
                CaptionML = ENU='Sales &Quote',
                            FRA='&Devis';
                Image = Quote;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 60023;
                RunPageMode = Create;
            }
            action("Sales &Order")
            {
                CaptionML = ENU='Sales &Order',
                            FRA='&Commande vente';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 60026;
                RunPageMode = Create;
            }
            action("Sales &Return Order")
            {
                CaptionML = ENU='Sales &Return Order',
                            FRA='&Retour vente';
                Image = ReturnOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 60032;
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            action("Sales &Prices")
            {
                CaptionML = ENU='Sales &Prices',
                            FRA='&Prix vente';
                Image = SalesPrices;
                RunObject = Page 7002;
            }
            action("Navi&gate")
            {
                CaptionML = ENU='Navi&gate',
                            FRA='Navi&guer';
                Image = Navigate;
                RunObject = Page 344;
            }
        }
    }
}

