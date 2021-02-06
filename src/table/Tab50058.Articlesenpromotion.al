table 50058 "Articles en promotion"
{
    // version PROMO

    CaptionML = ENU='Sales Line Discount',
                FRA='Articles en promotion';
    LookupPageID = 7004;

    fields
    {
        field(1;"Code";Code[20])
        {
            CaptionML = ENU='Code',
                        FRA='Code';
            NotBlank = true;
            TableRelation = IF (Type=CONST(Item)) Item
                            ELSE IF (Type=CONST(Item Disc. Group)) "Item Discount Group";

            trigger OnValidate();
            var
                Item : Record "27";
                LDecStockConso : Decimal;
                Company : Record "2000000006";
            begin
                SalesReceivablesSetup.GET;

                "Quantité sur commande achat":=0;
                PurchaseLine.RESET;
                PurchaseLine.SETRANGE("No.",Code);
                IF PurchaseLine.FINDSET THEN BEGIN
                  REPEAT
                    VALIDATE("Quantité sur commande achat","Quantité sur commande achat"+PurchaseLine."Outstanding Quantity");
                    VALIDATE("Prix fob",PurchaseLine."Unit Price (LCY)");
                  UNTIL PurchaseLine.NEXT=0;
                END;
                IF Item.GET(Code) THEN BEGIN
                  Item.CALCFIELDS("Qté Cmd Achat");
                  "Unit of Measure Code" := Item."Sales Unit of Measure";
                  VALIDATE(CMP,Item."Unit Cost");
                  VALIDATE("Prix de vente",Item."Unit Price");
                  //"Quantité sur commande achat":=Item."Qté Cmd Achat";
                END;
                IF xRec.Code <> Code THEN BEGIN
                  "Unit of Measure Code" := '';
                  "Variant Code" := '';

                  IF Type = Type::Item THEN
                    IF Item.GET(Code) THEN BEGIN
                      Item.CALCFIELDS("Qté Cmd Achat");
                      "Unit of Measure Code" := Item."Sales Unit of Measure";
                      //"Quantité sur commande achat":=Item."Qté Cmd Achat";
                    END;
                END;
                VALIDATE("Stock global",CduItemavailability.FctCalcStockDispoByCompanyForAllCentralMag(Code,''));
                //"Stock global":=LDecStockConso;
                //FctCalcStockTotalbyMag
                //"Quantité sur commande achat":=Item."Qté Cmd Achat";
                GDecConsommationannee:=0;
                Company.RESET;
                Company.FINDSET;
                REPEAT
                  ItemLedgerEntry.CHANGECOMPANY(Company.Name);
                  ItemLedgerEntry.SETRANGE("Item No.",Code);
                  ItemLedgerEntry.SETRANGE("Entry Type",ItemLedgerEntry."Entry Type"::Sale);
                  ItemLedgerEntry.SETFILTER("Posting Date",'>=%1',CALCDATE('<-1Y>',TODAY));
                  IF ItemLedgerEntry.FINDSET THEN BEGIN
                    REPEAT
                      GDecConsommationannee+=ItemLedgerEntry.Quantity;
                    UNTIL ItemLedgerEntry.NEXT=0;
                  END;
                UNTIL Company.NEXT=0;
                VALIDATE("Consommation année gliassante","Consommation année gliassante"-(GDecConsommationannee/12*4));
                VALIDATE("Coefficient promotions",SalesReceivablesSetup."Coefficient promotions PR");
            end;
        }
        field(2;"Sales Code";Code[20])
        {
            CaptionML = ENU='Sales Code',
                        FRA='Code vente';
            TableRelation = IF (Sales Type=CONST(Customer Disc. Group)) "Customer Discount Group"
                            ELSE IF (Sales Type=CONST(Customer)) Customer
                            ELSE IF (Sales Type=CONST(Campaign)) Campaign;
            ValidateTableRelation = false;

            trigger OnValidate();
            begin
                IF "Sales Code" <> '' THEN
                  CASE "Sales Type" OF
                    "Sales Type"::"All Customers":
                      ERROR(Text001,FIELDCAPTION("Sales Code"));
                    "Sales Type"::Campaign:
                      BEGIN
                        Campaign.GET("Sales Code");
                        "Starting Date" := Campaign."Starting Date";
                        "Ending Date" := Campaign."Ending Date";
                      END;
                  END;
            end;
        }
        field(3;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            TableRelation = Currency;
        }
        field(4;"Starting Date";Date)
        {
            CaptionML = ENU='Starting Date',
                        FRA='Date début';

            trigger OnValidate();
            begin
                IF ("Starting Date" > "Ending Date") AND ("Ending Date" <> 0D) THEN
                  ERROR(Text000,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"));

                IF CurrFieldNo = 0 THEN
                  EXIT;
                IF "Sales Type" = "Sales Type"::Campaign THEN
                  ERROR(Text003,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"),FIELDCAPTION("Sales Type"),"Sales Type");
            end;
        }
        field(5;"Line Discount %";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Line Discount %',
                        FRA='% remise ligne';
            MaxValue = 100;
            MinValue = 0;
        }
        field(13;"Sales Type";Option)
        {
            CaptionML = ENU='Sales Type',
                        FRA='Type vente';
            OptionCaptionML = ENU='Customer,Customer Disc. Group,All Customers,Campaign',
                              FRA='Client,Groupe remises client,Tous les clients,Campagne';
            OptionMembers = Customer,"Customer Disc. Group","All Customers",Campaign;

            trigger OnValidate();
            begin
                IF "Sales Type" <> xRec."Sales Type" THEN
                  VALIDATE("Sales Code",'');
            end;
        }
        field(14;"Minimum Quantity";Decimal)
        {
            CaptionML = ENU='Minimum Quantity',
                        FRA='Quantité minimum';
            MinValue = 0;
        }
        field(15;"Ending Date";Date)
        {
            CaptionML = ENU='Ending Date',
                        FRA='Date fin';

            trigger OnValidate();
            begin
                VALIDATE("Starting Date");

                IF CurrFieldNo = 0 THEN
                  EXIT;
                IF "Sales Type" = "Sales Type"::Campaign THEN
                  ERROR(Text003,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"),FIELDCAPTION("Sales Type"),"Sales Type");
            end;
        }
        field(21;Type;Option)
        {
            CaptionML = ENU='Type',
                        FRA='Type';
            OptionCaptionML = ENU='Item,Item Disc. Group',
                              FRA='Article,Groupe rem. article';
            OptionMembers = Item,"Item Disc. Group";

            trigger OnValidate();
            begin
                IF xRec.Type <> Type THEN
                  VALIDATE(Code,'');
            end;
        }
        field(5400;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité';
            TableRelation = IF (Type=CONST(Item)) "Item Unit of Measure".Code WHERE (Item No.=FIELD(Code));

            trigger OnValidate();
            begin
                TESTFIELD(Type,Type::Item);
            end;
        }
        field(5700;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
            TableRelation = IF (Type=CONST(Item)) "Item Variant".Code WHERE (Item No.=FIELD(Code));

            trigger OnValidate();
            begin
                TESTFIELD(Type,Type::Item);
            end;
        }
        field(5701;Prmotion;Option)
        {
            OptionCaption = '" ,Promotion"';
            OptionMembers = " ",Promotion;
        }
        field(5702;"Stock suffisant";Boolean)
        {
        }
        field(5703;"Marge rentable";Boolean)
        {
        }
        field(5704;"Prix de vente";Decimal)
        {
        }
        field(5705;CMP;Decimal)
        {

            trigger OnValidate();
            begin
                //CMP:=(CMP*"Stock global"+"Quantité sur commande achat"*"Prix fob"*"Coefficient promotions")/("Stock global"+"Quantité sur commande achat");
            end;
        }
        field(5706;"CMP calculé";Decimal)
        {
            Description = '(CMP*stock + qte cmd ach*prix fob*coeff)/(Stock+qte cmd achat)';
        }
        field(5707;"Prix fob";Decimal)
        {

            trigger OnValidate();
            begin
                //CMP:=(CMP*"Stock global"+"Quantité sur commande achat"*"Prix fob"*"Coefficient promotions")/("Stock global"+"Quantité sur commande achat");
            end;
        }
        field(5708;"Stock global";Decimal)
        {

            trigger OnValidate();
            begin
                //CMP:=(CMP*"Stock global"+"Quantité sur commande achat"*"Prix fob"*"Coefficient promotions")/("Stock global"+"Quantité sur commande achat");
            end;
        }
        field(5709;"Quantité sur commande achat";Decimal)
        {

            trigger OnValidate();
            begin
                //CMP:=(CMP*"Stock global"+"Quantité sur commande achat"*"Prix fob"*"Coefficient promotions")/("Stock global"+"Quantité sur commande achat");
            end;
        }
        field(5710;"%Marge";Decimal)
        {
        }
        field(5711;"Consommation année gliassante";Decimal)
        {

            trigger OnValidate();
            begin
                IF "Consommation année gliassante"<"Stock global"+"Quantité sur commande achat" THEN
                  "Stock suffisant":=TRUE;
            end;
        }
        field(5712;"Valeur Stock";Decimal)
        {
        }
        field(5713;"Valeur qute cmd achat";Decimal)
        {
        }
        field(5714;"Coefficient promotions";Decimal)
        {
        }
        field(5715;Status;Option)
        {
            OptionMembers = " ","Validé","Inséré";
        }
        field(5716;"Promotion No.";Code[10])
        {
        }
        field(5717;"Status manuel";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;Type,"Code","Sales Type","Sales Code","Starting Date","Currency Code","Variant Code","Unit of Measure Code","Minimum Quantity")
        {
        }
        key(Key2;"Sales Type","Sales Code",Type,"Code","Starting Date","Currency Code","Variant Code","Unit of Measure Code","Minimum Quantity")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        //IF "Sales Type" = "Sales Type"::"All Customers" THEN
          //"Sales Code" := ''
        //ELSE
         // TESTFIELD("Sales Code");
        TESTFIELD(Code);
        IF "Stock global"+"Quantité sur commande achat">0 THEN
        "CMP calculé":=(CMP*"Stock global"+"Quantité sur commande achat"*"Prix fob"*"Coefficient promotions")/("Stock global"+"Quantité sur commande achat");
        "%Marge":=("Prix de vente"-"CMP calculé")/"Prix de vente"*100;
        "Marge rentable":=("%Marge">=20);
    end;

    trigger OnRename();
    begin
        //IF "Sales Type" <> "Sales Type"::"All Customers" THEN
         // TESTFIELD("Sales Code");
        TESTFIELD(Code);
    end;

    var
        Text000 : TextConst ENU='%1 cannot be after %2',FRA='%1 ne peut pas être postérieur(e) à %2';
        Text001 : TextConst ENU='%1 must be blank.',FRA='%1 doit être blanc.';
        Campaign : Record "5071";
        Text003 : TextConst ENU='You can only change the %1 and %2 from the Campaign Card when %3 = %4.',FRA='Vous ne pouvez modifier les valeurs %1 et %2 des champs de la fiche campagne que lorsque %3 = %4.';
        SalesReceivablesSetup : Record "311";
        PurchaseLine : Record "39";
        CduItemavailability : Codeunit "70000";
        ItemLedgerEntry : Record "32";
        GDecConsommationannee : Decimal;
}

