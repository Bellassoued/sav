page 69006 "PR - Order Processor RC"
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
                part(;681)
                {
                }
                group()
                {
                    systempart(;MyNotes)
                    {
                    }
                    systempart(;Notes)
                    {
                    }
                    systempart(;Links)
                    {
                    }
                }
            }
            group()
            {
                part(;760)
                {
                    Visible = false;
                }
                part(;9150)
                {
                }
                part(;9152)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Regrouper BL")
            {
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Report 60046;
            }
            action("Regroupement BL V2")
            {
                RunObject = Report 60233;
                Visible = false;
            }
            action("CA HT MAGASIN PR")
            {
                RunObject = Report 60171;
            }
            action("Chiffre D'affaires par Client/Centre de gestion")
            {
                CaptionML = ENU='Chiffre D''affaires par Client/Centre de gestion',
                            FRA='Chiffre D''affaires par Client/Centre de gestion';
                RunObject = Report 60175;
            }
            action("Chiffre D'affaire par Client")
            {
                Image = Customer;
                RunObject = Report 50030;
                Visible = false;
            }
            action("Etat de stock Mag. Transit")
            {
                RunObject = Report 60294;
            }
        }
        area(embedding)
        {
            action("Items PR")
            {
                CaptionML = ENU='Items PR',
                            FRA='Articles PR';
                Image = Item;
                RunObject = Page 31;
            }
            action("Customers PR")
            {
                CaptionML = ENU='Customers PR',
                            FRA='Clients PR';
                Image = Customer;
                RunObject = Page 22;
            }
            action("Article Master")
            {
                RunObject = Page 70010;
            }
            action("Liste des Véhicules")
            {
                RunObject = Page 5981;
            }
            action("Sales Quotes PR")
            {
                CaptionML = ENU='Sales Quotes PR',
                            FRA='Devis PR';
                Image = Quote;
                RunObject = Page 60022;
            }
            action("Liste des devis PRANET")
            {
                RunObject = Page 70115;
                Visible = false;
            }
            action("Liste des commandes vente PRANET")
            {
                RunObject = Page 70112;
                RunPageView = WHERE(Order Type=CONST(PR));
                Visible = false;
            }
            action("Sales Orders")
            {
                CaptionML = ENU='Sales Orders',
                            FRA='Toutes les Commandes vente';
                Image = "Order";
                RunObject = Page 60025;
                RunPageView = WHERE(Order Type=CONST(PR));
            }
            action("Shipped Not Invoiced")
            {
                CaptionML = ENU='Shipped Not Invoiced',
                            FRA='Commandes non livrés';
                RunObject = Page 60025;
                RunPageView = WHERE(Shipped Not Invoiced=CONST(No),
                                    Order Type=CONST(PR));
            }
            action("Shipped Not Invoiced")
            {
                CaptionML = ENU='Shipped Not Invoiced',
                            FRA='Livré non facturé';
                RunObject = Page 60025;
                RunPageView = WHERE(Shipped Not Invoiced=CONST(Yes),
                                    Order Type=CONST(PR));
            }
            action("Completely Shipped Not Invoiced")
            {
                CaptionML = ENU='Completely Shipped Not Invoiced',
                            FRA='Complètement livré non facturé';
                RunObject = Page 60025;
                RunPageView = WHERE(Completely Shipped=CONST(Yes),
                                    Invoice=CONST(No),
                                    Order Type=CONST(PR));
            }
            action("Factures Vente PR - En cours ")
            {
                RunObject = Page 60034;
            }
            action("Avoirs Vente PR")
            {
                RunObject = Page 9302;
                RunPageView = WHERE(Order Type=CONST(PR));
            }
            action("Liste des Ordres de Transferts")
            {
                RunObject = Page 5742;
                RunPageView = WHERE(Source Type=FILTER(Vente PR));
            }
            action("Page Sales Return Order List PR")
            {
                CaptionML = ENU='Sales Return Orders',
                            FRA='Retours vente';
                Image = ReturnOrder;
                RunObject = Page 60031;
                Visible = false;
            }
            action("List Retour Transfert")
            {
                RunObject = Page 60321;
                Visible = false;
            }
            action("Liste des Prix PR")
            {
                RunObject = Page 60117;
                RunPageView = SORTING(Item No.,Sales Type,Sales Code,Starting Date,Currency Code,Variant Code,Unit of Measure Code,Minimum Quantity)
                              ORDER(Ascending)
                              WHERE(Groupe compta stock=FILTER(<>VEHICULES));
                Visible = false;
            }
            action("Transferts (vers) Sur commande")
            {
                RunObject = Page 50024;
                RunPageView = WHERE(Sur Commande=CONST(Yes));
            }
            action("Transferts (de) Sur commande")
            {
                RunObject = Page 60149;
                RunPageView = WHERE(Sur Commande=CONST(Yes));
            }
            action("Retours Vente")
            {
                RunObject = Page 9304;
            }
            action("List des Pièces Sur CMD Récept")
            {
                CaptionML = ENU='List des Pièces Sur CMD Réceptionner',
                            FRA='List des Pièces Sur CMD Réceptionner';
                RunObject = Page 50147;
            }
            action("Ventes Ratées")
            {
                RunObject = Page 50152;
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
                action("Expéditions vente PRANET enregistrées")
                {
                    Caption = 'Expéditions vente PRANET enregistrées';
                    RunObject = Page 70127;
                }
                action("Factures vente PRANET enregistrées")
                {
                    Caption = 'Factures vente PRANET enregistrées';
                    RunObject = Page 70124;
                }
                action("Autre Expedition Transfert Enrg")
                {
                    RunObject = Page 5752;
                    RunPageView = WHERE(Source Type=FILTER(0),
                                        Source No=FILTER(''));
                }
                action("Autre Réception transfert Enrg")
                {
                    RunObject = Page 5753;
                    RunPageView = WHERE(Source Type=FILTER(0),
                                        Source No=FILTER(''));
                }
                action("Rcpt transfert  Sur Commande")
                {
                    RunObject = Page 5753;
                    RunPageView = WHERE(Sur Commande=CONST(Yes));
                }
                action("Exp Transfert  Sur Commande")
                {
                    RunObject = Page 5752;
                    RunPageView = WHERE(Sur Commande=CONST(Yes));
                }
            }
            group(Atelier)
            {
                CaptionML = ENU='Atelier',
                            FRA='Atelier';
                Image = FiledPosted;
                action("Facturer OR")
                {
                    RunObject = Page 9318;
                    RunPageView = WHERE(Release Status=CONST(Released to Ship));
                }
                action("Avoir atelier")
                {
                    RunObject = Page 9320;
                }
                action("Factures Atelier Enregistrées")
                {
                    RunObject = Page 5977;
                }
                action("Avoirs Atelier Enregistrées")
                {
                    RunObject = Page 5971;
                }
                action("Livraisons Atelier")
                {
                    RunObject = Page 5974;
                }
            }
            group(WebPR)
            {
                action("Commande Vente PRANET")
                {
                    Caption = 'Commande Vente PRANET';
                    RunObject = Page 70112;
                }
                action("Devis PRANET")
                {
                    Caption = 'Devis PRANET';
                    RunObject = Page 70115;
                }
                action("Facture Ventes PRANET enregistrées")
                {
                    Caption = 'Facture Ventes PRANET enregistrées';
                    RunObject = Page 70124;
                }
                action("Expédition Ventes PRANET enregistrées")
                {
                    Caption = 'Expédition Ventes PRANET enregistrées';
                    RunObject = Page 70127;
                }
            }
        }
        area(creation)
        {
            action("Créer Devis PR")
            {
                Caption = 'Créer Devis PR';
                Image = Quote;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 60023;
                RunPageMode = Create;
            }
            action("Créer Commande PR")
            {
                Caption = 'Créer Commande PR';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 60026;
                RunPageMode = Create;
            }
            action("Créer Facture PR")
            {
                Caption = 'Créer Facture PR';
                Image = Invoice;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 60035;
                RunPageMode = Create;
            }
            action("Créer Avoir PR")
            {
                Caption = 'Créer Avoir PR';
                Image = CreateCreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 44;
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
            action("60257")
            {
                Caption = 'Détails factures';
                RunObject = Report 60257;
            }
        }
    }
}

