table 70056 "Customer Discount Group MO"
{
    // version NAVW19.00

    CaptionML = ENU='Customer Discount Group',
                FRA='Groupe remises client';
    DrillDownPageID = 70258;
    LookupPageID = 70258;

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
                        FRA='Désignation';
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
        fieldgroup(Brick;"Code",Description)
        {
        }
    }

    trigger OnDelete();
    var
        SalesLineDiscount : Record "7004";
    begin
        /*TODO FOR MO
        SalesLineDiscount.SETCURRENTKEY("Sales Type","Sales Code");
        SalesLineDiscount.SETRANGE("Sales Type",SalesLineDiscount."Sales Type"::"Customer Disc. Group");
        SalesLineDiscount.SETRANGE("Sales Code",Code);
        SalesLineDiscount.DELETEALL(TRUE);
        */

    end;
}

