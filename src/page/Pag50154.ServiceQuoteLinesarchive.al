page 50154 "Service Quote Lines archive"
{
    // version NAVW111.00.00.19846

    AutoSplitKey = true;
    CaptionML = ENU='Service Quote Lines',
                FRA='Lignes devis service';
    DataCaptionFields = "Document Type","Document No.";
    DelayedInsert = true;
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
                CaptionML = ENU='Service Quote Lines Filter',
                            FRA='Filtre lignes devis service';
                Editable = false;
                OptionCaptionML = ENU='All,Per Selected Service Item Line,Service Item Line Non-Related',
                                  FRA='Tout,Par ligne article de service sélectionnée,Ligne article de service sans lien';
                ToolTipML = ENU='Specifies a selection filter.',
                            FRA='Spécifie un filtre sélection.';
            }
            repeater()
            {
                field("Service Item Line No.";"Service Item Line No.")
                {
                    ApplicationArea = Service;
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
                    OptionCaptionML = ENU=' ,Item,Subcontracting,Cost,G/L Account',
                                      FRA=' ,Pièces,Sous-Traitance,MO,Compte général';
                    ToolTipML = ENU='Specifies the type of the service line.',
                                FRA='Spécifie le type de la ligne service.';
                }
                field("No.";"No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the involved entry or record, according to the specified number series.',
                                FRA='Spécifie le numéro de l''écriture ou de l''enregistrement concerné, en fonction de la souche de numéros spécifiée.';
                }
                field("Pièce Urgent";"Pièce Urgent")
                {
                }
                field("Sur Commande (urgent)";"Sur Commande (urgent)")
                {
                }
                field("Variant Code";"Variant Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the variant of the item on the line.',
                                FRA='Indique la variante de l''article sur la ligne.';
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Service;
                    Editable = DescriptionEditable;
                    ToolTipML = ENU='Specifies the description of an item, resource, cost, or a standard text on the line.',
                                FRA='Spécifie la description d''un article, d''une ressource, d''un coût ou d''un texte standard de la ligne.';
                }
                field("Description 2";"Description 2")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies an additional description of the item, resource, or cost.',
                                FRA='Spécifie une description supplémentaire de l''article, de la ressource ou du coût.';
                    Visible = true;
                }
                field(Nonstock;Nonstock)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies that the item is a nonstock item.',
                                FRA='Spécifie que l''article est non stocké.';
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.',
                                FRA='Spécifie la manière dont chaque unité de l''article ou de la ressource est mesurée, par exemple en unités ou en heures. Par défaut, la valeur du champ Unité de base de la fiche article ou la ressource est insérée.';
                }
                field("Substitution Available";"Substitution Available")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies whether a substitute is available for the item.',
                                FRA='Spécifie si un article de substitution est disponible pour l''article.';
                    Visible = false;
                }
                field("Work Type Code";"Work Type Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies a code for the type of work performed by the resource registered on this line.',
                                FRA='Spécifie un code pour le type de travail effectué par la ressource enregistrée sur cette ligne.';
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    Editable = false;
                    ToolTipML = ENU='Specifies the inventory location from where the items on the line should be taken and where they should be registered.',
                                FRA='Spécifie le magasin stock à partir duquel les articles de la ligne doivent être prélevés et dans lequel ils doivent être enregistrés.';
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    DecimalPlaces = 0:5;
                    ToolTipML = ENU='Specifies the number of item units, resource hours, cost on the service line.',
                                FRA='Spécifie le nombre d''unités de l''article, des heures ressource ou du coût sur la ligne service.';
                }
                field("Stock Dispo. Mag. Consolidé";DecGStock)
                {
                }
                field("Stock Dispo. Total Consolidé";DecStockTotalDispo)
                {
                }
                field("Stock Dispo. Projeté Consolidé";DecStockTotalDispoProj)
                {
                }
                field("A imprimer";"A imprimer")
                {
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
                field("Unit Price";"Unit Price")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    Editable = GBoolUnitPriceEditable;
                    ToolTipML = ENU='Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.',
                                FRA='Spécifie le prix d''une unité de l''article ou de la ressource. Vous pouvez entrer un prix manuellement ou le générer automatiquement conformément au champ Calcul prix ou marge de la fiche associée.';
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
                field("Line Amount";"Line Amount")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    Editable = false;
                    ToolTipML = ENU='Specifies the net amount, excluding any invoice discount amount, that must be paid for products on the line.',
                                FRA='Spécifie le montant net, hors montant remise facture, à payer pour les produits sur la ligne.';
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
                    Visible = false;
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
                    ToolTipML = ENU='Specifies the net amount, including VAT, for this line.',
                                FRA='Spécifie le montant net TVA comprise pour cette ligne.';
                    Visible = false;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    ApplicationArea = Service;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the cost, in LCY, of one unit of the item or resource on the line.',
                                FRA='Spécifie le coût, en DS, d''une unité de l''article ou de la ressource sur la ligne.';
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
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the date when the service line should be posted.',
                                FRA='Spécifie la date à laquelle la ligne service doit être validée.';
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
            }
        }
        area(factboxes)
        {
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
    begin
    end;

    var
        ServMgtSetup : Record "5911";
        ServHeader : Record "5900";
        SalesPriceCalcMgt : Codeunit "7000";
        ItemAvailFormsMgt : Codeunit "353";
        ShortcutDimCode : array [8] of Code[20];
        ServItemLineNo : Integer;
        SelectionFilter : Option "All Service Lines","Lines per Selected Service Item","Lines Not Item Related";
        [InDataSet]
        FaultAreaCodeVisible : Boolean;
        [InDataSet]
        SymptomCodeVisible : Boolean;
        [InDataSet]
        FaultCodeVisible : Boolean;
        [InDataSet]
        ResolutionCodeVisible : Boolean;
        DecStockTotalDispo : Decimal;
        DecStockTotalDispoProj : Decimal;
        LCduItemavailability : Codeunit "70000";
        DecGStock : Decimal;
        GRecUserSetup : Record "91";
        PricesEditable : Boolean;
        DescriptionEditable : Boolean;
        DiscountEditable : Boolean;
        GBoolUnitPriceEditable : Boolean;
        DecQtyDispoAcmD : Decimal;

    [Scope('Personalization')]
    procedure Initialize(ServItemLine : Integer);
    begin
        ServItemLineNo := ServItemLine;
    end;
}

