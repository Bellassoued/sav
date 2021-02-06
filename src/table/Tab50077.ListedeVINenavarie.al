table 50077 "Liste de VIN en avarie"
{
    DrillDownPageID = 70288;
    LookupPageID = 70288;

    fields
    {
        field(1;VIN;Code[20])
        {

            trigger OnValidate();
            begin
                FctGetEmplacementActuel;
                FctGetServiceItemInfo;
            end;
        }
        field(2;"Degré de gravité";Decimal)
        {
        }
        field(3;"Date de remise en état prévue";Date)
        {
        }
        field(4;Traiter;Boolean)
        {
        }
        field(5;"En cours de traitement";Boolean)
        {
            CalcFormula = Exist("Reception SAV" WHERE (N° constat avarie=FIELD(No.),
                                                       Status SR=FILTER(<>Facturée),
                                                       Type assurances groupe=CONST(Avarie)));
            FieldClass = FlowField;
        }
        field(6;"Date de création";DateTime)
        {
        }
        field(7;"Date de modification";DateTime)
        {
        }
        field(8;"Créé par";Code[50])
        {
        }
        field(9;"Num Ligne";Integer)
        {
        }
        field(10;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
        }
        field(11;"Reception No.";Code[20])
        {
            CaptionML = ENU='Reception No.',
                        FRA='Num OR';
            TableRelation = "Reception SAV";
        }
        field(12;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
            TableRelation = "No. Series";
        }
        field(13;"Emplacement de destination";Code[10])
        {
            TableRelation = Bin.Code WHERE (Not available=CONST(Yes));
        }
        field(14;"No. article de service";Code[20])
        {
            CaptionML = ENU='No. article de service',
                        FRA='No. article de service';
        }
        field(15;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° article';
            TableRelation = Item WHERE (Inventory Posting Group=CONST(VEHICULES));
        }
        field(16;"Location of Service Item";Text[30])
        {
            CaptionML = ENU='Location of Service Item',
                        FRA='Magasin article de service';
        }
        field(17;"Code magasin avant avarie";Code[10])
        {
        }
        field(18;"Code emplacement avant avarie";Code[10])
        {
        }
        field(19;"Variant code";Code[10])
        {
        }
        field(20;"Véhicule transféré vers avarie";Boolean)
        {
        }
        field(21;"Code Emplacement Retour";Code[20])
        {
            TableRelation = Bin.Code WHERE (Location Code=CONST(PARC_VN),
                                            Not available=CONST(No));
        }
        field(22;"Type avarie";Option)
        {
            OptionMembers = " ","Assurance Port","Assurance Parc",Transporteur;
        }
        field(23;"Code client";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        TESTFIELD("Reception No.",'');
    end;

    trigger OnInsert();
    begin
        ServMgtSetup.GET ;
        IF "No." = '' THEN BEGIN
          ServMgtSetup.TESTFIELD("Souche constat avarie");
          NoSeriesMgt.InitSeries(ServMgtSetup."Souche constat avarie",xRec."No. Series",0D,"No.","No. Series");
        END;
        "Date de création":=CURRENTDATETIME;
        "Créé par":=USERID;
        "Num Ligne":=10000;
        ListedeVINenavarie.RESET;
        ListedeVINenavarie.SETRANGE(VIN,VIN);
        IF ListedeVINenavarie.FINDLAST THEN
          "Num Ligne":=ListedeVINenavarie."Num Ligne"+10000;
    end;

    var
        ListedeVINenavarie : Record "50077";
        ServMgtSetup : Record "5911";
        NoSeriesMgt : Codeunit "396";
        GRecServiceItem : Record "5940";
        WarehouseEntry : Record "7312";

    procedure FctGetEmplacementActuel();
    var
        LRecInventorySetup : Record "313";
        ServiceItem : Record "5940";
    begin
        TESTFIELD(VIN);
        LRecInventorySetup.GET;
        //MESSAGE('Loc %1 Bin %2',WarehouseEntry."Location Code",WarehouseEntry."Bin Code");
        //IF "Code emplacement avant avarie"='' THEN
          "Code emplacement avant avarie":= ServiceItem.GetBin(VIN);
        //IF "Code magasin avant avarie"='' THEN
        "Code magasin avant avarie"    :=LRecInventorySetup."VN Default Sales Location";
        //MESSAGE('FctGetEmplacementActuel %1 %2',"Code emplacement avant avarie",VIN);
    end;

    procedure FctGetServiceItemInfo();
    var
        LRecServiceItem : Record "5940";
    begin
        LRecServiceItem.RESET;
        LRecServiceItem.SETRANGE("Serial No.",VIN);
        IF LRecServiceItem.FINDFIRST THEN BEGIN
          IF "Item No."='' THEN
          "Item No."                :=LRecServiceItem."Item No.";
          IF "Variant code"='' THEN
          "Variant code"            :=LRecServiceItem."Variant Code";
          IF "No. article de service"='' THEN
          "No. article de service"  :=LRecServiceItem."No.";
        END;
    end;
}

