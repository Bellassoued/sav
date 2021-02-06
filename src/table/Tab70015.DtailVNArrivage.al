table 70015 "Détail VN Arrivage."
{
    // version VN0002

    DrillDownPageID = 70041;
    LookupPageID = 70041;

    fields
    {
        field(1;VIN;Code[20])
        {
        }
        field(2;"No. Expédition";Code[20])
        {
        }
        field(3;CAF;Code[10])
        {
            NotBlank = true;
        }
        field(4;Famille;Code[10])
        {
        }
        field(5;"Code couleur";Code[10])
        {
            TableRelation = "Couleur Article"."Code Couleur";

            trigger OnValidate();
            begin
                //SM VNF001 200217
                RecOption.GET("Code couleur");
                "Description Couleur" := RecOption.GetColorDescription("Code couleur","Code version","Code pers");
                //END SM VNF001 200217
            end;
        }
        field(6;"Garnissage Int.";Code[10])
        {
            TableRelation = "Garnissage Article"."Code Garanissage";
        }
        field(7;"Date production";Text[30])
        {
            CaptionML = ENU='Production',
                        FRA='Production';
        }
        field(8;"Date Emb. prévu";Date)
        {
        }
        field(9;"Date Emb. confirmée";Date)
        {
        }
        field(10;"Date Emb. Estimée";Date)
        {
        }
        field(11;"Customer No.";Code[20])
        {
            Caption = 'No. Client';
            TableRelation = Customer;
        }
        field(12;"Customer Name";Text[50])
        {
            Caption = 'Nom Client';
        }
        field(13;"Sales person code";Code[20])
        {
            Caption = 'Code vendeur';
            TableRelation = Salesperson/Purchaser;

            trigger OnValidate();
            begin
                SalespersonPurchaser.GET("Sales person code");
                "Sales person name" := SalespersonPurchaser.Name;
            end;
        }
        field(14;"Sales person name";Text[50])
        {
            Caption = 'Nom vendeur';
        }
        field(15;"Order date";Date)
        {
            Caption = 'Date commande';
        }
        field(16;"Document type";Option)
        {
            Caption = 'Type Document';
            OptionCaption = '" ,Leasing,Crédit,Comptant"';
            OptionMembers = " ",Leasing,"Crédit",Comptant;
        }
        field(17;"Document status";Option)
        {
            Caption = 'Statut Document';
            OptionCaption = '" ,Complet,Incomplet"';
            OptionMembers = " ",Complet,Incomplet;
        }
        field(18;Observation;Option)
        {
            OptionCaption = '" ,Annulée,Reportée,Commande spéciale,Dérogation"';
            OptionMembers = " ","Annulée","Reportée","Commande spéciale","Dérogation";
        }
        field(19;"Reférence local";Text[250])
        {
        }
        field(20;"Code version";Code[16])
        {
            Caption = 'KATASHIKI';
            TableRelation = "Version Article";
        }
        field(21;"Libelé version";Text[50])
        {
            CalcFormula = Lookup("Version Article".Description WHERE (Code version=FIELD(Code version)));
            Caption = 'Libellé KATASHIKI';
            FieldClass = FlowField;
        }
        field(22;"No. moteur";Code[15])
        {
        }
        field(23;"Code pers";Code[4])
        {
            TableRelation = "Perse Article"."Code Perse";
        }
        field(24;Options;Text[100])
        {
        }
        field(25;"No. proforma";Code[20])
        {
        }
        field(26;"No. lettre de crédit";Code[20])
        {
        }
        field(27;"Préfixe VIN";Code[3])
        {
        }
        field(28;"Radical VIN";Code[6])
        {
        }
        field(29;"Suffixe VIN";Code[8])
        {
        }
        field(30;"Dernière date MAJ";DateTime)
        {
        }
        field(31;"Statut VIN";Option)
        {
            OptionCaption = 'Nouvelle Insertion,Mise à jour,A supprimer,A réserver,Supprimé';
            OptionMembers = "Nouvelle Insertion","Mise à jour","A supprimer","A réserver","Supprimé";
        }
        field(32;"Sales Order No.";Code[20])
        {
            Caption = 'No. commande vente';
            TableRelation = "Sales Header".No. WHERE (Document Type=FILTER(Order),
                                                      Order Type=FILTER(VN));

            trigger OnValidate();
            var
                Vide : Code[10];
            begin
                TESTFIELD("VIN Reserved",FALSE);
                //sm 170119
                TESTFIELD("Date livraison");
                //end sm
                //SM 030319
                UserSetup.GET(USERID);
                IF (xRec."Sales Order No." <> '') AND (xRec."Sales Order No." <> "Sales Order No.") AND (NOT UserSetup."Changer Réservation VN Arr.") THEN
                  ERROR('Vous n avez pas le droit');

                //END SM
                //<<zmn 15012019
                Vide := '';
                VNArrivage.RESET;
                VNArrivage.SETRANGE("Item No.","Item No.");
                VNArrivage.SETRANGE("Code variante","Code variante");
                VNArrivage.SETRANGE("Existe en Stock",FALSE);
                VNArrivage.SETRANGE("Sales Order No.",Vide);
                VNArrivage.SETRANGE(CAF,'<>%1',CAF);
                VNArrivage.SETFILTER("Date livraison",'(<%1)&(<>%2)',"Date livraison",0D);
                VNArrivage.SETRANGE("Réservation DC",FALSE);
                VNArrivage.SETFILTER("Commentaire Kais",'<>PROTOTYPE&<>MOI&<>SAMPLE UNIT&<>HOMOLOGATION');
                IF "Répartiton HT\TTC"="Répartiton HT\TTC"::HT THEN
                 VNArrivage.SETRANGE("Répartiton HT\TTC","Répartiton HT\TTC")
                ELSE
                  VNArrivage.SETFILTER("Répartiton HT\TTC",'%1|%2',"Répartiton HT\TTC",VNArrivage."Répartiton HT\TTC"::" ");
                IF VNArrivage.FINDFIRST THEN
                  IF "Sales Order No."<>'' THEN
                   //IF VNArrivage."Date livraison" < "Date livraison" THEN
                    ERROR('Il ya une autre VIN plus ancien à réserver ! %1',VNArrivage.VIN);
                //>>zmn 15012019
                IF "Sales Order No." = '' THEN
                  BEGIN
                    "Order date" := 0D;
                    "Customer No."   := '';
                    "Customer Name"    := '';
                    "Sales person code"  := '';
                    "Sales person name"   := '';
                    "Sales Order Line No" := 0;
                    "Centre de gestion"   := '';
                    "Code Titre" :=  '';
                  END
                ELSE
                  BEGIN
                    SalesHeader.RESET;
                    SalesHeader.SETRANGE("Document Type",SalesHeader."Document Type"::Order);
                    SalesHeader.SETRANGE("No.","Sales Order No.");
                    IF SalesHeader.FINDFIRST THEN
                      BEGIN
                        SalesLine.RESET;
                        SalesLine.SETRANGE("Document Type",SalesHeader."Document Type");
                        SalesLine.SETRANGE("Document No.",SalesHeader."No.");
                        SalesLine.SETRANGE("No.","Item No.");
                        SalesLine.SETRANGE("Variant Code","Code variante");
                        IF NOT SalesLine.FINDFIRST THEN
                          ERROR(TXT50001,"Item No.",SalesHeader."No.")
                        ELSE
                          BEGIN
                              SalesLine.CALCSUMS(Quantity);
                              //IF "Code variante" <> SalesLine."Variant Code" THEN
                              //  ERROR(TXT50002, "Code variante",SalesLine."Line No.",SalesLine."Document No.");

                              VNArrivage.RESET;
                              VNArrivage.SETRANGE("Sales Order No.","Sales Order No.");
                              VNArrivage.SETRANGE("Item No.",SalesLine."No.");
                              //ADD KK__25092017
                              VNArrivage.SETRANGE("Code variante",SalesLine."Variant Code");

                              IF VNArrivage.COUNT > SalesLine.Quantity THEN
                                ERROR(TXT50003,"Sales Order No.");


                          END;

                        "Order date"     := SalesHeader."Document Date";
                        "Customer No."   := SalesHeader."Sell-to Customer No.";
                        "Customer Name"  := SalesHeader."Sell-to Customer Name";
                        VALIDATE("Sales person code",SalesHeader."Salesperson Code");
                        SalesHeader.CALCFIELDS("Code Titre Client");
                        "Code Titre" := SalesHeader."Code Titre Client";
                        //ADD KK_250917
                        IF SalesHeader."Responsibility Center" = '' THEN ERROR('Veuillez mentionner le centre de gestion pour la commande %1',SalesHeader."No.");
                        "Centre de gestion" := SalesHeader."Responsibility Center";
                        //KT 271017
                        GRecServiceItem.RESET;
                        GRecServiceItem.SETRANGE("Serial No.",VIN);
                        IF GRecServiceItem.FINDFIRST THEN BEGIN
                          GRecServiceItem."Salesperson Code":=SalesHeader."Salesperson Code";
                          GRecServiceItem."Centre de gestion":=SalesHeader."Responsibility Center";
                          GRecServiceItem."Date de réservation":=CURRENTDATETIME;
                          GRecServiceItem.MODIFY;
                        END;
                        //END KT
                      END;
                  END;
                //SM 28102020
                "Date Time Reservation" := CURRENTDATETIME;
                //SM
            end;
        }
        field(33;"Purchase Order No.";Code[20])
        {
            Caption = 'No. commande achat';
        }
        field(34;"Item No.";Code[20])
        {
            Caption = 'No. article';
            Editable = false;
            TableRelation = Item.No. WHERE (Model en cours=CONST(Yes),
                                            Item Tracking Code=FILTER(CHASSIS));
        }
        field(35;"Code variante";Code[20])
        {
            TableRelation = "Item Variant".Code;
        }
        field(36;"VIN Reserved";Boolean)
        {
            CalcFormula = Exist("Reservation Entry" WHERE (Serial No.=FIELD(VIN),
                                                           Reservation Status=CONST(Reservation),
                                                           Item No.=FIELD(Item No.)));
            FieldClass = FlowField;
        }
        field(37;"Purchase Line No.";Integer)
        {
        }
        field(38;"Prix d'achat unitaire";Decimal)
        {
            Description = 'Prix Fob';
            FieldClass = Normal;
        }
        field(39;"No. Line Expédition";Integer)
        {
        }
        field(40;Usine;Text[50])
        {
        }
        field(41;"Port d'embarquament";Text[50])
        {
        }
        field(42;"Date bâteau visé";Date)
        {
        }
        field(43;"Nom du navire";Text[50])
        {
        }
        field(44;Commentaire;Text[250])
        {
        }
        field(45;"Sales Order Line No";Integer)
        {
            TableRelation = "Sales Line"."Line No." WHERE (Document No.=FIELD(Sales Order No.),
                                                           No.=FIELD(Item No.),
                                                           Type=CONST(Item),
                                                           Variant Code=FIELD(Code variante),
                                                           Reserved Quantity=CONST(0));

            trigger OnValidate();
            begin
                TESTFIELD("VIN Reserved",FALSE);
                //SM 150319
                TESTFIELD("Sales Order No.");
                //END SM
                VNArrivage.RESET;
                VNArrivage.SETRANGE("Sales Order No.","Sales Order No.");
                VNArrivage.SETRANGE("Sales Order Line No","Sales Order Line No");
                IF VNArrivage.FINDFIRST THEN
                  ERROR(TXT50009);
            end;
        }
        field(46;"Réservé pour";Code[20])
        {
            CalcFormula = Lookup("Reservation Entry"."Source ID" WHERE (Reservation Status=CONST(Reservation),
                                                                        Positive=CONST(No),
                                                                        Serial No.=FIELD(VIN)));
            FieldClass = FlowField;
        }
        field(47;"E Com prévisionelle";Date)
        {
        }
        field(48;"Article existe";Boolean)
        {
            CalcFormula = Exist(Item WHERE (No.=FIELD(Item No.)));
            Description = 'SM VNF001 040217';
            FieldClass = FlowField;
        }
        field(49;"Centre de gestion";Code[10])
        {
            TableRelation = "Responsibility Center";
        }
        field(70030;"A expédier";Boolean)
        {
        }
        field(70031;"Commentaire..";Boolean)
        {
        }
        field(70033;"Prix Options calculé";Decimal)
        {
            FieldClass = Normal;
        }
        field(70034;"Prix couleur calculé";Decimal)
        {
            CalcFormula = Sum("Prix option/version"."Prix Achat" WHERE (Code=FIELD(Code couleur),
                                                                        Code version=FIELD(Code version)));
            Description = 'FlowField  50039';
            FieldClass = FlowField;
        }
        field(70035;"Prix Garnissage calculé";Decimal)
        {
            CalcFormula = Sum("Prix option/version"."Prix Achat" WHERE (Code=FIELD(Garnissage Int.),
                                                                        Code version=FIELD(Code version)));
            Description = 'FlowField  50039';
            FieldClass = FlowField;
        }
        field(70036;"Mnt Mino Unitaire";Decimal)
        {
            CalcFormula = Sum("Ligne Minoration".Mino-Positionnement WHERE (No. expédition=FIELD(No. Expédition),
                                                                            Code version=FIELD(Code version),
                                                                            Code Pers=FIELD(Code pers)));
            Description = 'FlowField TAB 50082';
            FieldClass = FlowField;
        }
        field(70037;"Mnt Mino Unitaire Animation";Decimal)
        {
            CalcFormula = Sum("Ligne Minoration"."Régularisation (Min-Anim)" WHERE (No. expédition=FIELD(No. Expédition),
                                                                                    Code version=FIELD(Code version),
                                                                                    Code Pers=FIELD(Code pers)));
            Description = 'FlowField TAB 50082';
            FieldClass = FlowField;
        }
        field(70038;"Prix achat Net avec Mino";Decimal)
        {
        }
        field(70039;"Sales Type";Option)
        {
            Caption = 'Type vente';
            OptionCaption = 'Client,Groupe tarifs client,Tous les clients,Campagne';
            OptionMembers = Customer,"Customer Price Group","All Customers",Campaign;
        }
        field(70040;"Sales Code";Code[10])
        {
            Caption = 'Code vente';
            TableRelation = IF (Sales Type=CONST(Customer Price Group)) "Customer Price Group"
                            ELSE IF (Sales Type=CONST(Customer)) Customer
                            ELSE IF (Sales Type=CONST(Campaign)) Campaign;
        }
        field(70041;"Prix de vente";Decimal)
        {
        }
        field(70042;"proforma Créé";Boolean)
        {
            Description = 'RH';
        }
        field(70043;"Expédition Créé";Boolean)
        {
            Description = 'RH';
        }
        field(70044;"Description Version";Text[100])
        {
            CalcFormula = Lookup("Version Article".Description WHERE (Code version=FIELD(Code version)));
            Description = 'SM VNF001 200217';
            FieldClass = FlowField;
        }
        field(70045;"Description Couleur";Text[100])
        {
            Description = 'SM VNF001 200217';
        }
        field(70046;"Description Garnissage";Text[100])
        {
            CalcFormula = Lookup("Garnissage Article".Description WHERE (Code Garanissage=FIELD(Garnissage Int.)));
            Description = 'SM VNF001 200217';
            FieldClass = FlowField;
        }
        field(70047;"Prix achat Net Sans Mino";Decimal)
        {
        }
        field(70048;Commentaire2;Text[250])
        {
            Description = 'SM 260617';
        }
        field(70049;"Date réception dossier";Date)
        {
            CalcFormula = Lookup("Sales Header"."Date Recept Doss" WHERE (No.=FIELD(Réservé pour),
                                                                          Document Type=CONST(Order)));
            FieldClass = FlowField;
        }
        field(70050;TRIM;Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
        field(70051;"ED No.";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
        field(70052;"DS No.";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
            SQLDataType = Integer;
        }
        field(70053;"Unloading port code";Code[5])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
        field(70054;"Unloading port Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
        field(70056;"Line-off";Date)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
        field(70057;"Update time";DateTime)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
        field(70058;"Shipper code";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
        field(70059;"Arrival Date(ETA)";Date)
        {
            CaptionML = ENU='Arrival Date(ETA)',
                        FRA='Date arrivage prévu';
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
        field(70060;"Freight by Unit";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
        field(70061;"Insurance Fee by Unit";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
        field(70062;"Code devise";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 14122018';
        }
        field(70063;"No. commande achat";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 14122018';
        }
        field(70064;"Date livraison";Date)
        {
            DataClassification = ToBeClassified;
            Description = 'KT18122018';

            trigger OnValidate();
            var
                MessageText : Text;
                LRecRecordLink : Record "2000000068";
                LIntRecordLinkID : Integer;
            begin
                /*UserSetup.RESET;
                UserSetup.SETRANGE(Admin_Vente_VN,TRUE);
                UserSetup.SETRANGE("User ID",'BSB\SBS_KAIS');
                IF UserSetup.FINDSET THEN
                  REPEAT
                    RecordLink.INIT;
                    RecordLink.Company:=COMPANYNAME;
                    //MESSAGE
                    RecordLink.URL1:=GETURL(ClientTypeManagement.GetCurrentClientType,COMPANYNAME,OBJECTTYPE::Page,PAGE::"VN Arrivage ADV2");// +
                  //STRSUBSTNO('&filter="Détail VN Arrivage.".Field3:%1',CAF);
                    RecordLink.Description:='La date de livraison de cette ligne est changée de '+FORMAT(xRec."Date livraison")+' à ' + FORMAT("Date livraison");
                    //RecordLink.URL1:='dynamicsnav://srv-azure-nav.bsb.intra:7046/dynamicsnav110/BSB TOYOTA/'+
                    //'runpage?page=70280&personalization=mode=View';
                    RecordLink."User ID":=USERID;
                    RecordLink.Created:=CURRENTDATETIME;
                    RecordLink.Notify:=TRUE;
                    RecordLink."To User ID":=UserSetup."User ID";
                    RecordLink.INSERT;
                UNTIL UserSetup.NEXT=0;*/
                
                
                UserSetup.RESET;
                UserSetup.SETRANGE(Admin_Vente_VN,TRUE);
                //UserSetup.SETRANGE("User ID",'BSB\SBS_KAIS');
                IF "Date livraison"<>xRec."Date livraison" THEN
                  IF UserSetup.FINDSET THEN
                    REPEAT
                    LIntRecordLinkID:=1;
                LRecRecordLink.RESET;
                IF LRecRecordLink.FINDLAST THEN
                  LIntRecordLinkID+=LRecRecordLink."Link ID";
                      RecordLink.INIT;
                      RecordLink.SETCURRENTKEY("Link ID");
                      RecordLink.Company:=COMPANYNAME;
                      RecordLink."Link ID":=LIntRecordLinkID;
                      //MESSAGE
                      RecordLink.URL1:=GETURL(ClientTypeManagement.GetCurrentClientType,COMPANYNAME,OBJECTTYPE::Page,PAGE::"VN Arrivage ADV2",Rec);// +
                    //STRSUBSTNO('&filter="Détail VN Arrivage.".Field3:%1',CAF);
                    IF "Sales Order No."<>'' THEN
                      RecordLink.Description:='Ligne ' + CAF+' Réservée sur commande '+ FORMAT("Sales Order No.")+ ', Date changée de '+FORMAT(xRec."Date livraison")+' à ' + FORMAT("Date livraison")
                      ELSE
                      RecordLink.Description:='Ligne ' + CAF+' Non réservée, date changée de '+FORMAT(xRec."Date livraison")+' à ' + FORMAT("Date livraison");
                      //RecordLink.URL1:='dynamicsnav://srv-azure-nav.bsb.intra:7046/dynamicsnav110/BSB TOYOTA/'+
                      //'runpage?page=70280&personalization=mode=View';
                      RecordLink."User ID":=USERID;
                      RecordLink.Created:=CURRENTDATETIME;
                      RecordLink.Notify:=TRUE;
                      RecordLink."To User ID":=UserSetup."User ID";
                
                      RecordLink.INSERT;
                    UNTIL UserSetup.NEXT=0;

            end;
        }
        field(70065;URN;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'KT06022019';
        }
        field(70066;"Créer projet expédition";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 11032019';
        }
        field(70067;"Commande existe";Boolean)
        {
            CalcFormula = Exist("Sales Line" WHERE (Document No.=FIELD(Sales Order No.),
                                                    Line No.=FIELD(Sales Order Line No)));
            FieldClass = FlowField;
        }
        field(80050;Finition;Text[100])
        {
            CalcFormula = Lookup(Item."Description Perse" WHERE (No.=FIELD(Item No.)));
            Description = 'SM 020817';
            FieldClass = FlowField;
        }
        field(80051;Koper;Text[50])
        {
            Description = 'SM 210817';
        }
        field(80052;Vide;Text[30])
        {
            Description = 'SM 210817';
        }
        field(80053;MINO1;Decimal)
        {
            Description = 'SM 210817';
        }
        field(80054;CODEFAUST1;Code[10])
        {
            Description = 'SM 210817';
        }
        field(80055;MINO2;Decimal)
        {
            Description = 'SM 210817';
        }
        field(80056;CODEFAUST2;Code[10])
        {
            Description = 'SM 210817';
        }
        field(80057;MINO3;Decimal)
        {
            Description = 'SM 210817';
        }
        field(80058;CODEFAUST3;Code[50])
        {
            Description = 'SM 210817';
        }
        field(80059;"Dossier complet";Boolean)
        {
            CalcFormula = Lookup("Sales Header"."Dossier complet" WHERE (No.=FIELD(Réservé pour),
                                                                         Document Type=CONST(Order)));
            Caption = 'Dossier complet';
            FieldClass = FlowField;
        }
        field(80060;"Dossier Validé";Boolean)
        {
            CalcFormula = Lookup("Sales Header"."Dossier Validé" WHERE (No.=FIELD(Réservé pour),
                                                                        Document Type=CONST(Order)));
            Description = 'SM 060917';
            FieldClass = FlowField;
        }
        field(80061;Justificatif;Boolean)
        {
            CalcFormula = Lookup("Sales Header".Justificatif WHERE (No.=FIELD(Réservé pour),
                                                                    Document Type=CONST(Order)));
            Description = 'SM 060917';
            FieldClass = FlowField;
        }
        field(80062;"Date Création Commande";DateTime)
        {
            CalcFormula = Lookup("Sales Header"."Date Time creation" WHERE (No.=FIELD(Réservé pour),
                                                                            Document Type=CONST(Order)));
            Description = 'SM 060917';
            FieldClass = FlowField;
        }
        field(80063;Description;Text[100])
        {
            CalcFormula = Lookup(Item.Description WHERE (No.=FIELD(Item No.)));
            Description = 'SM 210917';
            FieldClass = FlowField;
        }
        field(80064;"Commentaire Kais";Text[250])
        {
            Caption = 'Commentaire appro.';
            Description = 'SM 270917';
        }
        field(80065;"Existe en Stock";Boolean)
        {
            CalcFormula = Exist("Item Ledger Entry" WHERE (Serial No.=FIELD(VIN),
                                                           Item No.=FIELD(Item No.)));
            Description = 'SM270917';
            FieldClass = FlowField;
        }
        field(80066;"Lettre de Crédit Nav";Code[50])
        {
            CalcFormula = Lookup("Ligne Expéd. VN /Provenance"."No. L.C" WHERE (No. Expédition=FIELD(No. Expédition),
                                                                                Code Article=FIELD(Item No.)));
            Description = 'SM 01102017';
            FieldClass = FlowField;
        }
        field(80067;"Code Titre";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SM 030119';
        }
        field(80068;"Répartiton HT\TTC";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'SM 040119';
            OptionMembers = " ",HT,TTC;

            trigger OnValidate();
            begin
                //SM 05012019
                RecGUserSetup.GET(USERID);
                IF "Commentaire Kais"<>'MOI' THEN
                IF NOT RecGUserSetup.Admin_Vente_VN  THEN
                  ERROR('Vous n avez pas le droit de modifier');
                RecGUserSetup.GET(USERID);
                IF "Commentaire Kais"<>'MOI' THEN
                IF USERID<>'BSB\THORAYA_ABBAS'  THEN
                  IF NOT RecGUserSetup.Admin_Vente_VN  THEN
                    ERROR('Vous n avez pas le droit de modifier');
                //END SM
            end;
        }
        field(80069;"Réservation DC";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SM 070119';

            trigger OnValidate();
            begin
                //SM 05012019
                RecGUserSetup.GET(USERID);
                IF NOT RecGUserSetup."Direction Commercial"  THEN
                  ERROR('Vous n avez pas le droit de modifier');
                //END SM
            end;
        }
        field(80070;"Commentaire DC";Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SM 110119';

            trigger OnValidate();
            begin
                //SM 05012019
                RecGUserSetup.GET(USERID);
                IF NOT RecGUserSetup."Direction Commercial"  THEN
                  ERROR('Vous n avez pas le droit de modifier');
                //END SM
            end;
        }
        field(80071;"EXiste en Stock non vendue";Boolean)
        {
            CalcFormula = Exist("Item Ledger Entry" WHERE (Serial No.=FIELD(VIN),
                                                           Item No.=FIELD(Item No.),
                                                           Open=FILTER(Yes)));
            FieldClass = FlowField;
        }
        field(80072;"Date modifiée manuellement";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 08042019';
        }
        field(80073;"No. dossier ouverture";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80074;"Frais App. ouverture";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80075;"En Stock";Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE (Serial No.=FIELD(VIN),
                                                                  Item No.=FIELD(Item No.)));
            Description = 'KT 02072019';
            FieldClass = FlowField;
        }
        field(80076;"DS No.Num";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'SM 191119';
        }
        field(80077;Emplacement;Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 16062020';
        }
        field(80078;"Date Time Reservation";DateTime)
        {
            Caption = 'Date Heure Réservation';
            DataClassification = ToBeClassified;
            Description = 'SM28102020';
        }
    }

    keys
    {
        key(Key1;CAF)
        {
        }
        key(Key2;"Date production",CAF)
        {
        }
        key(Key3;"Date livraison")
        {
        }
        key(Key4;VIN)
        {
        }
        key(Key5;URN)
        {
        }
        key(Key6;"No. commande achat","DS No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;VIN)
        {
        }
    }

    trigger OnModify();
    begin
        /* TMP
        IF "VIN Reserved" THEN
          ERROR(TXT50006);
        */
        
        
        //END SM VNF001 200217
        IF xRec."Répartiton HT\TTC" = Rec."Répartiton HT\TTC" THEN BEGIN//SM ADD 05012019
          IF (("Sales Order No." <> xRec."Sales Order No.") AND ("Sales Order No." <>'')) OR
              (("Sales Order Line No" <> xRec."Sales Order Line No") AND ("Sales Order No." <>'')) THEN
                  TESTFIELD("Sales Order Line No");
          IF SalesHeader.GET(SalesHeader."Document Type"::Order,"Sales Order No.") THEN
           SalesHeader.VALIDATE("Date Confirmation Client");
        END;
        

    end;

    var
        SalesHeader : Record "36";
        SalesLine : Record "37";
        SalespersonPurchaser : Record "13";
        VNArrivage : Record "70015";
        TXT50000 : Label 'Le chassis %1 de la commande %2 est déja affecté';
        TrackingSpecification : Record "336";
        TXT50001 : Label '"Le modèle %1 ne figure pas dans les lignes de la commande %2 "';
        TXT50002 : Label '"Code variante %1 est différent de celui de la ligne %2  de la commande %3  "';
        TXT50003 : Label 'Vous avez réservé la totalité des quantités de la commande %1';
        ReservationEntry : Record "337";
        NoSeq : Integer;
        RecGReservationEntry2 : Record "337";
        newSequenceNo : Integer;
        TXT50004 : Label 'erreur d''insertion dans la table Ecritures réservation: Commande Vente numéro %1 / Modèle vehicule %2 / Code variante %3';
        TXT50005 : Label 'Aucun VIN à réserver !';
        TXT50006 : Label '"Vous ne pouvez pas modifier une ligne d''un VIN réservé ! "';
        TXT50007 : Label 'Voulez-vous réserver les véhicules en stock ou sur les commandes achats ?';
        TXT50008 : Label 'Réservation s''est terminée avec succès';
        TXT50009 : Label 'La combinaison numéro commande %1 et numéro ligne %1 existe déja !';
        TXT50010 : Label 'Le VIN %1 n''existe pas dans stock ni dans une commande achat VN !';
        RecOption : Record "50041";
        GRecServiceItem : Record "5940";
        RecGUserSetup : Record "91";
        NotificationEntry : Record "1511";
        NoteAdd : Notification;
        RecordLink : Record "2000000068";
        UserSetup : Record "91";
        ClientTypeManagement : Codeunit "4";

    procedure "ReservationVéhiculeStock"(DetailVNArrivage : Record "70015");
    var
        RecSalesHeader : Record "36";
        RecSalesLine : Record "37";
        NumEntree : Integer;
        TempReservationEntry : Record "337";
        ItemLedgerEntry : Record "32";
        VNArrivageReserved : Record "70015";
        RecPurchaseLigne : Record "39";
        MgtAures : Codeunit "70003";
        InventoryOrPurchLine : Boolean;
    begin
        //OLD SM 060917IF CONFIRM(TXT50007) THEN BEGIN
        IF TRUE THEN BEGIN
        
          DetailVNArrivage.SETRANGE("VIN Reserved",FALSE);
          DetailVNArrivage.SETFILTER("Sales Order No.",'<>%1','');
          IF DetailVNArrivage.FINDFIRST THEN
            REPEAT
              //SM 041017DetailVNArrivage.TESTFIELD(VIN);
              InventoryOrPurchLine := FALSE;
              IF RecSalesHeader.GET(RecSalesHeader."Document Type"::Order,DetailVNArrivage."Sales Order No.") AND (DetailVNArrivage.VIN <> '')THEN BEGIN
                RecSalesHeader.TESTFIELD("Location Code");
                ItemLedgerEntry.RESET;
                ItemLedgerEntry.SETRANGE(Open,TRUE);
                ItemLedgerEntry.SETRANGE("Serial No.",DetailVNArrivage.VIN);
                ItemLedgerEntry.SETRANGE("Location Code",RecSalesHeader."Location Code");
                ItemLedgerEntry.SETRANGE("Item No.",DetailVNArrivage."Item No.");
                ItemLedgerEntry.SETRANGE("Variant Code",DetailVNArrivage."Code variante");
                IF ItemLedgerEntry.FINDFIRST THEN
                  BEGIN
                    InventoryOrPurchLine := TRUE;
                    CLEAR(RecSalesLine);
                    RecSalesLine.SETRANGE("Document Type",RecSalesLine."Document Type"::Order);
                    RecSalesLine.SETRANGE("Document No.",DetailVNArrivage."Sales Order No.");
                    RecSalesLine.SETRANGE(Type,RecSalesLine.Type::Item);
                    RecSalesLine.SETRANGE("No.",DetailVNArrivage."Item No.");
                    RecSalesLine.SETRANGE("Variant Code",DetailVNArrivage."Code variante");
                    //SM 260817
                    RecSalesLine.SETRANGE("Line No.",DetailVNArrivage."Sales Order Line No");
                    //END SM 260817
                    IF RecSalesLine.FINDFIRST THEN
                      BEGIN
                        IF ReservationEntry.FINDLAST THEN
                          NoSeq:= ReservationEntry."Entry No." + 1
                        ELSE NoSeq := 1 ;
        
                        RecGReservationEntry2.RESET;
                        RecGReservationEntry2.SETRANGE(RecGReservationEntry2."Item No.",RecSalesLine."No.");
                        RecGReservationEntry2.SETRANGE(RecGReservationEntry2."Variant Code",RecSalesLine."Variant Code");
                        RecGReservationEntry2.SETRANGE(RecGReservationEntry2."Source ID",RecSalesLine."Document No.");
                        //SM 260817
                        RecGReservationEntry2.SETRANGE("Source Ref. No.",DetailVNArrivage."Sales Order Line No");
                        //END SM
                        RecGReservationEntry2.SETRANGE(RecGReservationEntry2."Reservation Status",RecGReservationEntry2."Reservation Status"::Reservation);
                        RecGReservationEntry2.SETFILTER(RecGReservationEntry2."Serial No.",'%1','');
                        RecGReservationEntry2.SETRANGE(Positive, TRUE);
                        IF RecGReservationEntry2.FINDFIRST THEN
                          BEGIN
                            REPEAT
                              IF RecGReservationEntry2.Quantity = 1 THEN
                                BEGIN
                                  RecGReservationEntry2."Serial No." := DetailVNArrivage.VIN;
                                  RecGReservationEntry2.MODIFY;
                                END ELSE
                                  BEGIN
                                    NumEntree := RecGReservationEntry2."Entry No." ;
                                    SplitReservationentries(NumEntree,TempReservationEntry.Quantity);
        
                                    TempReservationEntry.GET(NumEntree,TRUE);
                                    TempReservationEntry."Serial No." := DetailVNArrivage.VIN;
                                    TempReservationEntry.MODIFY;
                                  END;
                            UNTIL RecGReservationEntry2.NEXT = 0 ;
                          END ELSE
                            BEGIN
                                RecGReservationEntry2.RESET;
                                RecGReservationEntry2.SETRANGE(RecGReservationEntry2."Item No.",DetailVNArrivage."Item No.");
                                RecGReservationEntry2.SETRANGE(RecGReservationEntry2."Variant Code",DetailVNArrivage."Code variante");
                                RecGReservationEntry2.SETRANGE(RecGReservationEntry2."Source ID",DetailVNArrivage."Sales Order No.");
                                //SM 260817
                                RecGReservationEntry2.SETRANGE("Source Ref. No.",DetailVNArrivage."Sales Order Line No");
                                //END SM
                                IF RecGReservationEntry2.COUNT < RecSalesLine.Quantity THEN
                                  BEGIN
                                   // ajout du code d'insertion
                                   RecGReservationEntry2.INIT;
                                   RecGReservationEntry2."Entry No." := NoSeq;
                                   RecGReservationEntry2."Item No." := RecSalesLine."No.";
                                   RecGReservationEntry2."Location Code" :=  RecSalesLine."Location Code";
                                   RecGReservationEntry2."Variant Code" := RecSalesLine."Variant Code" ;
                                   RecGReservationEntry2."Serial No." := DetailVNArrivage.VIN;
                                   RecGReservationEntry2."Quantity (Base)" := -1;
                                   RecGReservationEntry2."Creation Date":=TODAY();
                                   RecGReservationEntry2."Source Type":=37;
                                   RecGReservationEntry2."Source Subtype":=1;
                                   RecGReservationEntry2."Source ID":=DetailVNArrivage."Sales Order No.";
                                   //SM 260817
                                   RecGReservationEntry2."Source Ref. No." := DetailVNArrivage."Sales Order Line No";
                                   //END SM
                                   RecGReservationEntry2."Created By":=USERID;
                                   RecGReservationEntry2."Qty. per Unit of Measure":= RecSalesLine."Qty. per Unit of Measure";
                                   RecGReservationEntry2."Item Tracking":=RecGReservationEntry2."Item Tracking"::"Serial No.";
                                   RecGReservationEntry2."Source Ref. No.":=RecSalesLine."Line No." ;
                                   RecGReservationEntry2."Reservation Status":=RecGReservationEntry2."Reservation Status"::Reservation;
                                   RecGReservationEntry2.Quantity:=-1;
                                   RecGReservationEntry2.Positive:=FALSE;
                                   RecGReservationEntry2."Qty. to Handle (Base)":=-1;
                                   RecGReservationEntry2."Qty. to Invoice (Base)":=-1;
                                   IF NOT  RecGReservationEntry2.INSERT THEN ERROR(TXT50004,RecSalesLine."Document No.",DetailVNArrivage."Item No."
                                   ,DetailVNArrivage."Code variante") ;
        
                                   RecGReservationEntry2.INIT;
                                   RecGReservationEntry2."Entry No." := NoSeq;
                                   RecGReservationEntry2."Item No." := RecSalesLine."No.";
                                   RecGReservationEntry2."Location Code" :=  RecSalesLine."Location Code";
                                   RecGReservationEntry2."Variant Code" := RecSalesLine."Variant Code" ;
                                   RecGReservationEntry2."Serial No." := DetailVNArrivage.VIN;
                                   RecGReservationEntry2."Quantity (Base)" := 1;
                                   RecGReservationEntry2."Creation Date":=TODAY();
                                   RecGReservationEntry2."Source Type":=32;
                                   RecGReservationEntry2."Source Subtype":=0;
                                   RecGReservationEntry2."Source ID":='';
                                   RecGReservationEntry2."Created By":=USERID;
                                   RecGReservationEntry2."Qty. per Unit of Measure":= RecSalesLine."Qty. per Unit of Measure";
                                   RecGReservationEntry2."Item Tracking":=RecGReservationEntry2."Item Tracking"::"Serial No.";
                                   RecGReservationEntry2."Source Ref. No.":=ItemLedgerEntry."Entry No." ;
                                   RecGReservationEntry2."Reservation Status":=RecGReservationEntry2."Reservation Status"::Reservation; // à vérifier
                                   RecGReservationEntry2.Quantity:=1;
                                   RecGReservationEntry2.Positive:=TRUE; // à vérifier
                                   RecGReservationEntry2."Qty. to Handle (Base)":=1;
                                   RecGReservationEntry2."Qty. to Invoice (Base)":=1;
                                   // RecGReservationEntry2."Expected Receipt Date":=
                                   IF NOT  RecGReservationEntry2.INSERT THEN ERROR(TXT50004,RecSalesLine."Document No.",DetailVNArrivage."Item No."
                                   ,DetailVNArrivage."Code variante") ;
                                   VNArrivageReserved.GET(DetailVNArrivage.CAF);
                                   VNArrivageReserved."VIN Reserved" := TRUE;
                                   VNArrivageReserved."Statut VIN" := VNArrivageReserved."Statut VIN"::"A supprimer";
                                   VNArrivageReserved."Sales Order Line No" := 0;
                                   VNArrivageReserved."Sales Order No." := '';
                                   VNArrivageReserved."Order date" := 0D;
                                   VNArrivageReserved."Customer No."   := '';
                                   VNArrivageReserved."Customer Name"    := '';
                                   VNArrivageReserved."Sales person code"  := '';
                                   VNArrivageReserved."Sales person name"   := '';
                                   VNArrivageReserved.MODIFY;
                                 END //SM TMP ELSE
                                   //SM TMPERROR('écriture existe !! ');
                             END;
                      END;
                  END
                  ELSE
                    BEGIN
                      /*SM TMP 260817
                      RecPurchaseLigne.RESET;
                      RecPurchaseLigne.SETRANGE(CAF,DetailVNArrivage.CAF);
                      IF RecPurchaseLigne.FINDFIRST THEN BEGIN
                        InventoryOrPurchLine := TRUE;
                        CheckTrackingOnPurchaseLine(DetailVNArrivage);
                        ReservationOnPurchaseLine(DetailVNArrivage);
                        VNArrivageReserved.GET(DetailVNArrivage.CAF);
                        VNArrivageReserved."VIN Reserved" := TRUE;
                        VNArrivageReserved."Statut VIN" := VNArrivageReserved."Statut VIN"::"A supprimer";
                        VNArrivageReserved.MODIFY;
                      END;*/
                    END;
                  //SM TMP IF NOT InventoryOrPurchLine THEN
                    //SM TMP MESSAGE(TXT50010);
                   END;
              UNTIL DetailVNArrivage.NEXT=0
            ELSE
              MESSAGE(TXT50005);
        
        END;
        
        MESSAGE(TXT50008);

    end;

    local procedure SplitReservationentries(EntryNo : Integer;SplitQty : Decimal);
    var
        TmpReservationEntry : Record "337";
        TmpReservationentry2 : Record "337";
        TmpResEntry : Record "337";
        TmpResEntry2 : Record "337";
        NoOFSplit : Integer;
    begin
        CLEAR(TmpReservationEntry);
        IF TmpReservationEntry.GET(EntryNo,FALSE) THEN
          BEGIN
            TmpReservationEntry.Quantity := -1 ;
            TmpReservationEntry.Quantity := -1 ;
            TmpReservationEntry."Quantity (Base)" := -1;
            TmpReservationEntry.Quantity:=-1;
            TmpReservationEntry."Qty. to Handle (Base)":=-1;
            TmpReservationEntry."Qty. to Invoice (Base)":=-1;
            TmpReservationEntry.MODIFY;
          END;

        CLEAR(TmpReservationentry2);
        IF TmpReservationentry2.GET(EntryNo,TRUE) THEN
          BEGIN
            TmpReservationentry2.Quantity := 1 ;
            TmpReservationentry2."Quantity (Base)" := 1;
            TmpReservationentry2.Quantity:=1;
            TmpReservationentry2."Qty. to Handle (Base)":=1;
            TmpReservationentry2."Qty. to Invoice (Base)":=1;
            TmpReservationentry2.MODIFY;
          END;

        TmpResEntry.COPY(TmpReservationEntry);
        TmpResEntry2.COPY(TmpReservationentry2);

        FOR NoOFSplit := 1 TO SplitQty - 1   DO
          BEGIN

            CLEAR(TmpReservationEntry);
            TmpReservationEntry.INIT;
            TmpReservationEntry.TRANSFERFIELDS(TmpResEntry);
            TmpReservationEntry."Entry No." := NoSeq ;
            IF ReservationEntry.INSERT THEN newSequenceNo := TmpReservationEntry."Entry No.";

            CLEAR(TmpReservationentry2);
            TmpReservationentry2.INIT;
            TmpReservationentry2.TRANSFERFIELDS(TmpResEntry2);
            TmpReservationentry2."Entry No." := newSequenceNo ;
            RecGReservationEntry2.INSERT ;

            NoSeq += 1 ;
          END;
    end;

    procedure CheckPersExist(ItemPers : Code[4]);
    var
        PerseArticle : Record "50034";
    begin
        IF NOT(PerseArticle.GET(ItemPers)) THEN
          BEGIN
            PerseArticle.INIT;
            PerseArticle."Code Perse" := ItemPers ;
            PerseArticle.INSERT;
          END;
    end;

    procedure CheckColorExist(ItemColor : Code[10]);
    var
        CouleurArticle : Record "50035";
        LigneOption : Record "50038";
        Option : Record "50041";
    begin
        IF NOT CouleurArticle.GET(ItemColor) THEN BEGIN
          CouleurArticle.INIT;
          CouleurArticle."Code Couleur" := ItemColor;
          CouleurArticle.INSERT;
        END;
        IF NOT Option.GET(ItemColor) THEN BEGIN
          Option.INIT;
          Option."Code Option" := ItemColor;
          Option.INSERT;
        END;
        IF NOT LigneOption.GET(ItemColor,ItemColor,LigneOption."Option Type"::Couleur) THEN BEGIN
          LigneOption.INIT;
          LigneOption.Code := ItemColor;
          LigneOption."Internal Code" := ItemColor;
          LigneOption."Option Type" := LigneOption."Option Type"::Couleur;
          LigneOption.INSERT;
        END;
    end;

    procedure CheckGarnisExist(ItemGarnissage : Code[10]);
    var
        GarnissageArticle : Record "50036";
        LigneOption : Record "50038";
        Option : Record "50041";
    begin
        IF NOT GarnissageArticle.GET(ItemGarnissage) THEN BEGIN
            GarnissageArticle.INIT;
            GarnissageArticle."Code Garanissage" := ItemGarnissage;
            GarnissageArticle.INSERT;

        END;
        IF NOT Option.GET(ItemGarnissage) THEN BEGIN
          Option.INIT;
          Option."Code Option" := ItemGarnissage;
          Option.INSERT;
        END;
        IF NOT LigneOption.GET(ItemGarnissage,ItemGarnissage,LigneOption."Option Type"::Garnissage) THEN BEGIN
          LigneOption.INIT;
          LigneOption.Code := ItemGarnissage;
          LigneOption."Internal Code" := ItemGarnissage;
          LigneOption."Option Type" := LigneOption."Option Type"::Garnissage;
          LigneOption.INSERT;
        END;
    end;

    procedure CheckVersionExist(ItemVersion : Code[16];DescriptionVersion : Text);
    var
        VersionArticle : Record "50033";
    begin
        IF NOT (VersionArticle.GET(ItemVersion)) THEN
          BEGIN
            VersionArticle.INIT;
            VersionArticle."Code version" := ItemVersion;
            VersionArticle.Description := DescriptionVersion;
            VersionArticle.INSERT;
          END;
    end;

    procedure CreateVNPurhaseOrder(VINToBuy : Record "70015");
    var
        PurchaseHeader : Record "38";
        PurchaseLine : Record "39";
        RecPurchaseLine : Record "39";
        SalesReceivablesSetup : Record "312";
        NextLineNo : Integer;
        "DétailVNArrivage" : Record "70015";
    begin
    end;

    local procedure ReservationOnPurchaseLine(VNArrivage : Record "70015");
    var
        ReservationEntry : Record "337";
        SalesReservationLine : Record "337";
        SalesHeader : Record "36";
        SalesLine : Record "37";
    begin
        VNArrivage.TESTFIELD("Date Emb. confirmée");
        VNArrivage.TESTFIELD("Sales Order Line No");

        ReservationEntry.RESET;
        ReservationEntry.SETRANGE(Positive,TRUE);
        ReservationEntry.SETRANGE("Reservation Status",ReservationEntry."Reservation Status"::Surplus);
        ReservationEntry.SETRANGE("Serial No.",VNArrivage.VIN);
        ReservationEntry.FINDFIRST;

        ReservationEntry."Reservation Status" := ReservationEntry."Reservation Status"::Reservation;
        ReservationEntry."Shipment Date"      := VNArrivage."Date Emb. confirmée";
        ReservationEntry.MODIFY;

        SalesHeader.GET(SalesHeader."Document Type"::Order,VNArrivage."Sales Order No.");
        SalesHeader.TESTFIELD("Location Code");
        SalesLine.RESET;

        SalesLine.GET(SalesLine."Document Type"::Order,VNArrivage."Sales Order No.",VNArrivage."Sales Order Line No");
        SalesLine.TESTFIELD("No.",VNArrivage."Item No.");
        SalesLine.TESTFIELD("Variant Code",VNArrivage."Code variante");
        SalesLine.TESTFIELD("Location Code",SalesHeader."Location Code");

        SalesReservationLine.INIT;
        SalesReservationLine."Entry No."                  := ReservationEntry."Entry No.";
        SalesReservationLine."Item No."                   := VNArrivage."Item No.";
        SalesReservationLine."Variant Code"               := VNArrivage."Code variante";
        SalesReservationLine."Location Code"              := SalesHeader."Location Code";
        SalesReservationLine.VALIDATE("Quantity (Base)",-1);
        SalesReservationLine."Reservation Status"         := SalesReservationLine."Reservation Status"::Reservation;
        SalesReservationLine."Creation Date"              := WORKDATE;
        SalesReservationLine."Created By"                 := USERID;
        SalesReservationLine."Source Type"                :=37;
        SalesReservationLine."Source Subtype"             :=1;
        SalesReservationLine."Source ID"                  := SalesHeader."No.";
        SalesReservationLine."Source Ref. No."            := SalesLine."Line No.";
        SalesReservationLine."Expected Receipt Date"      := VNArrivage."Date Emb. confirmée";
        SalesReservationLine.Positive                     := FALSE;
        SalesReservationLine."Shipment Date"              := VNArrivage."Date Emb. confirmée";
        SalesReservationLine."Planning Flexibility"       := SalesReservationLine."Planning Flexibility"::Unlimited;
        SalesReservationLine."Item Tracking"              := SalesReservationLine."Item Tracking"::"Serial No.";
        SalesReservationLine."Serial No."                 := VNArrivage.VIN;
        SalesReservationLine.INSERT;
    end;

    local procedure CheckTrackingOnPurchaseLine(VNarrivage : Record "70015");
    var
        PurchaseLine : Record "39";
        MgtAures : Codeunit "70003";
    begin
        ReservationEntry.RESET;
        ReservationEntry.SETRANGE(Positive,TRUE);
        ReservationEntry.SETRANGE("Reservation Status",ReservationEntry."Reservation Status"::Surplus);
        ReservationEntry.SETRANGE("Serial No.",VNarrivage.VIN);
        IF ReservationEntry.ISEMPTY THEN
          BEGIN
            PurchaseLine.RESET;
            PurchaseLine.SETRANGE(Type,PurchaseLine.Type::Item);
            PurchaseLine.SETRANGE(CAF,VNarrivage.CAF);
            IF PurchaseLine.FINDFIRST THEN
              BEGIN
                PurchaseLine.TESTFIELD("Location Code");
                MgtAures.InsertTrackingReservation(PurchaseLine."No.",PurchaseLine."Variant Code",PurchaseLine."Location Code",
                    PurchaseLine."Document No.",PurchaseLine."Line No.",VNarrivage.VIN);
              END;
          END;
    end;

    procedure CheckVarianteExist(CodeVariante : Code[8];CodeArticle : Code[20]);
    var
        ItemVariant : Record "5401";
    begin
        IF NOT (ItemVariant.GET(CodeArticle,CodeVariante)) THEN
          BEGIN
            ItemVariant.INIT;
            ItemVariant.VALIDATE(Code, CodeVariante);
            ItemVariant."Code Couleur":=COPYSTR(CodeVariante,1,4);
            ItemVariant."Code Garnissage":=COPYSTR(CodeVariante,5,4);
            ItemVariant.VALIDATE("Item No.",CodeArticle);
            ItemVariant.INSERT(TRUE);
          END;
    end;
}

