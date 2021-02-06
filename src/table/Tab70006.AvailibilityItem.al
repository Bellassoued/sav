table 70006 "Availibility Item"
{
    // version CT16V002

    DrillDownPageID = 70009;
    LookupPageID = 70009;

    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"Line No.";Integer)
        {
            Caption = 'No. Line';
        }
        field(3;"Company Name";Text[250])
        {
            Caption = 'Société';
            TableRelation = Company;
        }
        field(4;"Location Code";Code[20])
        {
            Caption = 'Magazin';
            TableRelation = Location;
        }
        field(5;"Item No.";Code[20])
        {
            Caption = 'No. Article';
            TableRelation = Item;
        }
        field(6;Inventory;Decimal)
        {
            Caption = 'Stock';
        }
        field(7;"Qty. on Purch. Orders";Decimal)
        {
            Caption = 'Qty sur Cmd Achat';
        }
        field(8;"Qty. on Orders";Decimal)
        {
            Caption = 'Qty sur Cmd Vente';
        }
        field(9;"Qty. on Service Orders";Decimal)
        {
            Caption = 'Qty sur Service';
        }
        field(10;"Qty. on Quotes";Decimal)
        {
            CaptionML = ENU='Qty. on Quotes',
                        FRA='Qté sur Devis';
        }
        field(11;"Qty. on Reservations";Decimal)
        {
        }
        field(12;"Bin Code";Code[20])
        {
            Caption = 'Emplacement';
        }
        field(13;Description;Text[80])
        {
            Caption = 'Description';
        }
        field(14;"Base Unit of Measure";Code[10])
        {
            Caption = 'Uniter base de mesure';
        }
        field(15;"Unit Price";Code[10])
        {
            Caption = 'Uniter de vente';
        }
        field(16;"Qty à demander";Decimal)
        {
            Description = 'ADD KK';

            trigger OnValidate();
            begin
                CheckQuanity;
            end;
        }
        field(17;"No. Ligne commande encours";Integer)
        {
            Description = 'ADD KK';
        }
        field(18;"No. commande encours";Code[20])
        {
            Description = 'ADD KK';
        }
        field(19;"Demander pièce";Boolean)
        {
            Description = 'ADD KK';

            trigger OnValidate();
            begin
                //ADD KK 17082016
                IF "Qty à demander" = 0 THEN
                  ERROR(TXT50002);

                IF "Qty à demander" > Inventory THEN
                  ERROR(TXT50000,"Location Code");

                IF "Demander pièce" THEN
                  BEGIN
                    CheckAcheminementQty;

                    IF "Sales Order Location Code" = "Location Code" THEN
                      ERROR(TXT50003,"Location Code","No. commande encours");

                    //  CheckQuanity;

                    Acheminementtransfert.RESET;
                    IF Acheminementtransfert.FINDLAST THEN
                      NoSeq := Acheminementtransfert."Entry No"
                    ELSE
                      NoSeq := 0;

                    OrderToCreateDocument := 0;
                    RecLocation.GET("Location Code");
                    WHILE RecLocation."Magasin central"<>'' DO
                      BEGIN
                        InsertNewAcheminementTransfert("Item No.",RecLocation.Code,RecLocation."Magasin central","No. commande encours");
                        RecLocation.GET(RecLocation."Magasin central");
                        IF RecLocation."Magasin central succursale" THEN BEGIN
                          InsertNewAcheminementTransfert("Item No.",RecLocation.Code,"Sales Order Location Code","No. commande encours");
                        END;
                      END;
                  END
                ELSE
                  BEGIN
                    Acheminementtransfert.RESET;
                    Acheminementtransfert.SETRANGE("Entry No","Entry No. Ach. Trans");
                    IF Acheminementtransfert.FINDSET THEN
                      Acheminementtransfert.DELETEALL;

                    "Entry No. Ach. Trans" := 0;
                    MODIFY;
                  END;
            end;
        }
        field(20;"Entry No. Ach. Trans";Integer)
        {
            Description = 'ADD KK';
        }
        field(21;"Sales Order Location Code";Code[10])
        {
            Description = 'ADD KK';
        }
        field(22;"Qty Ligne commande";Decimal)
        {
            Description = 'ADD KK';
        }
        field(23;"Reserved Qty. on Inventory";Decimal)
        {
            AccessByPermission = TableData 120=R;
            CaptionML = ENU='Reserved Qty. on Inventory',
                        FRA='Quantité réservée sur stock';
            DecimalPlaces = 0:5;
            Description = 'ZM';
            Editable = false;
        }
        field(24;"Reserved Qty. on Purch. Orders";Decimal)
        {
            AccessByPermission = TableData 120=R;
            CaptionML = ENU='Reserved Qty. on Purch. Orders',
                        FRA='Quantité réservée cdes achat';
            DecimalPlaces = 0:5;
            Description = 'ZM';
            Editable = false;
        }
        field(25;"Default Bin";Boolean)
        {
            Caption = 'Emplacement par defaut';
        }
        field(26;"Qty En Transfer";Decimal)
        {
            Caption = 'Qty sur Transfer';
        }
        field(27;"Qty En Transit";Decimal)
        {
            Caption = 'Qty sur Transit';
        }
        field(28;"Stock Disponible";Decimal)
        {
        }
        field(29;"Stock Projeté Dispo.";Decimal)
        {
        }
        field(30;"Qte Reserver";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Qte Possible a demander";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Line No.","Company Name","Item No.","Location Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        DELETEALL;
    end;

    trigger OnModify();
    begin
        IF (xRec."Qty à demander" <> "Qty à demander") AND ("Demander pièce") THEN
          BEGIN
            CheckQuanity;
            UpdateAcheminementLines;
          END;
    end;

    var
        AvailibilityItem : Record "70006";
        TXT50000 : Label 'Magasin %1 n''a pas la quantité demandée !';
        Acheminementtransfert : Record "70019";
        NoSeq : Integer;
        SalesLine : Record "37";
        TXT50001 : Label '"Il vous reste à commander %1 à la commande %2 pour l''article %3 "';
        TXT50002 : Label 'Quantité ligne commande ne peut être 0 !';
        RecLocation : Record "14";
        OrderToCreateDocument : Integer;
        TXT50003 : Label 'Le choix de la magasin %1 doit être différent à celui de la commande %2 !';
        TXT50004 : Label '"l''article %1 est déja demandé ! Veuillez consulter les lignes acheminement transfert "';

    local procedure InsertNewAcheminementTransfert(ItemNo : Code[20];MagSource : Code[10];MagDestination : Code[10];DocNo : Code[20]);
    var
        NewAcheminementtransfert : Record "70019";
        FindLastAchTransfert : Record "70019";
        NextPrimaryKey : Integer;
    begin
        FindLastAchTransfert.RESET;
        IF FindLastAchTransfert.FINDLAST THEN
          NextPrimaryKey := FindLastAchTransfert."Primary Key"
        ELSE
          NextPrimaryKey := 0;

        FindLastAchTransfert.RESET;
        FindLastAchTransfert.SETRANGE("No. commande vente",DocNo);
        FindLastAchTransfert.SETRANGE("Item No.",ItemNo);
        FindLastAchTransfert.SETRANGE("Magasin source",MagSource);
        FindLastAchTransfert.SETRANGE("Magasin destination",MagDestination);
        FindLastAchTransfert.SETFILTER("No. ordre transfer",'%1','');
        IF FindLastAchTransfert.FINDSET THEN
          BEGIN
            REPEAT
              FindLastAchTransfert.VALIDATE(Quantité,"Qty à demander");
              FindLastAchTransfert.MODIFY(TRUE);
            UNTIL FindLastAchTransfert.NEXT=0;
          END
        ELSE
          BEGIN
            OrderToCreateDocument += 1;
            NewAcheminementtransfert.INIT;
            NewAcheminementtransfert."Primary Key"                       := NextPrimaryKey+1;
            NewAcheminementtransfert."Item No."                          := ItemNo;
            NewAcheminementtransfert."Magasin source"                    := MagSource;
            NewAcheminementtransfert."Magasin destination"               := MagDestination;
            NewAcheminementtransfert."No. commande vente"                := DocNo;
            NewAcheminementtransfert."No. Ligne commande"                := "No. Ligne commande encours";
            NewAcheminementtransfert.Quantité                            := "Qty à demander";
            NewAcheminementtransfert."Entry No"                          := NoSeq + 1;
            NewAcheminementtransfert.VALIDATE(Order                      ,OrderToCreateDocument);
            NewAcheminementtransfert.VALIDATE("Sales Order Location code","Sales Order Location Code");
            NewAcheminementtransfert.INSERT;

            "Entry No. Ach. Trans" := NewAcheminementtransfert."Entry No";
            MODIFY;
          END;
    end;

    local procedure CheckQuanity();
    begin
        AvailibilityItem.RESET;
        AvailibilityItem.SETRANGE("No. commande encours","No. commande encours");
        AvailibilityItem.SETRANGE("Item No.","Item No.");
        AvailibilityItem.SETRANGE("No. Ligne commande encours","No. Ligne commande encours");
        AvailibilityItem.SETRANGE("Demander pièce",TRUE);
        AvailibilityItem.SETFILTER("Entry No.",'<>%1',"Entry No.");
        AvailibilityItem.CALCSUMS("Qty à demander");

        SalesLine.RESET;
        SalesLine.GET(SalesLine."Document Type"::Order,"No. commande encours","No. Ligne commande encours");

        IF ("Qty à demander" + AvailibilityItem."Qty à demander") > SalesLine."Remaining Qty to Order" THEN
          ERROR(TXT50001,SalesLine."Remaining Qty to Order"-AvailibilityItem."Qty à demander","No. commande encours","Item No.");
    end;

    local procedure CheckAcheminementQty();
    begin
        Acheminementtransfert.RESET;
        Acheminementtransfert.SETCURRENTKEY("Entry No",Order);
        Acheminementtransfert.SETRANGE("Item No.","Item No.");
        Acheminementtransfert.SETRANGE("No. commande vente","No. commande encours");
        Acheminementtransfert.SETRANGE("Magasin source","Location Code");
        Acheminementtransfert.SETFILTER("No. ordre transfer",'<>%1','');
        IF Acheminementtransfert.FINDFIRST THEN
          BEGIN
            IF (Acheminementtransfert.Quantité+"Qty à demander")>"Qty Ligne commande" THEN
              ERROR(TXT50001,"Qty Ligne commande"-Acheminementtransfert.Quantité,"No. commande encours","Item No.");

            IF Acheminementtransfert.Quantité="Qty Ligne commande" THEN
              IF Acheminementtransfert."No. ordre transfer" <> '' THEN
                ERROR(TXT50004);
          END;
    end;

    local procedure UpdateAcheminementLines();
    var
        Acheminementtransfert : Record "70019";
    begin
        IF "Entry No. Ach. Trans" <> 0 THEN BEGIN
          Acheminementtransfert.RESET;
          Acheminementtransfert.SETRANGE("Entry No","Entry No. Ach. Trans");
          Acheminementtransfert.FINDSET;
          Acheminementtransfert.MODIFYALL(Quantité,"Qty à demander");
        END;
    end;
}

