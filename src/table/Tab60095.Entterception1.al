table 60095 "Entête réception1"
{
    // version Gestion RDV

    DrillDownPageID = 60395;
    LookupPageID = 60395;

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
            TableRelation = Customer.No.;

            trigger OnValidate();
            begin
                /*
                CLEAR(Customer);
                Customer.GET("Code Client");
                "No. CIN" := Customer."No. CIN" ;
                "No. Téléphone" := Customer."Phone No.";
                //Ligneréception.DELETEALL;
                CLEAR(ItemLedgerEntry);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Entry Type",1);
                ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Document Type",'%1|%2',1,2);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Source Type",1);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Source No.","Code Client");
                ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Serial No.",'<>%1','');
                IF ItemLedgerEntry.FIND('-') THEN
                REPEAT
                 {
                   //<<NM070319
                  ServiceItem.RESET;
                  ServiceItem.SETRANGE("Serial No.","No. chassis");
                  ServiceItem.FINDFIRST;
                 //>>NM070319
                }
                 CLEAR(Ligneréception2);
                 Ligneréception2.SETRANGE(Ligneréception2."No. Réception",Rec."No. Réception");
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
                 Ligneréception."Date mise en route" := ServiceItem."Date Mise en Circulation";
                  //<<NM070319
                  ServiceItem.RESET;
                  ServiceItem.SETRANGE("Serial No.","No. chassis");
                  ServiceItem.FINDFIRST;
                  Ligneréception."No.Matricule" := ServiceItem.Matricule;
                  Ligneréception.Marque:=ServiceItem."Marque VN";
                  //>>NM070319
                
                 //Ligneréception."Accepter Réception" := TRUE;
                 Ligneréception.INSERT;
                UNTIL ItemLedgerEntry.NEXT = 0;
                */
                
                
                CLEAR(Customer);
                Customer.GET("Code Client");
                "No. CIN" := Customer."No. CIN" ;
                "No. Téléphone" := Customer."Phone No.";
                //Ligneréception.DELETEALL;
                CLEAR(ItemLedgerEntry);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Entry Type",1);
                ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Document Type",'%1|%2',1,2);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Source Type",1);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Source No.","Code Client");
                ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Serial No.",'<>%1','');
                IF ItemLedgerEntry.FINDSET THEN
                REPEAT
                
                 CLEAR(Ligneréception2);
                 Ligneréception2.SETRANGE(Ligneréception2."No. Réception",Rec."No. Réception");
                 IF Ligneréception2.FINDLAST THEN
                 Ligneréception."No. Ligne" := Ligneréception2."No. Ligne" + 1
                 ELSE
                
                 Ligneréception."No. Ligne" := 1;
                 Ligneréception."Item Leadger Entry No." := ItemLedgerEntry."Entry No.";
                 Ligneréception."Code Client" := Rec."Code Client";
                 Ligneréception."No. Réception" := Rec."No. Réception";
                 Ligneréception."Date réception" :=Rec."Date réception"  ;
                 Ligneréception."Responsibility Center":=Rec."Responsibility Center";
                 Ligneréception."No. CIN" := Rec."No. CIN"   ;
                 Ligneréception."No. Téléphone" := Customer."Phone No.";
                 Ligneréception."No. chassis"  :=  ItemLedgerEntry."Serial No.";
                 Ligneréception."Nom Client" := Customer.Name;
                 Ligneréception.Adresse := Customer.Address;
                 Ligneréception.Type := Rec.Type;
                 CLEAR(Item);
                 Item.SETRANGE(Item."No.",ItemLedgerEntry."Item No.");
                 IF Item.FIND('-') THEN;
                 Ligneréception.Marque  := Item."Global Dimension 1 Code";
                 //Ligneréception."Type machine" := Item."Product Group Code";
                 Ligneréception."Code article" := Item."No." ;
                 Ligneréception."Désignation article" := Item.Description;
                 Ligneréception.Gouvernerat := Customer."Territory Code";
                 Ligneréception."Date mise en route" := ItemLedgerEntry."Posting Date";
                
                  ServiceItem.RESET;
                  ServiceItem.SETRANGE("Serial No.", Ligneréception."No. chassis");
                  IF ServiceItem.FINDFIRST THEN
                  BEGIN
                  Ligneréception."No.Matricule" := ServiceItem.Matricule;
                  Ligneréception.Marque:=ServiceItem."Marque VN";
                  END;
                
                 //Ligneréception."Accepter Réception" := TRUE;
                 Ligneréception.INSERT(TRUE);
                UNTIL ItemLedgerEntry.NEXT = 0;

            end;
        }
        field(4;"No. CIN";Code[20])
        {
        }
        field(5;"No. Téléphone";Code[50])
        {
        }
        field(6;"No. chassis";Code[50])
        {

            trigger OnValidate();
            begin
                //Ligneréception.DELETEALL;
                CLEAR(ItemLedgerEntry);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Entry Type",1);
                ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Document Type",'%1|%2',1,2);
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Source Type",1);
                ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Serial No.",'%1',"No. chassis");

                IF ItemLedgerEntry.FIND('+') THEN
                REPEAT
                 //<<NM070319
                   ServiceItem.RESET;
                  ServiceItem.SETRANGE("Serial No.","No. chassis");
                  ServiceItem.FINDFIRST;
                 //>>NM070319
                  CLEAR(Customer);
                  Customer.GET(ItemLedgerEntry."Source No.");
                  Rec."Code Client" := Customer."No.";
                  Rec."No. CIN" := Customer."No. CIN" ;
                  Rec."No. Téléphone" := Customer."Phone No.";
                  "No.Matricule":=ServiceItem.Matricule;

                  //MESSAGE('%1',ServiceItem.Matricule);

                 CLEAR(Ligneréception2);
                 Ligneréception2.SETRANGE(Ligneréception2."No. Réception",Rec."No. Réception");
                 IF Ligneréception2.FIND('+') THEN
                 Ligneréception."No. Ligne" := Ligneréception2."No. Ligne" + 1
                 ELSE
                 Ligneréception."No. Ligne" := 1;

                 Ligneréception."Item Leadger Entry No." := ItemLedgerEntry."Entry No.";
                 Ligneréception."Code Client" :=  Customer."No.";
                 Ligneréception."No. Réception" := Rec."No. Réception";
                 Ligneréception."Date réception" :=Rec."Date réception"  ;
                 Ligneréception."No. CIN" := Customer."No. CIN"   ;
                 Ligneréception."No. Téléphone" := Customer."Phone No.";
                 Ligneréception."No. chassis"  :=   Rec."No. chassis";
                 Ligneréception."Responsibility Center":=Rec."Responsibility Center";
                 Ligneréception."Nom Client" := Customer.Name;
                 Ligneréception."No.Matricule" := ServiceItem.Matricule;

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
                   //<<NM070319
                  ServiceItem.RESET;
                  ServiceItem.SETRANGE("Serial No.","No. chassis");
                  IF ServiceItem.FINDFIRST THEN
                  BEGIN
                    Ligneréception."No.Matricule" := ServiceItem.Matricule;
                    Ligneréception.Marque:=ServiceItem."Marque VN";
                 END;
                  //>>NM070319
                 Ligneréception.INSERT;
                UNTIL ItemLedgerEntry.NEXT = 0;
            end;
        }
        field(7;"No. série";Code[20])
        {
        }
        field(8;"Réçu par";Code[50])
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
                Ligneréception.SETFILTER(Ligneréception."No. Réception",'%1',Rec."No. Réception");

                Ligneréception.MODIFYALL("No. Téléphone",Rec."No. Téléphone demandeur");
            end;
        }
        field(11;Type;Option)
        {
            OptionCaption = '" ,Rendez-Vous,Réclamation"';
            OptionMembers = " ","Rendez-Vous","Réclamation";
        }
        field(12;"No.Matricule";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'NM260219';

            trigger OnValidate();
            begin
                //Ligneréception.DELETEALL;
                CLEAR(ServiceItem);
                ServiceItem.SETRANGE(ServiceItem.Matricule,"No.Matricule");
                IF ServiceItem.FIND('-') THEN
                BEGIN
                  CLEAR(Customer);
                  Customer.GET(ServiceItem."Customer No.");
                  Rec."Code Client" := Customer."No.";
                  Rec."No. CIN" := Customer."No. CIN" ;
                  Rec."No. Téléphone" := Customer."Phone No.";
                  Rec."Date RDV" := Ligneréception."Date Intervention confirmée";
                  //<<NM070219
                "No. chassis":=ServiceItem."Serial No.";
                ServiceItem.RESET;
                ServiceItem.SETRANGE("Serial No.","No. chassis");
                ServiceItem.FINDFIRST;
                //>>NM070219
                   CLEAR(Ligneréception2);
                   Ligneréception2.SETRANGE(Ligneréception2."No. Réception",Rec."No. Réception");
                   IF Ligneréception2.FIND('+') THEN
                   Ligneréception."No. Ligne" := Ligneréception2."No. Ligne" + 1
                   ELSE
                   Ligneréception."No. Ligne" := 1;

                CLEAR(ItemLedgerEntry);
                ItemLedgerEntry.SETRANGE("Serial No.",ServiceItem."Serial No.");
                ItemLedgerEntry.SETRANGE("Entry Type",ItemLedgerEntry."Entry Type"::Purchase);
                ItemLedgerEntry.SETRANGE(Positive,TRUE);
                IF ItemLedgerEntry.FIND('-') THEN;
                 Ligneréception."Item Leadger Entry No." := ItemLedgerEntry."Entry No.";
                 Ligneréception."Code Client" :=  Customer."No.";
                 Ligneréception."No. Réception" := Rec."No. Réception";
                 Ligneréception."Responsibility Center":=Rec."Responsibility Center";
                 Ligneréception."Date réception" :=Rec."Date réception"  ;
                 Ligneréception."No. CIN" := Customer."No. CIN"   ;
                 Ligneréception."No. Téléphone" := Customer."Phone No.";
                 Ligneréception."No. chassis"  :=   ServiceItem."Serial No.";
                 Ligneréception."No.Matricule" := ServiceItem.Matricule;
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
                 Ligneréception."Date mise en route" := ServiceItem."Date Mise en Circulation";
                   //<<NM070319
                  ServiceItem.RESET;
                  ServiceItem.SETRANGE("Serial No.","No. chassis");
                  ServiceItem.FINDFIRST;
                 Ligneréception."No.Matricule" := ServiceItem.Matricule;
                 Ligneréception.Marque:=ServiceItem."Marque VN";
                  //>>NM070319
                 Ligneréception."Accepter Réception" := TRUE;
                 Ligneréception.INSERT;
                END;
            end;
        }
        field(13;"Responsibility Center";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'NM140319';
            TableRelation = "Responsibility Center" WHERE (Code=FIELD(Responsibility Center));
        }
        field(14;"Date RDV";Date)
        {
            DataClassification = ToBeClassified;
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
        
        IF  Rec."No. Réception" = '' THEN BEGIN
          ServiceMgtSetup.GET;
          NoSeriesMgt.InitSeries(ServiceMgtSetup."N° Réclamation",xRec."No. série","Date réception",Rec."No. Réception",Rec."No. série");
        END;
        "Date réception"    := WORKDATE;
        "Réçu par"     := USERID;
        "Temp de réception"  := TIME;
        Type := Type::"Rendez-Vous";
        
        //ADD NM140319
         IF UserSetup.GET(USERID) THEN
        "Responsibility Center" := UserSetup."Service Resp. Ctr. Filter";
        //END NM140319
        
        /*
        //ADD NM140319
        Ligneréception1.RESET;
        Ligneréception1.SETRANGE("No. Réception","No. Réception");
        IF Ligneréception1.FINDSET THEN
         Ligneréception1.MODIFYALL(Ligneréception1."Responsibility Center","Responsibility Center");
        //END NM140319
        */

    end;

    var
        NoSeriesMgt : Codeunit "396";
        ServiceMgtSetup : Record "5911";
        Customer : Record "18";
        "Ligneréception" : Record "60096";
        ItemLedgerEntry : Record "32";
        Item : Record "27";
        "Ligneréception2" : Record "60096";
        ServiceItem : Record "5940";
        UserMgt : Codeunit "5700";
        UserSetup : Record "91";
        UserSetupMapping : Record "70098";
        "Ligneréception1" : Record "60096";
        Cust : Record "18";
}

