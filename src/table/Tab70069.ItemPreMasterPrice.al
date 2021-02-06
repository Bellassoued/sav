table 70069 "Item Pre Master Price"
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
    // +----------------------------------------------+
    // PA-Number   Date                               |
    // -----------------------------------------------+
    // PA021506    13.09.04

    CaptionML = ENU='Item Master Price',
                FRA='Master prix pièce';
    DataPerCompany = false;
    DrillDownPageID = 70104;
    LookupPageID = 70104;

    fields
    {
        field(1;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° Pièce';
            NotBlank = true;
            TableRelation = "Item Master".No. WHERE (Make Code=FIELD(Make Code));
        }
        field(2;"Make Code";Code[10])
        {
            CaptionML = ENU='Make Code',
                        FRA='Code marque';
            NotBlank = true;
        }
        field(3;"Catégorie de prix pièce";Code[10])
        {
            CaptionML = ENU='Item Price Category',
                        FRA='Catégorie de prix pièce';
            NotBlank = true;
        }
        field(4;"Valid-From Date";Date)
        {
            CaptionML = ENU='Valid-From Date',
                        FRA='Date debut validité';

            trigger OnValidate();
            begin
                IF ("Valid-From Date" > "Valid-To Date")   AND   ("Valid-To Date" <> 0D)  THEN
                  ERROR(C_INC001);
            end;
        }
        field(5;"Version No.";Code[20])
        {
            CaptionML = ENU='Version No.',
                        FRA='N° Version';
            Editable = false;
        }
        field(10;Price;Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Price',
                        FRA='Prix';
            MinValue = 0;
        }
        field(11;"Qty. per Price Indication";Decimal)
        {
            CaptionML = ENU='Qty. per Price Indication',
                        FRA='Qté par indication de prix';
        }
        field(12;"Valid-To Date";Date)
        {
            CaptionML = ENU='Valid-To Date',
                        FRA='Date fin validité';

            trigger OnValidate();
            begin
                IF ("Valid-To Date" <> 0D)  AND  ("Valid-To Date" < "Valid-From Date") THEN
                  ERROR(C_INC002);
            end;
        }
        field(13;"traitée";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Item No.","Make Code","Catégorie de prix pièce","Valid-From Date")
        {
            MaintainSIFTIndex = false;
        }
        key(Key2;"Item No.","Make Code","Valid-From Date")
        {
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        AdjustItemMaster();
    end;

    trigger OnModify();
    begin
        AdjustItemMaster();
    end;

    var
        C_INC001 : TextConst ENU='The Valid-From Date must not be greater than the Valid-To Date!',FRA='La date de début de validité ne doit pas être postérieure à la date de fin de validité !';
        C_INC002 : TextConst ENU='The Valid-To Date must not be less than the Valid-From Date!',FRA='La date de fin de validité ne doit pas être antérieure à la date de début de validité !';

    procedure AdjustItemMaster();
    var
        ItemMaster : Record "70007";
    begin
        IF ItemMaster.GET("Item No.","Make Code") THEN BEGIN
          ItemMaster.Price := Price;
          ItemMaster."Qty. per Price Indication" := "Qty. per Price Indication";
          ItemMaster.MODIFY;
        END;
    end;
}

