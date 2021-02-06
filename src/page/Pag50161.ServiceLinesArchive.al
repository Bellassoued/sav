page 50161 "Service Lines Archive"
{
    // version NAVW111.00.00.19846,T180001

    //  CT16V001 ZM 16/05/2016 : upgrade

    AutoSplitKey = true;
    CaptionML = ENU='Service Lines',
                FRA='Lignes service Archive';
    DataCaptionFields = "Document Type","Document No.";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    PopulateAllFields = true;
    SourceTable = Table60088;

    layout
    {
        area(content)
        {
            field(SelectionFilter;SelectionFilter)
            {
                ApplicationArea = Service;
                CaptionML = ENU='Service Lines Filter',
                            FRA='Filtre lignes service';
                Editable = false;
                OptionCaptionML = ENU='All,Per Selected Service Item Line,Service Item Line Non-Related',
                                  FRA='Tout,Par ligne article de service sélectionnée,Ligne article de service sans lien';
                ToolTipML = ENU='Specifies a service line filter.',
                            FRA='Indique un filtre ligne de service.';
            }
            repeater()
            {
                field("Service Item Line No.";"Service Item Line No.")
                {
                    ApplicationArea = Service;
                    Editable = false;
                    ToolTipML = ENU='Specifies the service item line number linked to this service line.',
                                FRA='Spécifie le numéro de la ligne article de service liée à cette ligne service.';
                    Visible = false;
                }
                field("Service Item No.";"Service Item No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the service item number linked to this service line.',
                                FRA='Spécifie le numéro article de service liée à cette ligne service.';
                    Visible = false;
                }
                field("Service Item Serial No.";"Service Item Serial No.")
                {
                    ApplicationArea = ItemTracking;
                    ToolTipML = ENU='Specifies the service item serial number linked to this line.',
                                FRA='Spécifie le numéro de série article de service lié à cette ligne.';
                    Visible = false;
                }
                field("Service Item Line Description";"Service Item Line Description")
                {
                    ApplicationArea = Service;
                    DrillDown = false;
                    ToolTipML = ENU='Specifies the description of the service item line in the service order.',
                                FRA='Spécifie la description de la ligne article de service dans la commande service.';
                    Visible = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Service;
                    OptionCaptionML = ENU=' ,Item,Subcontracting,MO,G/L Account',
                                      FRA=' ,Article,Sous-Traitance,MO,Compte général';
                    ToolTipML = ENU='Specifies the type of the service line.',
                                FRA='Spécifie le type de la ligne service.';
                }
                field("No.";"No.")
                {
                    ApplicationArea = Service;
                    StyleExpr = LineColor;
                    ToolTipML = ENU='Specifies the number of the involved entry or record, according to the specified number series.',
                                FRA='Spécifie le numéro de l''écriture ou de l''enregistrement concerné, en fonction de la souche de numéros spécifiée.';
                }
                field("Pièce Urgent";"Pièce Urgent")
                {
                }
                field("Sur Commande (urgent)";"Sur Commande (urgent)")
                {
                }
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Editable = false;
                }
                field("Variant Code";"Variant Code")
                {
                    ApplicationArea = Advanced;
                    StyleExpr = LineColor;
                    ToolTipML = ENU='Specifies the variant of the item on the line.',
                                FRA='Indique la variante de l''article sur la ligne.';
                    Visible = false;
                }
                field(Nonstock;Nonstock)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies that the item is a nonstock item.',
                                FRA='Spécifie que l''article est non stocké.';
                    Visible = false;
                }
                field(Description;Description)
                {
                    Editable = DESCRIPTIONEDITABLE;
                    StyleExpr = LineColor;
                }
                field("Description 2";"Description 2")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies an additional description of the item, resource, or cost.',
                                FRA='Spécifie une description supplémentaire de l''article, de la ressource ou du coût.';
                    Visible = true;
                }
                field("Substitution Available";"Substitution Available")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies whether a substitute is available for the item.',
                                FRA='Spécifie si un article de substitution est disponible pour l''article.';
                    Visible = false;
                }
                field(Compagnon;Compagnon)
                {
                }
                field("Nom compagnon";"Nom compagnon")
                {
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    Editable = false;
                    StyleExpr = LineColor;
                    ToolTipML = ENU='Specifies the inventory location from where the items on the line should be taken and where they should be registered.',
                                FRA='Spécifie le magasin stock à partir duquel les articles de la ligne doivent être prélevés et dans lequel ils doivent être enregistrés.';
                }
                field("Bin Code";"Bin Code")
                {
                    ApplicationArea = Warehouse;
                    Editable = false;
                    ToolTipML = ENU='Specifies the bin where the items are picked or put away.',
                                FRA='Spécifie l''emplacement où les articles sont prélevés ou rangés.';
                    Visible = false;
                }
                field(Reserve;Reserve)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies whether a reservation can be made for items on this line.',
                                FRA='Spécifie s''il est possible de réserver des articles sur cette ligne.';
                    Visible = false;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    DecimalPlaces = 0:5;
                    StyleExpr = LineColor;
                    ToolTipML = ENU='Specifies the number of item units, resource hours, cost on the service line.',
                                FRA='Spécifie le nombre d''unités de l''article, des heures ressource ou du coût sur la ligne service.';

                    trigger OnValidate();
                    var
                        LRecReceptionSAV : Record "60008";
                        LRecServiceLine : Record "5902";
                    begin
                    end;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    Editable = false;
                }
                field("Reserved Quantity";"Reserved Quantity")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies how many item units on this line have been reserved.',
                                FRA='Spécifie le nombre d''unités de l''article sur cette ligne qui ont été réservées.';
                    Visible = false;
                }
                field("NO.  Vehicle";"NO.  Vehicle")
                {
                }
                field("Unit Price";"Unit Price")
                {
                    Editable = false;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the cost, in LCY, of one unit of the item or resource on the line.',
                                FRA='Spécifie le coût, en DS, d''une unité de l''article ou de la ressource sur la ligne.';
                    Visible = false;
                }
                field("Qty possible à demander";DecQtyDispoAcmD)
                {
                    Caption = 'Qty possible à demander';
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Qty To Order";"Qty To Order")
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Line Amount";"Line Amount")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    Editable = false;
                    ToolTipML = ENU='Specifies the net amount, excluding any invoice discount amount, that must be paid for products on the line.',
                                FRA='Spécifie le montant net, hors montant remise facture, à payer pour les produits sur la ligne.';
                }
                field("Line Discount %";"Line Discount %")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    Editable = DiscountEditable;
                    ToolTipML = ENU='Specifies the discount percentage that is granted for the item on the line.',
                                FRA='Spécifie le pourcentage de remise ligne accordé pour l''article de la ligne.';
                }
                field("Line Discount Amount";"Line Discount Amount")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    Editable = false;
                    ToolTipML = ENU='Specifies the discount amount that is granted for the item on the line.',
                                FRA='Spécifie le montant de la remise accordée pour l''article de la ligne.';
                }
                field("Line Discount Type";"Line Discount Type")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the type of the line discount assigned to this line.',
                                FRA='Spécifie le type de remise ligne affecté à cette ligne.';
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    Style = Strong;
                    StyleExpr = TRUE;
                    ToolTipML = ENU='Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.',
                                FRA='Spécifie le prix d''une unité de l''article ou de la ressource. Vous pouvez entrer un prix manuellement ou le générer automatiquement conformément au champ Calcul prix ou marge de la fiche associée.';
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the quantity of items that remain to be shipped.',
                                FRA='Spécifie la quantité d''articles restant à expédier.';
                }
                field("Qty. to Invoice";"Qty. to Invoice")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the quantity of the items, resources, costs, or general ledger account payments, which should be invoiced.',
                                FRA='Spécifie la quantité d''articles, de ressources, de coûts ou de paiements sur un compte général à facturer.';
                }
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies how many units of the item on the line have been posted as invoiced.',
                                FRA='Spécifie le nombre d''unités de l''article sur la ligne qui ont déjà été validées comme facturées.';
                }
                field("Qty. to Consume";"Qty. to Consume")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the quantity of items, resource hours, costs, or G/L account payments that should be consumed.',
                                FRA='Spécifie la quantité d''articles, d''heures ressource, de coûts ou de paiements sur un compte général à consommer.';
                }
                field("Quantity Consumed";"Quantity Consumed")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the quantity of items, resource hours, costs, or general ledger account payments on this line, which have been posted as consumed.',
                                FRA='Spécifie la quantité d''articles, d''heures ressource, de coûts ou de paiements sur un compte général enregistrés dans cette ligne et qui ont déjà été validés comme consommés.';
                }
                field("Job Remaining Qty.";"Job Remaining Qty.")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the quantity that remains to complete a job.',
                                FRA='Indique la quantité restante pour réaliser un projet.';
                    Visible = false;
                }
                field("Job Remaining Total Cost";"Job Remaining Total Cost")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the remaining total cost, as the sum of costs from job planning lines associated with the order.',
                                FRA='Spécifie le coût total restant comme étant la somme des coûts des lignes planning projet associées à la commande.';
                    Visible = false;
                }
                field("Job Remaining Total Cost (LCY)";"Job Remaining Total Cost (LCY)")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the remaining total cost for the job planning line associated with the service order.',
                                FRA='Spécifie le coût total restant pour la ligne planning projet associée à la commande service.';
                    Visible = false;
                }
                field("Job Remaining Line Amount";"Job Remaining Line Amount")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the net amount of the job planning line.',
                                FRA='Spécifie le montant net de la ligne planification projet.';
                    Visible = false;
                }
                field("Work Type Code";"Work Type Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies a code for the type of work performed by the resource registered on this line.',
                                FRA='Spécifie un code pour le type de travail effectué par la ressource enregistrée sur cette ligne.';
                    Visible = false;
                }
                field("Fault Reason Code";"Fault Reason Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the code of the fault reason for this service line.',
                                FRA='Spécifie le code motif panne de cette ligne service.';
                    Visible = false;
                }
                field("Fault Area Code";"Fault Area Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the code of the fault area associated with this line.',
                                FRA='Spécifie le code de zone panne associé à cette ligne.';
                    Visible = FaultAreaCodeVisible;
                }
                field("Symptom Code";"Symptom Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the code of the symptom associated with this line.',
                                FRA='Spécifie le code de symptôme associé à cette ligne.';
                    Visible = SymptomCodeVisible;
                }
                field("Fault Code";"Fault Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the code of the fault associated with this line.',
                                FRA='Spécifie le code de panne associée à cette ligne.';
                    Visible = FaultCodeVisible;
                }
                field("Resolution Code";"Resolution Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the code of the resolution associated with this line.',
                                FRA='Spécifie le code de résolution associée à cette ligne.';
                    Visible = ResolutionCodeVisible;
                }
                field("Serv. Price Adjmt. Gr. Code";"Serv. Price Adjmt. Gr. Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the service price adjustment group code that applies to this line.',
                                FRA='Spécifie le code groupe ajustement prix service qui s''applique à cette ligne.';
                    Visible = false;
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies if the invoice line is included when the invoice discount is calculated.',
                                FRA='Spécifie si la ligne facture est incluse lors du calcul de la remise facture.';
                    Visible = false;
                }
                field("Inv. Discount Amount";"Inv. Discount Amount")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the total calculated invoice discount amount for the line.',
                                FRA='Spécifie le montant de la remise facture total calculée pour la ligne.';
                    Visible = false;
                }
                field("Exclude Warranty";"Exclude Warranty")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies that the warranty discount is excluded on this line.',
                                FRA='Indique que la remise garantie est exclue de cette ligne.';
                }
                field("Exclude Contract Discount";"Exclude Contract Discount")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies that the contract discount is excluded for the item, resource, or cost on this line.',
                                FRA='Indique que la remise contrat est exclue pour l''article, la ressource ou le coût figurant sur cette ligne.';
                }
                field(Warranty;Warranty)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies that a warranty discount is available on this line of type Item or Resource.',
                                FRA='Indique qu''une remise garantie est disponible sur cette ligne de type Article ou Ressource.';
                }
                field("Warranty Disc. %";"Warranty Disc. %")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the percentage of the warranty discount that is valid for the items or resources on this line.',
                                FRA='Spécifie le pourcentage de la remise garantie valide pour les articles ou les ressources de cette ligne.';
                    Visible = false;
                }
                field("Contract No.";"Contract No.")
                {
                    ApplicationArea = Service;
                    Editable = false;
                    ToolTipML = ENU='Specifies the number of the contract, if the service order originated from a service contract.',
                                FRA='Spécifie le numéro du contrat, si la commande service provient d''un contrat de service.';
                }
                field("Contract Disc. %";"Contract Disc. %")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the contract discount percentage that is valid for the items, resources, and costs on this line.',
                                FRA='Spécifie le pourcentage de la remise contrat valide pour les articles, les ressources ou les coûts de cette ligne.';
                    Visible = false;
                }
                field("VAT %";"VAT %")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the VAT percentage used to calculate Amount Including VAT on this line.',
                                FRA='Spécifie le taux de TVA utilisé pour calculer le Montant TTC sur cette ligne.';
                }
                field("VAT Base Amount";"VAT Base Amount")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the amount that serves as a base for calculating the Amount Including VAT field.',
                                FRA='Spécifie le montant qui sert de base pour le calcul du champ Montant TTC.';
                    Visible = false;
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the net amount, including VAT, for this line.',
                                FRA='Spécifie le montant net TVA comprise pour cette ligne.';
                    Visible = false;
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.',
                                FRA='Spécifie le type commercial du fournisseur ou du client pour lier les transactions effectuées pour ce partenaire commercial au compte général approprié en fonction des paramètres de validation généraux.';
                    Visible = false;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.',
                                FRA='Spécifie le type de produit de l''article pour lier les transactions effectuées pour cet article avec le compte général approprié en fonction des paramètres de validation généraux.';
                    Visible = false;
                }
                field("Posting Group";"Posting Group")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the inventory posting group assigned to the item.',
                                FRA='Spécifie le groupe comptabilisation stock affecté à l''article.';
                    Visible = false;
                }
                field("Planned Delivery Date";"Planned Delivery Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the planned date that the shipment will be delivered at the customer''s address. If the customer requests a delivery date, the program calculates whether the items will be available for delivery on this date. If the items are available, the planned delivery date will be the same as the requested delivery date. If not, the program calculates the date that the items are available for delivery and enters this date in the Planned Delivery Date field.',
                                FRA='Spécifie la date planifiée à laquelle l''expédition doit être livrée à l''adresse du client. Si le client demande une date de livraison, le programme calcule si les articles sont disponibles pour une livraison à cette date. Si les articles sont disponibles, la date livraison planifiée est la même que la date livraison demandée. Sinon, le programme calcule la date à laquelle les articles sont disponibles pour livraison et insère cette date dans le champ Date livraison planifiée.';
                }
                field("Needed by Date";"Needed by Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the date when you require the item to be available for a service order.',
                                FRA='Indique la date à laquelle vous exigez que l''article soit disponible pour une commande service.';
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the date when the service line should be posted.',
                                FRA='Spécifie la date à laquelle la ligne service doit être validée.';
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the related job.',
                                FRA='Spécifie le numéro du projet concerné.';
                    Visible = false;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the related job task.',
                                FRA='Spécifie le numéro de la tâche projet concernée.';
                    Visible = false;
                }
                field("Job Planning Line No.";"Job Planning Line No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the job planning line number associated with this line. This establishes a link that can be used to calculate actual usage.',
                                FRA='Spécifie le numéro ligne planning projet associé à cette ligne. Cela établit un lien qui peut être utilisé pour calculer la consommation réelle.';
                    Visible = false;
                }
                field("Job Line Type";"Job Line Type")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the type of journal line that is created in the Job Planning Line table from this line.',
                                FRA='Indique le type de ligne feuille créé dans la table Ligne planning projet à partir de cette ligne.';
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 1 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 2 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                    Visible = false;
                }
                field(ShortcutDimCode[3];ShortcutDimCode[3])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(3),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;
                }
                field(ShortcutDimCode[4];ShortcutDimCode[4])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(4),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;
                }
                field(ShortcutDimCode[5];ShortcutDimCode[5])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(5),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;
                }
                field(ShortcutDimCode[6];ShortcutDimCode[6])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(6),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;
                }
                field(ShortcutDimCode[7];ShortcutDimCode[7])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(7),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;
                }
                field(ShortcutDimCode[8];ShortcutDimCode[8])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(8),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;
                }
                field("No. article KIT";"No. article KIT")
                {
                }
                field("No. Order de Transfert";"No. Order de Transfert")
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("CompanyOrder Transfert";"CompanyOrder Transfert")
                {
                    Editable = false;
                }
                field("Garantie approuvée";"Garantie approuvée")
                {
                    Editable = false;
                }
                field(Complément;Complément)
                {
                    CaptionML = ENU='C',
                                FRA='C';
                    Editable = false;
                }
                field("Facturer Marge Négative";"Facturer Marge Négative")
                {
                }
                field(ETA;ETA)
                {
                }
                field(ATD;ATD)
                {
                }
                field(ATA;ATA)
                {
                }
                field(ETD;ETD)
                {
                }
                field("Non Demandable du Mag";"Non Demandable du Mag")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("Estimated Time For Delivery";"Estimated Time For Delivery")
                {
                }
            }
        }
        area(factboxes)
        {
            part(;50013)
            {
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(Document No.),
                              Line No.=FIELD(Line No.),
                              No.=FIELD(No.);
            }
            part(;9124)
            {
                ApplicationArea = Service;
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(Document No.),
                              Line No.=FIELD(Line No.);
                Visible = false;
            }
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord() : Boolean;
    var
        ReserveServLine : Codeunit "99000842";
        RecLServiceMgtSetup : Record "5911";
        RecLServiceHeader : Record "5900";
        LRecReceptionSAV : Record "60008";
    begin
    end;

    trigger OnModifyRecord() : Boolean;
    var
        LRecReceptionSAV : Record "60008";
    begin
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    var
        LRecReceptionSAV : Record "60008";
    begin
    end;

    var
        Text008 : TextConst ENU='You cannot open the window because %1 is %2 in the %3 table.',FRA='Vous ne pouvez pas ouvrir la fenêtre car %1 est à %2 dans la table %3.';
        ServMgtSetup : Record "5911";
        ServHeader : Record "5900";
        ServItemLine : Record "5901";
        SalesPriceCalcMgt : Codeunit "7000";
        ItemAvailFormsMgt : Codeunit "353";
        ShortcutDimCode : array [8] of Code[20];
        ServItemLineNo : Integer;
        SelectionFilter : Option "All Service Lines","Lines per Selected Service Item","Lines Not Item Related";
        Text011 : TextConst ENU='This will reset all price adjusted lines to default values. Do you want to continue?',FRA='Les lignes ajustement prix vont indiquer les valeurs par défaut. Voulez-vous continuer ?';
        [InDataSet]
        FaultAreaCodeVisible : Boolean;
        [InDataSet]
        SymptomCodeVisible : Boolean;
        [InDataSet]
        FaultCodeVisible : Boolean;
        [InDataSet]
        ResolutionCodeVisible : Boolean;
        Text012 : TextConst ENU='Do you want to create service lines from time sheets?',FRA='Souhaitez-vous créer des lignes service à partir des feuilles de temps ?';
        AddExtendedText : Boolean;
        TXT50000 : Label '"Vous avez besoin d''une approbation garantie pour demander les pièces. "';
        TXT50001 : Label 'Vous ne pouvez pas Commander des pièces ou faire une commande Achat sur une Réception Suspendu.';
        PriceEditable : Boolean;
        TXT50002 : Label 'Aucune Avance confirmé n''existe pour cette Commande.';
        TXT50003 : Label 'Mode Règlement Facture %1 différent du paiement %2.';
        TXT50004 : Label 'Montant Règlement %1 est inférieur à %2 du Montant Total TTC Commande Service %3.';
        DescriptionEditable : Boolean;
        Resource : Record "156";
        ResourceList : Page "77";
        DecStockTotalDispo : Decimal;
        DecStockTotalDispoProj : Decimal;
        LCduItemavailability : Codeunit "70000";
        DecGStock : Decimal;
        LineColor : Text;
        GRecTransferHeader : Record "5740";
        GPageTransferList : Page "5742";
        GRecServiceHeader : Record "5900";
        RecPurchaseHeader : Record "38";
        PurchaseOrderList : Page "9307";
        RecCompany : Record "2000000006";
        RecGTransferHeader : Record "5740";
        TransferShipmentReceipt : Record "50043" temporary;
        TransferReceiptHeader : Record "5746";
        TransferShipmentHeader : Record "5744";
        "RecGVentesratées" : Record "70096";
        RecGItem : Record "27";
        DecQtyDispoAcmD : Decimal;
        RecLinedemandePiece : Record "60086";
        RecListDemandePiece : Record "70055" temporary;
        GRecUserSetup : Record "91";
        GBoolUnitPriceEditable : Boolean;
        DiscountEditable : Boolean;

    [Scope('Personalization')]
    procedure Initialize(ServItemLine : Integer);
    begin
        ServItemLineNo := ServItemLine;
    end;
}

