table 60085 "Titre"
{
    DrillDownPageID = 70281;
    LookupPageID = 70281;

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;"Libelle Titre";Text[100])
        {
        }
        field(21;"Customer Posting Group";Code[10])
        {
            CaptionML = ENU='Customer Posting Group',
                        FRA='Groupe compta. client';
            TableRelation = "Customer Posting Group";
        }
        field(88;"Gen. Bus. Posting Group";Code[20])
        {
            CaptionML = ENU='Gen. Bus. Posting Group',
                        FRA='Groupe compta. marché';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate();
            begin
                /*IF xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" THEN
                  IF GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") THEN
                    VALIDATE("VAT Bus. Posting Group",GenBusPostingGrp."Def. VAT Bus. Posting Group");
                    */

            end;
        }
        field(110;"VAT Bus. Posting Group";Code[10])
        {
            CaptionML = ENU='VAT Bus. Posting Group',
                        FRA='Groupe compta. marché TVA';
            TableRelation = "VAT Business Posting Group";
        }
        field(111;"Customer Price Group";Code[10])
        {
            Caption = 'Groupe Tarif Client';
            TableRelation = "Customer Price Group";
        }
        field(112;Canal;Text[30])
        {
        }
        field(113;Secteur;Text[50])
        {
        }
        field(114;"Activité";Text[50])
        {
        }
        field(115;RPD;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(116;RTAI;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(117;"Appliquer Fodec";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(118;"Debour TVA";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(119;"frais Incessibilité";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(120;Plaque;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(121;"Frais Immat";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(122;"Frais Redevence";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(123;"Frais TME";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(124;"Afficher Text";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(125;"Hors taxe";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60055;"Customer Disc. Group PR SAV";Code[20])
        {
            CaptionML = ENU='Customer Disc. Group AF',
                        FRA='Groupe rem. client PR SAV';
            DataClassification = ToBeClassified;
            Description = 'SM 030519';
            TableRelation = "Customer Discount Group";
        }
        field(60056;"Customer Disc. Group PR";Code[20])
        {
            CaptionML = ENU='Customer Disc. Group',
                        FRA='Groupe rem. client PR';
            DataClassification = ToBeClassified;
            Description = 'SM 030519';
            TableRelation = "Customer Discount Group";
        }
        field(60057;"Customer Disc. Group MO";Code[20])
        {
            CaptionML = ENU='Customer Disc. Group MO',
                        FRA='Groupe rem. client PR MO';
            DataClassification = ToBeClassified;
            Description = 'SM 030519';
            TableRelation = "Customer Discount Group";
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Libelle Titre","Code")
        {
        }
    }
}

