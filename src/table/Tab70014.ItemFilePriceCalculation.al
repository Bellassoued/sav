table 70014 "Item File Price Calculation"
{
    // version PR00011

    // +----------------------------------------------+
    // | Copyright © 2000 Incadea AG Germany          |
    // +----------------------------------------------+
    // | INCADEA ENGINE                               |
    // +----------------------------------------------+
    // Version Datum    Kz     Bemerkung
    // ------------------------------------------------
    //    2.30 01.12.02 INC    Update
    // PA024625   31.01.05

    CaptionML = ENU='Item File Price Calculation',
                FRA='Calcul prix fichier pièce';
    DrillDownPageID = 70017;
    LookupPageID = 70017;

    fields
    {
        field(1;"Item Price Base";Option)
        {
            CaptionML = ENU='Item Price Base',
                        FRA='Prix base pièce';
            OptionCaptionML = ENU='Direct Unit Cost,Unit Price,List Price',
                              FRA='Dernier coûts direct,Prix unitaire,Prix catalogue';
            OptionMembers = "Direct Unit Cost","Unit Price","List Price";
        }
        field(2;"Make Code";Code[10])
        {
            CaptionML = ENU='Make Code',
                        FRA='Code marque';
            TableRelation = Make;
        }
        field(3;"Item Group";Code[10])
        {
            CaptionML = ENU='Item Group',
                        FRA='Code remise';

            trigger OnValidate();
            begin
                IF "Item Group" <> '' THEN
                  TESTFIELD("Make Code");
            end;
        }
        field(4;"From Old Price";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='From Old Price',
                        FRA='Du prix ancien';
            MinValue = 0;
        }
        field(5;"Valid-From Date";Date)
        {
            CaptionML = ENU='Valid-From Date',
                        FRA='Date debut validité';
        }
        field(10;"Item Price Category";Code[10])
        {
            CaptionML = ENU='Item Price Category',
                        FRA='Catégorie de prix pièce';
        }
        field(11;"Calculation Type";Option)
        {
            CaptionML = ENU='Calculation Type',
                        FRA='Type calcul';
            OptionCaptionML = ENU='Surcharge,Reduction',
                              FRA='Surcharge,Réduction';
            OptionMembers = Surcharge,Reduction;
        }
        field(12;"Factor %";Decimal)
        {
            CaptionML = ENU='Factor %',
                        FRA='% facteur';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(13;"Frais d'approche";Decimal)
        {
        }
        field(14;"% Marge";Decimal)
        {
        }
        field(15;"Taux de change Simulé";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Item Price Base","Make Code","Item Group","From Old Price","Valid-From Date")
        {
            MaintainSIFTIndex = false;
        }
        key(Key2;"Item Price Base","Make Code","Item Group","Valid-From Date","From Old Price")
        {
            MaintainSIFTIndex = false;
        }
        key(Key3;"Item Price Base","Valid-From Date","Make Code","Item Group","From Old Price")
        {
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }
}

