table 70026 "Ecart Inventaire"
{
    DrillDownPageID = 70065;
    LookupPageID = 70065;

    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='No. Article';
            TableRelation = Item;

            trigger OnValidate();
            begin
                RecItem.GET("Item No.");
                VALIDATE(Description,RecItem.Description);
            end;
        }
        field(3;Description;Text[80])
        {
        }
        field(4;Location;Code[20])
        {
            CaptionML = ENU='Location',
                        FRA='Magasin';
            TableRelation = Location;

            trigger OnValidate();
            begin
                IF (Location <> '') AND ("Item No." <> '') THEN
                  BEGIN
                    RecLocation.GET(Location);
                    IF RecLocation."Bin Mandatory" AND NOT RecLocation."Directed Put-away and Pick" THEN
                      BEGIN
                        REcBinContent.SETCURRENTKEY(Default);
                        REcBinContent.SETRANGE(Default,TRUE);
                        REcBinContent.SETRANGE("Location Code",Location);
                        REcBinContent.SETRANGE("Item No.","Item No.");
                        REcBinContent.SETRANGE("Variant Code","Variant Code");
                        IF REcBinContent.FINDFIRST THEN
                          Bin := REcBinContent."Bin Code"
                      END;
                  END;
            end;
        }
        field(5;Bin;Code[20])
        {
            CaptionML = ENU='Bin',
                        FRA='Emplacement';
        }
        field(6;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantities';
        }
        field(7;"Variant Code";Code[10])
        {
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

    var
        RecItem : Record "27";
        RecLocation : Record "14";
        REcBinContent : Record "7302";
}

