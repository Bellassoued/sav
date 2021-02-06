table 70041 "Service Cost23"
{
    // version NAVW110.00,T180001

    // T180001 ZM 05/10/2018 : upgrade

    CaptionML = ENU='Service Cost',
                FRA='Coût service23';
    LookupPageID = 5910;

    fields
    {
        field(1;"Code";Code[20])
        {
            CaptionML = ENU='Code',
                        FRA='Code';
            NotBlank = true;
        }
        field(2;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Description';
        }
        field(3;"Account No.";Code[20])
        {
            CaptionML = ENU='Account No.',
                        FRA='N° compte';
        }
        field(4;"Default Unit Price";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Default Unit Price',
                        FRA='Prix unitaire par défaut';
        }
        field(5;"Default Quantity";Decimal)
        {
            CaptionML = ENU='Default Quantity',
                        FRA='Quantité par défaut';
            DecimalPlaces = 0:5;
        }
        field(6;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité';
        }
        field(7;"Cost Type";Option)
        {
            CaptionML = ENU='Cost Type',
                        FRA='Type coût';
            OptionCaptionML = ENU='Travel,Support,Other',
                              FRA='Déplacement,Assistance,Autre';
            OptionMembers = Travel,Support,Other;
        }
        field(8;"Service Zone Code";Code[10])
        {
            CaptionML = ENU='Service Zone Code',
                        FRA='Code zone service';
        }
        field(9;"Default Unit Cost";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Default Unit Cost',
                        FRA='Coût unitaire par déf.';
        }
        field(50000;"Cost Group";Option)
        {
            CaptionML = ENU='Cost Group',
                        FRA='Groupe de côuts';
            OptionCaption = ',Service Rapide,Grande Réparations';
            OptionMembers = ,"Service Rapide","Grande Réparations";
        }
        field(50001;"Famille de service";Code[20])
        {
            CaptionML = ENU='Service Groupe',
                        FRA='Famille de service';
        }
        field(50002;"Groupe Remise Service";Code[20])
        {
            CaptionML = ENU='Service disc. Group',
                        FRA='Groupe Remise Service';
        }
        field(50003;"Account No. VA";Code[20])
        {
            CaptionML = ENU='Account No.',
                        FRA='N° compte VA';
            Description = 'SM MAZDA444';
        }
        field(50004;"Account No. VEA";Code[20])
        {
            CaptionML = ENU='Account No.',
                        FRA='N° compte VEA';
            Description = 'SM MAZDA444';
        }
        field(50005;"Account No. AC";Code[20])
        {
            CaptionML = ENU='Account No.',
                        FRA='N° compte AC';
            Description = 'SM MAZDA444';
        }
        field(50006;"Gen. Prod. Posting Group";Code[10])
        {
            CaptionML = ENU='Gen. Prod. Posting Group',
                        FRA='Groupe compta. produit';
        }
        field(50007;"VAT Prod. Posting Group";Code[10])
        {
            CaptionML = ENU='VAT Prod. Posting Group',
                        FRA='Groupe compta. produit TVA';
        }
        field(50008;"Groupe Tarif";Code[20])
        {
            Description = 'SM07072017';
        }
        field(50009;"Code Marque";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'NM260319';
        }
        field(50010;"N Modele";Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Ak010419';

            trigger OnValidate();
            begin
                /*//AK010419
                IF "N Modele" <> '' THEN
                  BEGIN
                    CLEAR(Item);
                    Item.GET("N Modele");
                    "N Modele" := Item.Description;
                  END
                ELSE
                  "N Modele" := '';
                //END
                */

            end;
        }
        field(50011;"Famille MO";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Ak010419';
        }
        field(50012;"Sous Famille MO";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Ak010419';
        }
        field(50013;Operation;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Ak010419';
        }
        field(50014;"Code MASTER MO";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'NM240419';
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
        key(Key2;"Service Zone Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Code",Description,"Cost Type","Default Unit Price")
        {
        }
    }

    trigger OnDelete();
    begin
        //MoveEntries.MoveServiceCostLedgerEntries(Rec);
    end;

    var
        MoveEntries : Codeunit "361";
        Item : Record "27";
}

