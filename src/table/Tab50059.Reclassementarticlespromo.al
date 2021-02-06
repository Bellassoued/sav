table 50059 "Reclassement articles promo"
{
    // version PROMO

    // //FctCalcStockTotalbyMag


    fields
    {
        field(1;"Promotion No.";Code[10])
        {
        }
        field(2;"Code article";Code[20])
        {
            TableRelation = Item;
        }
        field(3;"Code magasin";Code[10])
        {
            TableRelation = Location.Code WHERE (Magasin central succursale=CONST(Yes));

            trigger OnValidate();
            begin
                //IF "Code article" <>'' THEN
                  IF ("Code magasin" <>'') AND( "Code article" <>'' ) THEN BEGIN
                      "Stock magasin" :=CduItemavailability.FctCalcStockTotalbyMag("Code article","Code magasin",'');
                  END
                  ELSE BEGIN
                  "Stock magasin":=0;
                  "Stock casier destination":=0;
                  END;
                GDecConsommationannee:=0;
                "Quantité préconisée":=0;
                GRecLocation.RESET;
                GRecLocation.SETRANGE("Magasin central","Code magasin");
                IF GRecLocation.FINDSET THEN BEGIN
                  REPEAT
                    Company.RESET;
                    Company.FINDSET;
                    REPEAT
                      ItemLedgerEntry.CHANGECOMPANY(Company.Name);
                      ItemLedgerEntry.SETRANGE("Item No.","Code article");
                      ItemLedgerEntry.SETRANGE("Entry Type",ItemLedgerEntry."Entry Type"::Sale);
                      ItemLedgerEntry.SETFILTER("Posting Date",'>=%1',CALCDATE('<-1Y>',TODAY));
                      ItemLedgerEntry.SETRANGE("Location Code",GRecLocation.Code);
                      //ItemLedgerEntry.SETRANGE(Positive,FALSE);
                      IF ItemLedgerEntry.FINDSET THEN BEGIN
                        REPEAT
                          GDecConsommationannee+=ItemLedgerEntry.Quantity;
                        UNTIL ItemLedgerEntry.NEXT=0;
                      END;
                    UNTIL Company.NEXT=0;
                  UNTIL GRecLocation.NEXT=0;
                END;
                VALIDATE("Quantité préconisée","Quantité préconisée"-ROUND((GDecConsommationannee/12*2),1));
            end;
        }
        field(4;"Code Casier destination";Code[10])
        {
            TableRelation = Bin.Code WHERE (Location Code=FIELD(Code magasin));

            trigger OnValidate();
            begin
                  IF ("Code magasin" <>'') AND ( "Code article" <>'' ) AND ("Code Casier destination"<>'') THEN BEGIN
                      "Stock casier destination":=CduItemavailability.FctCalcStockTotalparMagParCasier("Code article","Code magasin","Code Casier destination",'');
                  END ELSE
                    "Stock casier destination":=0;
                //FctCalcStockTotalparMagParCasier
            end;
        }
        field(5;"Stock magasin";Decimal)
        {
        }
        field(6;"Stock casier destination";Decimal)
        {
        }
        field(7;"Quantité restante";Decimal)
        {
        }
        field(8;"Quantité reclassement";Decimal)
        {
        }
        field(9;"Quantité reclassée";Decimal)
        {
        }
        field(10;"Quantité préconisée";Decimal)
        {
        }
        field(11;"Line No";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"Promotion No.","Line No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        Articlesenpromotion.RESET;
        Articlesenpromotion.SETRANGE("Promotion No.","Promotion No.");
        IF Articlesenpromotion.FINDLAST THEN
          "Line No":=Articlesenpromotion."Line No"+1
        ELSE
          "Line No":=1;
    end;

    var
        CduItemavailability : Codeunit "70000";
        Articlesenpromotion : Record "50059";
        GDecConsommationannee : Decimal;
        ItemLedgerEntry : Record "32";
        Company : Record "2000000006";
        GRecLocation : Record "14";
}

