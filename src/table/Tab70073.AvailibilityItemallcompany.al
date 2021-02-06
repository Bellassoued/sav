table 70073 "Availibility Item all company"
{
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
        }
        field(11;"Qty. on Reservations";Decimal)
        {
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
        field(25;Description;Text[80])
        {
            Caption = 'Description';
        }
        field(26;"Stock Disponible";Decimal)
        {
        }
        field(27;"Stock Projeté Disponible";Decimal)
        {
        }
        field(28;"Type Document";Text[50])
        {
        }
        field(29;"No. Document";Code[20])
        {
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

    trigger OnModify();
    begin
        /*
        IF (xRec."Qty à demander" <> "Qty à demander") AND ("Demander pièce") THEN
          BEGIN
            CheckQuanity;
            UpdateAcheminementLines;
          END;
        */

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
              //FindLastAchTransfert.VALIDATE(Quantité,"Qty à demander");
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
            //NewAcheminementtransfert."No. Ligne commande"                := "No. Ligne commande encours";
            //NewAcheminementtransfert.Quantité                            := "Qty à demander";
            NewAcheminementtransfert."Entry No"                          := NoSeq + 1;
            NewAcheminementtransfert.VALIDATE(Order                      ,OrderToCreateDocument);
           // NewAcheminementtransfert.VALIDATE("Sales Order Location code","Sales Order Location Code");
            NewAcheminementtransfert.INSERT;

            //"Entry No. Ach. Trans" := NewAcheminementtransfert."Entry No";
            MODIFY;
          END;
    end;

    local procedure CheckQuanity();
    begin
        AvailibilityItem.RESET;
        //AvailibilityItem.SETRANGE("No. commande encours","No. commande encours");
        AvailibilityItem.SETRANGE("Item No.","Item No.");
        //AvailibilityItem.SETRANGE("No. Ligne commande encours","No. Ligne commande encours");
        AvailibilityItem.SETRANGE("Demander pièce",TRUE);
        AvailibilityItem.SETFILTER("Entry No.",'<>%1',"Entry No.");
        AvailibilityItem.CALCSUMS("Qty à demander");

        SalesLine.RESET;
        //SalesLine.GET(SalesLine."Document Type"::Order,"No. commande encours","No. Ligne commande encours");

        //IF ("Qty à demander" + AvailibilityItem."Qty à demander") > SalesLine."Remaining Qty to Order" THEN
        //  ERROR(TXT50001,SalesLine."Remaining Qty to Order"-AvailibilityItem."Qty à demander","No. commande encours","Item No.");
    end;

    local procedure CheckAcheminementQty();
    begin
        Acheminementtransfert.RESET;
        Acheminementtransfert.SETCURRENTKEY("Entry No",Order);
        Acheminementtransfert.SETRANGE("Item No.","Item No.");
        //Acheminementtransfert.SETRANGE("No. commande vente","No. commande encours");
        Acheminementtransfert.SETRANGE("Magasin source","Location Code");
        Acheminementtransfert.SETFILTER("No. ordre transfer",'<>%1','');
        IF Acheminementtransfert.FINDFIRST THEN
          BEGIN
           // IF (Acheminementtransfert.Quantité+"Qty à demander")>"Qty Ligne commande" THEN
              //ERROR(TXT50001,"Qty Ligne commande"-Acheminementtransfert.Quantité,"No. commande encours","Item No.");

            //IF Acheminementtransfert.Quantité="Qty Ligne commande" THEN
              IF Acheminementtransfert."No. ordre transfer" <> '' THEN
                ERROR(TXT50004);
          END;
    end;

    local procedure UpdateAcheminementLines();
    var
        Acheminementtransfert : Record "70019";
    begin
        //IF "Entry No. Ach. Trans" <> 0 THEN BEGIN
          Acheminementtransfert.RESET;
         // Acheminementtransfert.SETRANGE("Entry No","Entry No. Ach. Trans");
          Acheminementtransfert.FINDSET;
         // Acheminementtransfert.MODIFYALL(Quantité,"Qty à demander");
        //END;
    end;
}

