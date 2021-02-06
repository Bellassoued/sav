page 69035 "Direction PR - RC"
{
    // version NAVW17.10,NAVFR7.10

    CaptionML = ENU='Role Center',
                FRA='Tableau de bord';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Vente)
            {
                Caption = 'Vente';
                part(;69060)
                {
                }
            }
            group(Achat)
            {
                Caption = 'Achat';
                part(;9063)
                {
                }
                part(;9150)
                {
                    Visible = false;
                }
                part(;9151)
                {
                    Visible = false;
                }
                part(;9152)
                {
                    Visible = false;
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
            action("Stock par magasin")
            {
                Image = InventoryJournal;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60041;
            }
            action("CA vente PR/Magasin")
            {
                Image = PrintReport;
                RunObject = Report 60037;
            }
            action("CA vente PR/Client")
            {
                Image = PrintReport;
                RunObject = Report 60035;
            }
            action("Suivie Stock Magasin")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60034;
            }
            action("Report Compraratif-V2")
            {
                Caption = '"STock par article "';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 50012;
            }
            action("Journée Commercial  ")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
            }
            action("CA par C.Gestion Liv/NFact PR")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60040;
            }
            action("CA Pr Par Centre de Gestion")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60052;
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
            action(Inventaire)
            {
                Caption = 'Inventaire';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 69069;
            }
            action("CA Pr Par CGest Detail")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60053;
            }
            action("Report Stock consolide")
            {
                Caption = 'Report Stock consolide';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60140;
            }
            action("CA Pr Par CGest Recap")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60054;
            }
            action("CA Pr Par CGest Detail facturé")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60057;
            }
            action("Stock magasin par centre de gestion")
            {
                Caption = 'Stock magasin par centre de gestion';
                Image = Report2;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60050;
            }
        }
        area(sections)
        {
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
        area(embedding)
        {
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
                            FRA='Commandes vente';
                Image = "Order";
                RunObject = Page 60025;
            }
            action(Customers)
            {
                CaptionML = ENU='Customers',
                            FRA='Clients';
                Image = Customer;
                RunObject = Page 22;
            }
            action("Purchase Orders")
            {
                CaptionML = ENU='Purchase Orders',
                            FRA='Commandes achat';
                RunObject = Page 9307;
            }
            action(Vendors)
            {
                CaptionML = ENU='Vendors',
                            FRA='Fournisseurs';
                Image = Vendor;
                RunObject = Page 27;
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
            action("Item service List")
            {
                Caption = 'Véhicules Vendu';
                RunObject = Page 5981;
            }
            action("Sales P&rices")
            {
                CaptionML = ENU='Sales P&rices',
                            FRA='Liste des prix PR';
                Image = SalesPrices;
                RunObject = Page 60117;
            }
            action("Document de prix de vente")
            {
                RunObject = Page 69042;
            }
        }
        area(creation)
        {
            action("C&ustomer")
            {
                CaptionML = ENU='C&ustomer',
                            FRA='&Client';
                Image = Customer;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 21;
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
            action("Sales Credit &Memo")
            {
                CaptionML = ENU='Sales Credit &Memo',
                            FRA='Avoir &vente';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 60038;
                RunPageMode = Create;
            }
            action("&Vendor")
            {
                CaptionML = ENU='&Vendor',
                            FRA='&Fournisseur';
                Image = Vendor;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 26;
                RunPageMode = Create;
            }
            action("&Purchase Order")
            {
                CaptionML = ENU='&Purchase Order',
                            FRA='&Commande achat';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 50;
                RunPageMode = Create;
            }
            action("Recoupement proformat achat")
            {
                Image = ReceivableBill;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 60125;
                RunPageMode = View;
            }
        }
        area(processing)
        {
            separator(Tasks)
            {
                CaptionML = ENU='Tasks',
                            FRA='Tâches';
                IsHeader = true;
            }
            action("Paramètres Achat")
            {
                RunObject = Page 460;
            }
            action("Sales P&rices")
            {
                CaptionML = ENU='Sales P&rices',
                            FRA='Prix ven&te';
                Image = SalesPrices;
                RunObject = Page 7002;
            }
            action("Sales &Line Discounts")
            {
                CaptionML = ENU='Sales &Line Discounts',
                            FRA='Remi&ses ligne vente';
                Image = SalesLineDisc;
                RunObject = Page 7004;
            }
            action("Calcule Prix de Vente")
            {
                Caption = 'Calcule Prix de Vente';
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 69028;
            }
            separator()
            {
            }
            separator(History)
            {
                CaptionML = ENU='History',
                            FRA='Historique';
                IsHeader = true;
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

