table 70052 "Item Master Price Archive"
{
    // version PR00011

    CaptionML = ENU='Item Master Price',
                FRA='Master prix pièce Archive';
    DataPerCompany = false;
    DrillDownPageID = 70073;
    LookupPageID = 70073;

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
        field(3;"Item Price Category";Code[10])
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
        field(14;Version;Integer)
        {
        }
    }

    keys
    {
        key(Key1;Version,"Item No.","Make Code","Item Price Category","Valid-From Date")
        {
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }

    var
        C_INC001 : TextConst ENU='The Valid-From Date must not be greater than the Valid-To Date!',FRA='La date de début de validité ne doit pas être postérieure à la date de fin de validité !';
        C_INC002 : TextConst ENU='The Valid-To Date must not be less than the Valid-From Date!',FRA='La date de fin de validité ne doit pas être antérieure à la date de début de validité !';

    procedure AdjustItemMaster();
    var
        ItemMaster : Record "70007";
    begin
    end;
}

