table 70096 "Ventes Ratées"
{
    // version PR

    DrillDownPageID = 50152;
    LookupPageID = 50152;

    fields
    {
        field(1;"Entry No.";Integer)
        {
            CaptionML = ENU='Entry No.',
                        FRA='N° séquence';
        }
        field(2;"Document Type";Option)
        {
            CaptionML = ENU='Document Type',
                        FRA='Type document';
            OptionCaptionML = ENU='Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order',
                              FRA='Devis,Commande,Facture,Avoir,Commande ouverte,Retour';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(3;"Sell-to Customer No.";Code[20])
        {
            CaptionML = ENU='Sell-to Customer No.',
                        FRA='N° donneur d''ordre';
            Editable = false;
            TableRelation = Customer;
        }
        field(4;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document';
            TableRelation = "Sales Header".No. WHERE (Document Type=FIELD(Document Type));
        }
        field(5;"Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne';
        }
        field(7;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            ValidateTableRelation = false;

            trigger OnValidate();
            var
                PrepaymentMgt : Codeunit "441";
                RecLSalesLine : Record "37";
                RecSalesHeader : Record "36";
                RecInventorySetup : Record "313";
                RecItem : Record "27";
                RecLSalesLineTEMPORARY : Record "37" temporary;
                LPagConfigurateurFicheArticle : Page "60186";
                LRecItemMaster : Record "70007";
            begin
            end;
        }
        field(8;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code magasin';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));
        }
        field(11;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(12;"Description 2";Text[50])
        {
            CaptionML = ENU='Description 2',
                        FRA='Désignation 2';
        }
        field(13;"Unit of Measure";Text[10])
        {
            CaptionML = ENU='Unit of Measure',
                        FRA='Unité';
        }
        field(15;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
            DecimalPlaces = 0:5;

            trigger OnValidate();
            var
                ItemLedgEntry : Record "32";
                RecSalesSetup : Record "311";
                RecSalesHeader : Record "36";
            begin
            end;
        }
        field(16;"Outstanding Quantity";Decimal)
        {
            CaptionML = ENU='Outstanding Quantity',
                        FRA='Quantité restante';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(17;"Qty. to Invoice";Decimal)
        {
            CaptionML = ENU='Qty. to Invoice',
                        FRA='Qté à facturer';
            DecimalPlaces = 0:5;
        }
        field(18;"Qty. to Ship";Decimal)
        {
            AccessByPermission = TableData 110=R;
            CaptionML = ENU='Qty. to Ship',
                        FRA='Qté à expédier';
            DecimalPlaces = 0:5;

            trigger OnValidate();
            var
                ItemLedgEntry : Record "32";
            begin
            end;
        }
        field(22;"Unit Price";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Unit Price',
                        FRA='Prix unitaire';
        }
        field(85;"Qty. on Sales Order";Decimal)
        {
            AccessByPermission = TableData 110=R;
            CalcFormula = Sum("Sales Line"."Outstanding Qty. (Base)" WHERE (Document Type=CONST(Order),
                                                                            Type=CONST(Item),
                                                                            No.=FIELD(No.),
                                                                            Document No.=FIELD(Document No.)));
            CaptionML = ENU='Qty. on Sales Order',
                        FRA='Qté sur commande vente';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(91;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            Editable = false;
            TableRelation = Currency;
        }
        field(92;"Entry Date";DateTime)
        {
            CaptionML = ENU='Date',
                        FRA='Date';
        }
        field(93;"Salesperson code";Code[10])
        {
            CaptionML = ENU='Salesperson code',
                        FRA='Code vendeur';
        }
        field(94;Inventory;Decimal)
        {
            CaptionML = ENU='Inventory',
                        FRA='Stock site';
        }
        field(95;"Total available inventory";Decimal)
        {
            CaptionML = ENU='Total available inventory',
                        FRA='Stock total disponible';
        }
        field(96;"Total Proj inventory available";Decimal)
        {
            CaptionML = ENU='Total projected inventory available',
                        FRA='Stock total projeté disponible';
        }
        field(5402;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
        }
        field(5403;"Bin Code";Code[20])
        {
            CaptionML = ENU='Bin Code',
                        FRA='Code emplacement';

            trigger OnLookup();
            var
                WMSManagement : Codeunit "7302";
                BinCode : Code[20];
            begin
            end;

            trigger OnValidate();
            var
                WMSManagement : Codeunit "7302";
            begin
            end;
        }
        field(5700;"Responsibility Center";Code[10])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de gestion';
            TableRelation = "Responsibility Center";
        }
        field(70006;"Code Famille";Code[20])
        {
            TableRelation = Famille;
        }
        field(70007;"Code Index";Code[20])
        {
            TableRelation = Index."Code Index" WHERE (Field3=FIELD(Code Famille));
        }
        field(70008;"Code Segment";Code[20])
        {
            TableRelation = Segment."Code Segment" WHERE (Code Index=FIELD(Code Famille),
                                                          % Cancel=FIELD(Code Index));
        }
        field(70009;"Order type";Option)
        {
            CaptionML = ENU='Order type',
                        FRA='Type commande';
            OptionMembers = Vente,Service;
        }
        field(70010;MAD;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70011;ICC;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70012;FC;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70013;"Product Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70014;"EPM Non Reorder Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'This code contains the actual reject code from the parts master';
        }
        field(70015;"Substitution codes";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'value 1 -> 1 to 1 sumbstitution, other values 1 to many substitution';
        }
        field(70016;"Not used anymore";Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(70017;"Sub Supplier Code";Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(70018;"Origin Code";Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'It contains the same values as Country code';
        }
        field(70019;"Non Stock Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = '1=stocked at TPCE and available, 2= stocked at TPCE but not avialble,….';
        }
        field(70020;"Distribution Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Code indicating who is responsible to supply the goods towards distributors old style';
        }
        field(70021;"Controle technique";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70022;"Sur Commande";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70023;"Stock Total";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70024;"Qté Manquante";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70025;"Valeur des Manquant";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70026;"Qté En Cmd Achat";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70137;ETD;Date)
        {
            CaptionML = ENU='Esimated time of departure',
                        FRA='Date de départ prévue';
            DataClassification = ToBeClassified;
            Description = 'KT 10042019';
        }
        field(70138;ETA;Date)
        {
            CaptionML = ENU='Esimated time of arrival',
                        FRA='Date d''arrivée prévue';
            DataClassification = ToBeClassified;
            Description = 'KT 10042019';
        }
        field(70139;"No Facture";Code[20])
        {
            CalcFormula = Lookup("Sales Invoice Line"."Document No." WHERE (No Devis=FIELD(Document No.),
                                                                            Type=FILTER(Item),
                                                                            No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(70140;"Date Facture";Date)
        {
            CalcFormula = Lookup("Sales Invoice Line"."Posting Date" WHERE (No Devis=FIELD(Document No.),
                                                                            Type=FILTER(Item),
                                                                            No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(70141;"No Facture Service";Code[20])
        {
            CalcFormula = Lookup("Service Invoice Line"."Quote No" WHERE (Type=CONST(Item),
                                                                          No.=FIELD(No.),
                                                                          Quote No=FIELD(Document No.)));
            FieldClass = FlowField;
        }
        field(70142;"Date Facture Service";Date)
        {
            CalcFormula = Lookup("Service Invoice Line"."Posting Date" WHERE (Type=CONST(Item),
                                                                              No.=FIELD(No.),
                                                                              Quote No=FIELD(Document No.)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        VentesRatées.RESET;
        IF VentesRatées.FINDLAST THEN
        "Entry No.":=VentesRatées."Entry No."+1
        ELSE
        "Entry No.":=1;
    end;

    var
        "VentesRatées" : Record "70096";
        LCduItemavailability : Codeunit "70000";
        RecGItem : Record "27";
}

