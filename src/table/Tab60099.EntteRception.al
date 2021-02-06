table 60099 "Entête Réception-"
{
    // version Gestion RDV


    fields
    {
        field(1;"No. Réception";Code[20])
        {
        }
        field(2;"Date réception";Date)
        {
        }
        field(3;"Code Client";Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate();
            begin
                /*
                CLEAR(Customer);
                Customer.GET("Code Client");
                "No. CIN" := Customer."N° CIN" ;
                "No. Téléphone" := Customer."N° tel";
                //Ligneréception.DELETEALL;
                CLEAR(ItemLedgerEntry);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Entry Type",1);
                ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Document Type",'%1|%2',1,2);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Source Type",1);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Source No.","Code Client");
                ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Serial No.",'<>%1','');
                IF ItemLedgerEntry.FIND('-') THEN
                REPEAT
                
                 CLEAR(Ligneréception2);
                 Ligneréception2.SETRANGE(Ligneréception2."No. Réception","No. Réception");
                 IF Ligneréception2.FIND('+') THEN
                 Ligneréception."No. Ligne" := Ligneréception2."No. Ligne" + 1
                 ELSE
                 Ligneréception."No. Ligne" := 1;
                 Ligneréception."Item Leadger Entry No." := ItemLedgerEntry."Entry No.";
                 Ligneréception."Code Client" := "Code Client";
                 Ligneréception."No. Réception" := "No. Réception";
                 Ligneréception."Date réception" :="Date réception"  ;
                 Ligneréception."No. CIN" := "No. CIN"   ;
                 Ligneréception."No. Téléphone" := Customer."Phone No.";
                 Ligneréception."No. chassis"  :=  ItemLedgerEntry."Serial No.";
                 Ligneréception."Nom Client" := Customer.Name;
                 Ligneréception.Adresse := Customer.Address;
                 CLEAR(Item);
                 Item.SETRANGE(Item."No.",ItemLedgerEntry."Item No.");
                 IF Item.FIND('-') THEN;
                 Ligneréception.Marque  := Item."Global Dimension 1 Code";
                 //Ligneréception."Type machine" := Item."Product Group Code";
                 Ligneréception."Code article" := Item."No." ;
                 Ligneréception."Désignation article" := Item.Description;
                 Ligneréception.Gouvernerat := Customer."Territory Code";
                 Ligneréception."Date mise en route" := ItemLedgerEntry."Posting Date";
                 //Ligneréception."Accepter Réception" := TRUE;
                 Ligneréception.INSERT;
                UNTIL ItemLedgerEntry.NEXT = 0;
                */

            end;
        }
        field(4;"No. CIN";Code[20])
        {
        }
        field(5;"No. Téléphone";Code[20])
        {
        }
        field(6;"No. chassis";Code[50])
        {

            trigger OnValidate();
            begin
                //Ligneréception.DELETEALL;
                IF "No. chassis"  <> '' THEN
                BEGIN
                  CLEAR(ItemLedgerEntry);
                  ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Entry Type",1);
                  ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Document Type",'%1|%2',1,2);
                  ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Source Type",1);
                  ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Serial No.",'%1',"No. chassis");
                  IF ItemLedgerEntry.FIND('+') THEN
                  REPEAT
                    CLEAR(Customer);
                    Customer.GET(ItemLedgerEntry."Source No.");
                    "Code Client" := Customer."No.";
                    "No. CIN" := Customer."No. CIN" ;
                    "No. Téléphone" := Customer."Phone No.";


                   CLEAR(Ligneréception2);
                   Ligneréception2.SETRANGE("No. Réception","No. Réception");
                   IF Ligneréception2.FIND('+') THEN
                   Ligneréception."No. Ligne" := Ligneréception2."No. Ligne" + 1
                   ELSE
                   Ligneréception."No. Ligne" := 1;

                   Ligneréception."Item Leadger Entry No." := ItemLedgerEntry."Entry No.";
                   Ligneréception."Code Client" :=  Customer."No.";
                   Ligneréception."No. Réception" := "No. Réception";
                   Ligneréception."Date réception" :="Date réception"  ;
                   Ligneréception."No. CIN" := Customer."No. CIN"   ;
                   Ligneréception."No. Téléphone" := Customer."Phone No.";
                   Ligneréception."No. chassis"  :=   ItemLedgerEntry."Serial No.";
                   Ligneréception."Nom Client" := Customer.Name;
                   Ligneréception.Adresse := Customer.Address;
                   CLEAR(Item);
                   Item.SETRANGE(Item."No.",ItemLedgerEntry."Item No.");
                   IF Item.FIND('-') THEN;
                   Ligneréception.Marque  := Item."Global Dimension 1 Code";
                   //Ligneréception."Type machine" := Item."Product Group Code";
                   Ligneréception."Code article" := Item."No." ;
                   Ligneréception."Désignation article" := Item.Description;
                   Ligneréception.Gouvernerat := Customer."Territory Code";
                   Ligneréception."Date mise en route" := ItemLedgerEntry."Posting Date";
                   Ligneréception."Accepter Réception" := TRUE;
                   Ligneréception.INSERT;
                  UNTIL ItemLedgerEntry.NEXT = 0;
                END;
            end;
        }
        field(7;"No. série";Code[20])
        {
        }
        field(8;"Réçu par";Code[20])
        {
        }
        field(9;"Temp de réception";Time)
        {
        }
        field(10;"No. Téléphone demandeur";Code[20])
        {

            trigger OnValidate();
            begin
                CLEAR(Ligneréception);
                Ligneréception.SETFILTER(Ligneréception."No. Réception",'%1',"No. Réception");

                Ligneréception.MODIFYALL("No. Téléphone","No. Téléphone demandeur");
            end;
        }
    }

    keys
    {
        key(Key1;"No. Réception")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin

        IF  "No. Réception" = '' THEN BEGIN
        ParamètreSAV.GET;
          NoSeriesMgt.InitSeries(ParamètreSAV."Souche Réception Client",xRec."No. série",WORKDATE,"No. Réception","No. série");
        END;
         "Date réception"    := WORKDATE;
          "Réçu par"     := USERID;
          "Temp de réception"  := TIME;
    end;

    var
        NoSeriesMgt : Codeunit "396";
        "ParamètreSAV" : Record "5911";
        Customer : Record "18";
        "Ligneréception" : Record "60098";
        ItemLedgerEntry : Record "32";
        Item : Record "27";
        "Ligneréception2" : Record "60098";
}

