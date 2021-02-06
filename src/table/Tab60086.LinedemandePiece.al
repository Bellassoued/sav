table 60086 "Line demande Piece"
{
    // version a supprimer

    //  CT16V001 ZM 16/05/2016 : upgrade

    Caption = 'Line demande Piece';

    fields
    {
        field(1;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document';
        }
        field(2;"Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne';
        }
        field(3;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° article';
            TableRelation = Item WHERE (Type=CONST(Inventory));

            trigger OnValidate();
            var
                TempTransferLine : Record "5741" temporary;
                LRecItemJournalLine : Record "83";
            begin
            end;
        }
        field(4;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(5;"Unit of Measure";Text[10])
        {
            CaptionML = ENU='Unit of Measure',
                        FRA='Unité';
        }
        field(6;"Qty. to Ship";Decimal)
        {
            CaptionML = ENU='Qty. to Ship',
                        FRA='Qté à expédier';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(7;"Qty. to Receive";Decimal)
        {
            CaptionML = ENU='Qty. to Receive',
                        FRA='Qté à recevoir';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(8;"Quantity Shipped";Decimal)
        {
            CaptionML = ENU='Quantity Shipped',
                        FRA='Qté expédiée';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(9;"Quantity Received";Decimal)
        {
            CaptionML = ENU='Quantity Received',
                        FRA='Quantité reçue';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(13;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(16;"Quantity (Base)";Decimal)
        {
            CaptionML = ENU='Quantity (Base)',
                        FRA='Quantité (base)';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(17;"Outstanding Qty. (Base)";Decimal)
        {
            CaptionML = ENU='Outstanding Qty. (Base)',
                        FRA='Quantité ouverte (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(18;"Qty. to Ship (Base)";Decimal)
        {
            CaptionML = ENU='Qty. to Ship (Base)',
                        FRA='Qté à expédier (base)';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(19;"Qty. Shipped (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Shipped (Base)',
                        FRA='Qté expédiée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(20;"Qty. to Receive (Base)";Decimal)
        {
            CaptionML = ENU='Qty. to Receive (Base)',
                        FRA='Qté à recevoir (base)';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(21;"Qty. Received (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Received (Base)',
                        FRA='Quantité reçue (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(22;"Qty. per Unit of Measure";Decimal)
        {
            CaptionML = ENU='Qty. per Unit of Measure',
                        FRA='Quantité par unité';
            DecimalPlaces = 0:5;
            Editable = false;
            InitValue = 1;
        }
        field(23;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité';
            TableRelation = "Item Unit of Measure".Code WHERE (Item No.=FIELD(Item No.));

            trigger OnValidate();
            var
                UnitOfMeasure : Record "204";
                UOMMgt : Codeunit "5402";
            begin
            end;
        }
        field(24;"Outstanding Quantity";Decimal)
        {
            CaptionML = ENU='Outstanding Quantity',
                        FRA='Quantité restante';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(25;"Gross Weight";Decimal)
        {
            CaptionML = ENU='Gross Weight',
                        FRA='Poids brut';
            DecimalPlaces = 0:5;
        }
        field(26;"Net Weight";Decimal)
        {
            CaptionML = ENU='Net Weight',
                        FRA='Poids net';
            DecimalPlaces = 0:5;
        }
        field(27;"Unit Volume";Decimal)
        {
            CaptionML = ENU='Unit Volume',
                        FRA='Volume unitaire';
            DecimalPlaces = 0:5;
        }
        field(30;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
            TableRelation = "Item Variant".Code WHERE (Item No.=FIELD(Item No.));

            trigger OnValidate();
            var
                ItemVariant : Record "5401";
            begin
            end;
        }
        field(33;"In-Transit Code";Code[10])
        {
            CaptionML = ENU='In-Transit Code',
                        FRA='Code transit';
            Editable = false;
            TableRelation = Location WHERE (Use As In-Transit=CONST(Yes));
        }
        field(34;"Qty. in Transit";Decimal)
        {
            CaptionML = ENU='Qty. in Transit',
                        FRA='Qté en transit';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(35;"Qty. in Transit (Base)";Decimal)
        {
            CaptionML = ENU='Qty. in Transit (Base)',
                        FRA='Qté en transit (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(36;"Transfer-from Code";Code[10])
        {
            CaptionML = ENU='Transfer-from Code',
                        FRA='Code prov. transfert';
            Editable = false;
            TableRelation = Location;
        }
        field(37;"Transfer-to Code";Code[10])
        {
            CaptionML = ENU='Transfer-to Code',
                        FRA='Code dest. transfert';
            Editable = false;
            TableRelation = Location;

            trigger OnValidate();
            var
                LRecItemJournalLine : Record "83";
            begin
            end;
        }
        field(38;"Shipment Date";Date)
        {
            CaptionML = ENU='Shipment Date',
                        FRA='Date d''expédition';
        }
        field(39;"Receipt Date";Date)
        {
            CaptionML = ENU='Receipt Date',
                        FRA='Date de réception';
        }
        field(40;"Derived From Line No.";Integer)
        {
            CaptionML = ENU='Derived From Line No.',
                        FRA='Issue de ligne n°';
            TableRelation = "Transfer Line"."Line No." WHERE (Document No.=FIELD(Document No.));
        }
        field(5752;"Completely Shipped";Boolean)
        {
            CaptionML = ENU='Completely Shipped',
                        FRA='Entièrement expédiée';
            Editable = false;
        }
        field(5753;"Completely Received";Boolean)
        {
            CaptionML = ENU='Completely Received',
                        FRA='Entièrement réceptionné';
            Editable = false;
        }
        field(7300;"Transfer-from Bin Code";Code[20])
        {
            CaptionML = ENU='Transfer-from Bin Code',
                        FRA='Transf. du code emplacement';
            TableRelation = "Bin Content"."Bin Code" WHERE (Location Code=FIELD(Transfer-from Code),
                                                            Item No.=FIELD(Item No.),
                                                            Variant Code=FIELD(Variant Code));
        }
        field(7301;"Transfer-To Bin Code";Code[20])
        {
            CaptionML = ENU='Transfer-To Bin Code',
                        FRA='Transf. vers code emplacement';
            TableRelation = Bin.Code WHERE (Location Code=FIELD(Transfer-to Code));
        }
        field(60000;"Reception No";Code[20])
        {
            CaptionML = ENU='Receive No.',
                        FRA='Reception N°';
        }
        field(60001;"Type Reception";Option)
        {
            OptionMembers = "Reception Rapide","Reception Grand Reparation",VN;
        }
        field(60002;"No Service Order";Code[20])
        {
        }
        field(60006;"Source Type";Option)
        {
            OptionCaption = ',Vente PR,Vente VN,Assemblage VN,Service Rapide,Grande réparation,VN';
            OptionMembers = ,"Vente PR","Vente VN","Assemblage VN","Service Rapide","Grande réparation",VN;
        }
        field(60007;"Source No";Code[20])
        {
        }
        field(60008;"From Order Line No";Integer)
        {
            Description = 'SM MAZDA06';
        }
        field(60009;"From Service Item Line";Integer)
        {
            Description = 'SM MAZDA06';
        }
        field(60010;Retour;Boolean)
        {
            Description = 'SM MAZDA06';
        }
        field(60011;InterCompany;Boolean)
        {
            Description = 'SM MAZDA06';
        }
        field(60012;Replaced;Boolean)
        {
            Caption = 'Remplacé';
            Description = 'SM MAZDA10';
        }
        field(60013;Chassi;Text[30])
        {
            Description = 'GMED 11 06 14';
        }
        field(60014;Client;Code[30])
        {
            Description = 'GMED 11 06 14';
        }
        field(60015;"Non Livré";Boolean)
        {
            Description = 'SM PVN MAZDA988';
        }
        field(60016;"Date Livraison Retardé";DateTime)
        {
            Description = 'SM PVN MAZDA988';
        }
        field(60017;"Livraison Retardé  Par";Code[50])
        {
            Description = 'SM PVN MAZDA988';
        }
        field(70000;"CAB Mouvment";Decimal)
        {
            CalcFormula = Sum("CAB Mouvement".Qté WHERE (Code magasin De=FIELD(Transfer-from Code),
                                                         Code Casier De=FIELD(Transfer-from Bin Code),
                                                         Code a barre=FIELD(Item No.),
                                                         No. Order Transfert=FIELD(Document No.),
                                                         Type Mouvement Transfert=CONST(Expedition)));
            CaptionML = ENU='Qty Scanner à Expédier',
                        FRA='Qty Scanner à Expédier';
            FieldClass = FlowField;
        }
        field(70001;"Qty Demandée";Decimal)
        {
        }
        field(70002;"Par Défaut";Boolean)
        {

            trigger OnValidate();
            var
                LRecItemJournalLine : Record "83";
            begin
            end;
        }
        field(70003;"Qty Scanner à réceptionner";Decimal)
        {
            CalcFormula = Sum("CAB Mouvement".Qté WHERE (Code a barre=FIELD(Item No.),
                                                         No. Order Transfert=FIELD(Document No.),
                                                         Type Mouvement Transfert=CONST(Reception)));
            FieldClass = FlowField;
        }
        field(70004;"Code Famille";Code[20])
        {
            Description = 'PR0018';
            TableRelation = Famille.Code WHERE (Code Index=FIELD(Code Index),
                                                Code Segment=FIELD(Code Segment));
        }
        field(70005;"Code Index";Code[20])
        {
            Description = 'PR0018';
            TableRelation = Index."Code Index";
        }
        field(70006;"Code Segment";Code[20])
        {
            Description = 'PR0018';
            TableRelation = Segment."Code Segment" WHERE (Code Index=FIELD(Code Index));
        }
        field(70007;Poids;Decimal)
        {
            Caption = 'Poids Net (Kg)';
            Description = 'PR0017';
        }
        field(70008;Volume;Decimal)
        {
            Description = 'PR0017';
        }
        field(70009;"Qty Scanner RCP";Decimal)
        {
        }
        field(70010;"Code Pickeur AMB";Code[50])
        {
            TableRelation = "User Setup";
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        ItemChargeAssgntPurch : Record "5805";
    begin
    end;

    trigger OnInsert();
    var
        TransLine2 : Record "5741";
    begin
    end;
}

