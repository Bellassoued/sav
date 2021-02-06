table 70007 "Item Master"
{
    // version PR00011

    CaptionML = ENU='Item Master',
                FRA='Master pièce';
    DrillDownPageID = 70010;
    LookupPageID = 70010;

    fields
    {
        field(1;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            Description = 'item No/Partnumber';
        }
        field(2;"Make Code";Code[10])
        {
            CaptionML = ENU='Make Code',
                        FRA='Code marque';
            Description = 'Toyota par defaut';
        }
        field(3;"Version No.";Code[20])
        {
            CaptionML = ENU='Version No.',
                        FRA='N° Version';
            Editable = false;
        }
        field(4;"Search Description";Code[30])
        {
            CaptionML = ENU='Search Description',
                        FRA='Désignation recherche';
        }
        field(5;"Vehicle Type";Text[80])
        {
            CaptionML = ENU='Vehicle Type',
                        FRA='Type de véhicule';
        }
        field(6;"Purch. Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Purch. Unit of Measure Code',
                        FRA='Unité achat';
            TableRelation = "Unit of Measure";
        }
        field(7;"Base Unit of Measure";Code[10])
        {
            CaptionML = ENU='Base Unit of Measure',
                        FRA='Base unité de mesure';
        }
        field(8;"Minimum Quantity";Decimal)
        {
            CaptionML = ENU='Minimum Quantity',
                        FRA='Quantité minimum';
        }
        field(9;Description;Text[30])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';

            trigger OnValidate();
            begin
                "Search Description":=Description;
            end;
        }
        field(10;"New partnumber";Code[20])
        {
            Description = 'Pn replacing the existing pn';
        }
        field(11;"Alternative No.";Code[20])
        {
            CaptionML = ENU='Alternative No.',
                        FRA='N° Alternatif';
            TableRelation = "Item Master".No. WHERE (Make Code=FIELD(Make Code));
            ValidateTableRelation = false;
        }
        field(12;"Item Group";Code[10])
        {
            CaptionML = ENU='Item Group',
                        FRA='Code remise';
        }
        field(14;"Exchange Part Code";Boolean)
        {
            CaptionML = ENU='Exchange Part Code',
                        FRA='Code pièce échange';
        }
        field(15;"Gen. Prod. Posting Group";Code[10])
        {
            CaptionML = ENU='Gen. Prod. Posting Group',
                        FRA='Grp compta. produit';
        }
        field(16;"VAT Bus. Posting Gr. (Price)";Code[10])
        {
            CaptionML = ENU='VAT Bus. Posting Gr. (Price)',
                        FRA='Grp compta. marché TVA (prix)';
        }
        field(17;"Inventory Posting Group";Code[10])
        {
            CaptionML = ENU='Inventory Posting Group',
                        FRA='Grp compta. stock';
        }
        field(18;"Manufacturer Req. Status";Code[10])
        {
            CaptionML = ENU='Manufacturer Req. Status',
                        FRA='Statut réapprovisionnement constructeur';
        }
        field(23;"Main Group Code";Code[10])
        {
            CaptionML = ENU='Main Group Code',
                        FRA='Index';
        }
        field(24;"Product Code";Code[10])
        {
            Description = 'Product Code';
        }
        field(25;"Line Group Code";Code[10])
        {
            CaptionML = ENU='Line Group Code',
                        FRA='Famille';
        }
        field(26;"Purch. Unit-Quantity";Decimal)
        {
            CaptionML = ENU='Purch. Unit of Measure Quantity',
                        FRA='Quantité unité d''achat';
        }
        field(27;"Qty. per Price Indication";Decimal)
        {
            CaptionML = ENU='Qty. per Price Indication',
                        FRA='Qté par indication de prix';
        }
        field(28;"Item Category";Text[30])
        {
            CaptionML = ENU='Item Category',
                        FRA='Catégorie pièce';
        }
        field(29;"Deposit Price";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Deposit Price',
                        FRA='Pièce consigne';
        }
        field(30;"Deposit Item";Boolean)
        {
            CaptionML = ENU='Deposit Item',
                        FRA='Pièce consigne';
        }
        field(31;"Net Item";Boolean)
        {
            CaptionML = ENU='Net Item',
                        FRA='Part nette';
        }
        field(32;Price;Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Price',
                        FRA='Prix';
            Description = 'A utiliser pour le master toyota/price with two decimals';
        }
        field(33;"Net weight";Decimal)
        {
            CaptionML = ENU='Weight',
                        FRA='Poids';
        }
        field(34;"Replacement Type";Code[10])
        {
            CaptionML = ENU='Replacement Type',
                        FRA='Type remplacement';
        }
        field(35;"Full Replacement";Boolean)
        {
            CaptionML = ENU='Full Replacement',
                        FRA='Remplacement total';
        }
        field(36;"Replacement Method";Option)
        {
            CaptionML = ENU='Replacement Method',
                        FRA='Méthode remplacement';
            OptionCaptionML = ENU='1:1,1:N,N:1',
                              FRA='1:1,1:N,N:1';
            OptionMembers = "1:1","1:N","N:1";
        }
        field(37;"Coding Indicator";Boolean)
        {
            CaptionML = ENU='Coding Indicator',
                        FRA='Indication code';
        }
        field(39;"Special Waste";Boolean)
        {
            CaptionML = ENU='Special Waste',
                        FRA='Déchet';
        }
        field(40;"Special Waste Group Code";Code[10])
        {
            CaptionML = ENU='Special Waste Group Code',
                        FRA='Codes groupe déchet';
        }
        field(41;"Sending Required";Option)
        {
            CaptionML = ENU='Sending Required',
                        FRA='Envoi exigé';
            OptionCaptionML = ENU=' ,Keep,Send',
                              FRA=' ,Garder,Envoyer';
            OptionMembers = " ",Keep,Send;
        }
        field(42;"Dangerous Goods Indicator";Boolean)
        {
            CaptionML = ENU='Dangerous Goods Indicator',
                        FRA='Indicateur marchandises dangereuses';
        }
        field(43;"Dangerous Goods Code";Code[10])
        {
            CaptionML = ENU='Dangerous Goods Code',
                        FRA='Code marchandises dangereuses';
        }
        field(44;"Shipping Warehouse";Code[10])
        {
            CaptionML = ENU='Shipping Warehouse',
                        FRA='Magasin livraison';
        }
        field(45;"Manufacturing Country";Code[10])
        {
            CaptionML = ENU='Manufacturing Country',
                        FRA='Pays de fabrication';
        }
        field(48;"Length (cm)";Decimal)
        {
            CaptionML = ENU='Length (cm)',
                        FRA='Longueur (cm)';
            Description = 'Lenght of the packaging';
        }
        field(49;"Width (cm)";Decimal)
        {
            CaptionML = ENU='Width (cm)',
                        FRA='Largeur (cm)';
            Description = 'Width of the packaging';
        }
        field(50;"Height (cm)";Decimal)
        {
            CaptionML = ENU='Height (cm)',
                        FRA='Hauteur (cm)';
            Description = 'Height of the packaging';
        }
        field(51;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité de mesure';
        }
        field(52;"Volume packaging";Decimal)
        {
            DecimalPlaces = 1:1;
            Description = 'Defines volume of packaged part (cm³)';
        }
        field(53;"Shelf Life in Months";Integer)
        {
            CaptionML = ENU='Shelf Life in Months',
                        FRA='Durée de vie en mois';
        }
        field(54;"Bonus Code";Code[10])
        {
            CaptionML = ENU='Bonus Code',
                        FRA='Code bonus';
        }
        field(55;Blocked;Boolean)
        {
            CaptionML = ENU='Blocked',
                        FRA='Bloqué';
        }
        field(56;"Min. Packaging Qty. (Base)";Decimal)
        {
            CaptionML = ENU='Min. Packaging Qty. (Base)',
                        FRA='Qté conditionnement min. (base)';
            DecimalPlaces = 0:5;
        }
        field(57;"Bulk Pack Quantity (Base)";Decimal)
        {
            CaptionML = ENU='Bulk Pack Quantity (Base)',
                        FRA='Qté emballage vrac (base)';
            DecimalPlaces = 0:5;
        }
        field(58;"Catégorie de prix pièce";Code[10])
        {
            CalcFormula = Lookup("Item Master Price"."Item Price Category" WHERE (Item No.=FIELD(No.)));
            CaptionML = ENU='Item Price Category',
                        FRA='Catégorie de prix pièce';
            FieldClass = FlowField;
            NotBlank = true;
        }
        field(59;"Price Fob";Decimal)
        {
            AutoFormatType = 2;
            CalcFormula = Lookup("Item Master Price".Price WHERE (Item No.=FIELD(No.)));
            CaptionML = ENU='Price fob',
                        FRA='Prix fob';
            FieldClass = FlowField;
            MinValue = 0;
        }
        field(60;"Item Exist";Boolean)
        {
            CalcFormula = Exist(Item WHERE (No.=FIELD(No.)));
            Description = 'SM300517';
            FieldClass = FlowField;
        }
        field(70;"Insertion Manuelle";Boolean)
        {
            Description = 'SM 070617';
        }
        field(71;"Inséré par";Code[100])
        {
            TableRelation = User."User Name";
        }
        field(72;"Date Insertion Manuelle";DateTime)
        {
        }
        field(73;"Record ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(74;"Origin of division";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Always "I"  General purpose vehicle.  Value "F" (forklift) not used';
        }
        field(75;"EPM Non Reorder Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'This code contains the actual reject code from the parts master';
        }
        field(76;"R/A code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Code indicating the reason for rejection, alteration and or amendment of a partnumber';
        }
        field(77;"Price Class";Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(78;"Optifit flag";Code[1])
        {
            DataClassification = ToBeClassified;
        }
        field(79;FILLER2;Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'Field is left blank for future usage';
        }
        field(80;"Substitution code";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'value 1 -> 1 to 1 sumbstitution, other values 1 to many substitution';
        }
        field(81;FILLER01;Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'Field is left blank for future usage';
        }
        field(82;"Quantity in used";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Necessary quantity of components, the quantity used in substitution part or set kit part.';
        }
        field(83;"Production Start Date";Code[4])
        {
            DataClassification = ToBeClassified;
        }
        field(84;"Production End Date";Code[4])
        {
            DataClassification = ToBeClassified;
        }
        field(85;"Unit pack code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Code to determine if the distributor POL should be checked';
        }
        field(86;"Not used anymore";Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(87;"Qty in package";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'The number of parts within one package. (Purchase Order Lot or Unit Pack Quantity)';
        }
        field(88;"Vin Check";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Indicate wheter VIN check is done for at part (for diesel power pack and tehcnical campaign)';
        }
        field(89;"Distribution Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Code indicating who is responsible to supply the goods towards distributors old style';
        }
        field(90;"Source Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'A=TMC, Z= local part,….';
        }
        field(91;"Sub Supplier Code";Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(92;"Origin Code";Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'It contains the same values as Country code';
        }
        field(93;"Non Stock Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = '1=stocked at TPCE and available, 2= stocked at TPCE but not avialble,….';
        }
        field(94;"Lexus ID";Code[1])
        {
            DataClassification = ToBeClassified;
        }
        field(95;"Part Name Code";Code[7])
        {
            DataClassification = ToBeClassified;
            Description = 'Code used to group equal parts.';
        }
        field(96;"Max qty via VOR";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Maximum quantity to order via VOR.';
        }
        field(97;"Tariff code";Code[8])
        {
            DataClassification = ToBeClassified;
            Description = 'To determine the classification of payments of custom tariff.';
        }
        field(98;"TMC Stock Code";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = '0 = TMC Stock parts, 1 = TMC not Stock parts';
        }
        field(99;"Accessory Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'P = Part, A = Accessories, S = Service tool';
        }
        field(100;"Iso Country Code";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'CZ: Czech republic/TH: Thailand...';
        }
        field(101;"Special Control Code";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'Special Control Code to identify the inventory class by passing year and character of the part.';
        }
        field(102;"Hazardous Goods Id 1";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'Code to specify how dangerous a part is. This is the OLD 2 digits code - replace by 5 digit code';
        }
        field(103;"Dangerous good code";Code[6])
        {
            DataClassification = ToBeClassified;
            Description = 'Code per partnumber to define how dangerous goods are';
        }
        field(104;"Hazardous Goods Id 2";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'Code to specify how dangerous a part is. This is the OLD 2 digits code - replace by 5 digit code';
        }
        field(105;"Forecast Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Code to identify whether TPCE requires forecast or not.';
        }
        field(106;"Short tariff code";Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'To determine the classification of payments of custom tariff.';
        }
        field(107;"Product Function Code (PFC)";Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'Product Function Code';
        }
        field(108;"European Discount Code (EDC)";Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(109;"European Recommanded Price";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(110;"Default Tarrif Code";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Default national Tariff code extension (only used for TGB)';
        }
        field(111;"Dropshipment Flag";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Indicates the type of dropshipment applicable to the part.';
        }
        field(112;"Core Unit Part Number";Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(113;"EPM Hazardous Goods Id 3";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'Code to specify how dangerous a part is. This is the OLD 2 digits code - replace by 5 digit code';
        }
        field(114;"Pricing Model";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'Code to specify the pricing model for a part. 2 digits';
        }
        field(115;"DANG01-COD";Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'Codes to specify how dangerous a part is.  This is the ²new code with 5 digits and a pn could received up to 9 codes intead of 3 with the old code. Most of NMSC should used';
        }
        field(116;"DANG02-COD";Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'Codes to specify how dangerous a part is.  This is the new code with 5 digits and a pn could received up to 9 codes intead of 3 with the old code. Most of NMSC should used';
        }
        field(117;"DANG03-COD";Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'Codes to specify how dangerous a part is.  This is the new code with 5 digits and a pn could received up to 9 codes intead of 3 with the old code. Most of NMSC should used';
        }
        field(118;"DANG04-COD";Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'Codes to specify how dangerous a part is.  This is the new code with 5 digits and a pn could received up to 9 codes intead of 3 with the old code. Most of NMSC should used';
        }
        field(119;"DANG05-COD";Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'Codes to specify how dangerous a part is.  This is the new code with 5 digits and a pn could received up to 9 codes intead of 3 with the old code. Most of NMSC should used';
        }
        field(120;"DANG06-COD";Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'Codes to specify how dangerous a part is.  This is the new code with 5 digits and a pn could received up to 9 codes intead of 3 with the old code. Most of NMSC should used';
        }
        field(121;"DANG07-COD";Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'Codes to specify how dangerous a part is.  This is the new code with 5 digits and a pn could received up to 9 codes intead of 3 with the old code. Most of NMSC should used';
        }
        field(122;"DANG08-COD";Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'Codes to specify how dangerous a part is.  This is the new code with 5 digits and a pn could received up to 9 codes intead of 3 with the old code. Most of NMSC should used';
        }
        field(123;"DANG09-COD";Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'Codes to specify how dangerous a part is.  This is the new code with 5 digits and a pn could received up to 9 codes intead of 3 with the old code. Most of NMSC should used';
        }
        field(124;"CCM Cost";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Only for affiliate NMSC';
        }
        field(125;FILLER05;Code[83])
        {
            DataClassification = ToBeClassified;
            Description = 'Field is left blank for future usage';
        }
        field(126;"date insert";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(127;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(128;"Article Creer sur Commande";Boolean)
        {
            CalcFormula = Exist(Item WHERE (No.=FIELD(No.),
                                            Sur commande=FILTER(Yes)));
            FieldClass = FlowField;
        }
        field(129;"Code Pays";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Country/Region;
        }
        field(131;"Code Devise";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(132;"Controle Technique";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
        }
        key(Key2;"No.","Make Code")
        {
            MaintainSIFTIndex = false;
        }
        key(Key3;"Make Code","Main Group Code","Product Code","Line Group Code")
        {
            MaintainSIFTIndex = false;
        }
        key(Key4;"Make Code","No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key5;"Exchange Part Code")
        {
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }

    local procedure GetUnitCostGros(MasterItemNo : Integer);
    var
        LRecItem : Record "27";
        LRecItemVariant : Record "5401";
        LRecItemInsert : Record "27";
        LRecItemMasterPrice : Record "70008";
        LRecItemFilePriceCalculation : Record "70014";
        LRecCurrencyExchangeRate : Record "330";
        LRecCoderemiseMaster : Record "70050";
        LRecInventorySetup : Record "313";
        LRecItemMaster : Record "70007";
    begin
        /*
        DecUnitPrice:=0;
        IF LRecItemMaster.GET(MasterItemNo ) THEN BEGIN
              DecUnitPrice := 0;
        
              LRecItemMasterPrice.SETRANGE("Item No.",PRecItemMaster."No.");
              IF LRecItemMasterPrice.FINDFIRST THEN
        
                  BEGIN
                    LRecItemFilePriceCalculation.SETRANGE("Item Group",CheckItemExist."Code Remise");
                    IF LRecItemFilePriceCalculation.FINDFIRST THEN
                    BEGIN
                        //DecUnitPrice :=ROUND((LRecItemMasterPrice.Price * LRecCurrencyExchangeRate.ExchangeRate(WORKDATE,'EUR'))
                     DecUnitPrice := ROUND(
                  LRecCurrencyExchangeRate.ExchangeAmtFCYToLCY(
                    WORKDATE,'EUR',
                    LRecItemMasterPrice.Price,LRecCurrencyExchangeRate.ExchangeRate(WORKDATE,'EUR')),
                  0.001)
                              * ((100 + LRecItemFilePriceCalculation."Factor %")/100);
                        LRepUpdateItemSalesPrice.FctUpdateItem(CheckItemExist,DecUnitPrice);
                        LRepUpdateItemSalesPrice.FctUpdateItemSalesPrice(CheckItemExist,DecUnitPrice);
                    END;
                  END;
             // MESSAGE(Txt50002,PRecItemMaster."No.")
        END
        
        */

    end;

    local procedure GetUnitPriceGros();
    begin
    end;

    local procedure GetUnitCostDetail();
    begin
    end;

    local procedure GetUnitPriceDetail();
    begin
    end;
}

