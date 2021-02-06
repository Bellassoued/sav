table 50032 "Fiche Technique"
{
    // version CT16V002

    CaptionML = ENU='data sheet',
                FRA='Fiche Technique';
    DrillDownPageID = 60179;
    LookupPageID = 60179;

    fields
    {
        field(1;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° article';
            TableRelation = Item;
        }
        field(2;"Make Code";Code[20])
        {
            CaptionML = ENU='Make Code',
                        FRA='Code Marque';
            TableRelation = Make.Code;
        }
        field(3;"Vehicle Type Code";Code[20])
        {
            CaptionML = ENU='Vehicle Type Code',
                        FRA='Code type véhicule';
            TableRelation = "Vehicule type".Code;
        }
        field(4;"Vehicle Category Code";Code[20])
        {
            CaptionML = ENU='Vehicle Category Code',
                        FRA='Code catégorie véhicule';
            TableRelation = "Vehicle Category".Code WHERE (Make Code=FIELD(Make Code));
        }
        field(5;"Emissions Test Category Code";Code[20])
        {
            CaptionML = ENU='Emissions Test Category Code',
                        FRA='Code catégorie test échappement';
            TableRelation = "Emissions Test Category".Code;
        }
        field(6;"Model Code";Text[50])
        {
            CaptionML = ENU='Model Code',
                        FRA='Code Modèle';
            TableRelation = "Hiérarchie Pièce"."Model Code";
        }
        field(7;"MVEG Consumption";Decimal)
        {
            CaptionML = ENU='MVEG Consumption',
                        FRA='Consommation MVEG';
        }
        field(8;"Engine Type Code";Code[20])
        {
            CaptionML = ENU='Engine Type Code',
                        FRA='Code Type Moteur';
            TableRelation = "Engine Type".Code;
        }
        field(9;"Transmission Type Code";Code[20])
        {
            CaptionML = ENU='Transmission Type Code',
                        FRA='Code Type transmission';
            TableRelation = "Transmission Type".Code;
        }
        field(10;"Cylinder Capacity (ccm)";Decimal)
        {
            CaptionML = ENU='Cylinder Capacity (ccm)',
                        FRA='Cylindrée (cc)';
        }
        field(11;"No. of Cylinders";Integer)
        {
            CaptionML = ENU='No. of Cylinders',
                        FRA='Nbre cylindres';
        }
        field(12;"Power (kW)";Integer)
        {
            CaptionML = ENU='Power (kW)',
                        FRA='Puissance (KW)';
        }
        field(13;"Power (hp)";Integer)
        {
            CaptionML = ENU='Power (hp)',
                        FRA='Puissance (CH)';
        }
        field(14;Tires;Text[30])
        {
            CaptionML = ENU='Tires',
                        FRA='Pneus';
        }
        field(15;"Empty Weight (kg)";Decimal)
        {
            CaptionML = ENU='Empty Weight (kg)',
                        FRA='Poids vide (KG)';
        }
        field(16;"Total Weight (kg)";Decimal)
        {
            CaptionML = ENU='Total Weight (kg)',
                        FRA='Poids total (KG)';
        }
        field(17;"Roof Load (kg)";Decimal)
        {
            CaptionML = ENU='Roof Load (kg)',
                        FRA='Charge toit (KG)';
        }
        field(18;"Trailer Load (kg)";Decimal)
        {
            CaptionML = ENU='Trailer Load (kg)',
                        FRA='Charge remorque (KG)';
        }
        field(19;"Trailer Tongue Load (kg)";Decimal)
        {
            CaptionML = ENU='Trailer Tongue Load (kg)',
                        FRA='Capacité de charge (KG)';
        }
        field(20;"4WD";Boolean)
        {
            CaptionML = ENU='4WD',
                        FRA='Tous terrains';
        }
        field(21;"No. of Axles";Integer)
        {
            CaptionML = ENU='No. of Axles',
                        FRA='Nbre essieux';
        }
        field(22;"Wheelbase (mm)";Decimal)
        {
            CaptionML = ENU='Wheelbase (mm)',
                        FRA='Distance de roues (mm)';
        }
        field(23;"Front Axle Load (kg)";Integer)
        {
            CaptionML = ENU='Front Axle Load (kg)',
                        FRA='Charge axe avant (KG)';
        }
        field(24;"Rear Axle Load (kg)";Integer)
        {
            CaptionML = ENU='Rear Axle Load (kg)',
                        FRA='Charge essieu arrière (KG)';
        }
        field(25;"No. of Doors";Integer)
        {
            CaptionML = ENU='No. of Doors',
                        FRA='Nbre portes';
        }
        field(26;"Seasonal Factor";Code[10])
        {
            CaptionML = ENU='Seasonal Factor',
                        FRA='Facteur saisonnier';
        }
        field(27;"Fiscal Power";Code[20])
        {
            CaptionML = ENU='Fiscal Power',
                        FRA='Puissance fiscal';
            Description = ' until ?';
            Enabled = false;
        }
        field(28;"Frais energie";Decimal)
        {
        }
        field(29;"Frais immatriculation";Decimal)
        {
        }
        field(30;"Total Immatriculation";Decimal)
        {
        }
        field(31;"Designation 2";Text[100])
        {
            CaptionML = ENU='Famille',
                        FRA='Famille';
        }
        field(32;"Type mines";Code[50])
        {
        }
        field(33;"Puissance Fiscal";Code[10])
        {
        }
        field(35;"Sous-famille";Text[30])
        {
        }
        field(36;"Rang famille dans états";Integer)
        {
        }
        field(37;"Frais Red. Grosse Cylindrée";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'SM 051118';
        }
        field(38;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Sans Fodec";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SM 010119';
        }
        field(40;"Date Début Homologation";Date)
        {
            DataClassification = ToBeClassified;
            Description = 'SM 110119';
        }
        field(41;"Date Fin Homologation";Date)
        {
            DataClassification = ToBeClassified;
            Description = 'SM 110119';
        }
        field(42;Vitesses;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(43;"Type energie";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(44;"Nbre Place";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(45;"Répartiton HT\TTC";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'SM 040119';
            OptionMembers = " ",HT,TTC;
        }
        field(50000;"Famille commerciale";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Familles commerciales";
        }
    }

    keys
    {
        key(Key1;"Item No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        Item.GET("Item No.");
        Description := Item.Description;
    end;

    var
        Item : Record "27";
}

