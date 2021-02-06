table 60094 "List Article Cmd Urg"
{
    // version CMD URGENTE

    DrillDownPageID = 50127;
    LookupPageID = 50127;

    fields
    {
        field(1;"Entry no.";Integer)
        {
        }
        field(2;"No. Document";Code[20])
        {
        }
        field(3;"Type Commande";Option)
        {
            OptionCaption = ',PR,VN,Service';
            OptionMembers = ,PR,VN,Service;
        }
        field(4;"Société";Text[100])
        {
        }
        field(5;Client;Code[20])
        {

            trigger OnValidate();
            begin
                Customer.GET(Client);
                "Nom Client" := Customer.Name;
            end;
        }
        field(6;"Article No.";Code[20])
        {
            TableRelation = Item.No.;

            trigger OnValidate();
            begin
                ItemMaster.RESET;
                ItemMaster.SETRANGE("No.","Article No.");
                IF ItemMaster.FINDFIRST THEN
                  BEGIN
                    "EPM Non Reorder Code" := ItemMaster."EPM Non Reorder Code";
                    "Substitution code" :=  ItemMaster."Substitution code";
                    "Unit pack code"   := ItemMaster."Unit pack code" ;
                    "Not used anymore"  := ItemMaster."Not used anymore";
                    "Source Code" := ItemMaster."Source Code";
                    "Sub Supplier Code" := ItemMaster."Sub Supplier Code";
                    "Origin Code" := ItemMaster."Origin Code" ;
                    "Non Stock Code" := ItemMaster."Non Stock Code";
                    "Max qty via VOR" := ItemMaster."Max qty via VOR";
                    "Tariff code" := ItemMaster."Tariff code";

                    CodeNGP.RESET;
                    CodeNGP.SETRANGE(Code,"Tariff code");
                      IF CodeNGP.FINDFIRST THEN
                       "Controle technique" := CodeNGP."Controle Technique";

                    "TMC Stock Code" := ItemMaster."TMC Stock Code" ;
                    "Accessory Code" := ItemMaster."Accessory Code";
                    "Product Code" := ItemMaster."Product Code";
                    "Qty in package" := ItemMaster."Qty in package";
                     "Prix Fob" := ItemMaster.Price;
                      LrecCountryRegion.RESET;
                      LrecCountryRegion.SETRANGE(Code,"Origin Code");
                      IF LrecCountryRegion.FINDFIRST THEN
                        BEGIN
                          IF  LrecCountryRegion.Devise <> '' THEN
                             Eur1 := TRUE
                        END;
                      END;

                Item.GET("Article No.");
                Item.CALCFIELDS(Inventory,"Qty. on Purch. Order");
                Stock := Item.Inventory;
                "Qté CMD en cours" := Item."Qty. on Purch. Order";
                "Sur Commande" := Item."Sur commande";
                "Date Demmande" := CREATEDATETIME(WORKDATE,0T)
            end;
        }
        field(7;"Qté";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(8;"Date Comptabilisation";Date)
        {
        }
        field(9;"No. Cmd Achat";Code[20])
        {
        }
        field(10;Selectionner;Boolean)
        {

            trigger OnValidate();
            begin
                TESTFIELD("Status Ligne","Status Ligne"::" ");
            end;
        }
        field(11;Description;Text[100])
        {
            CalcFormula = Lookup(Item.Description WHERE (No.=FIELD(Article No.)));
            FieldClass = FlowField;
        }
        field(12;"Unit de Mesure";Code[10])
        {
            CalcFormula = Lookup(Item."Base Unit of Measure" WHERE (No.=FIELD(Article No.)));
            FieldClass = FlowField;
        }
        field(13;"Unit de Vente";Code[10])
        {
            CalcFormula = Lookup(Item."Sales Unit of Measure" WHERE (No.=FIELD(Article No.)));
            FieldClass = FlowField;
        }
        field(14;"Unit de achat";Code[10])
        {
            CalcFormula = Lookup(Item."Purch. Unit of Measure" WHERE (No.=FIELD(Article No.)));
            FieldClass = FlowField;
        }
        field(75;"EPM Non Reorder Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'This code contains the actual reject code from the parts master';
        }
        field(80;"Substitution code";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'value 1 -> 1 to 1 sumbstitution, other values 1 to many substitution';
        }
        field(85;"Unit pack code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Code to determine if the distributor POL should be checked';
        }
        field(86;"Not used anymore";Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(90;"Source Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'A=TMC, Z= local part,….';
        }
        field(91;"Sub Supplier Code";Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(92;"Origin Code";Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'It contains the same values as Country code';
        }
        field(93;"Non Stock Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = '1=stocked at TPCE and available, 2= stocked at TPCE but not avialble,….';
        }
        field(96;"Max qty via VOR";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Maximum quantity to order via VOR.';
        }
        field(97;"Tariff code";Code[8])
        {
            DataClassification = ToBeClassified;
            Description = 'To determine the classification of payments of custom tariff.';

            trigger OnValidate();
            begin
                CodeNGP.RESET;
                CodeNGP.SETRANGE(Code,"Tariff code");
                IF CodeNGP.FINDFIRST THEN
                    "Controle technique" := CodeNGP."Controle Technique";

            end;
        }
        field(98;"TMC Stock Code";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = '0 = TMC Stock parts, 1 = TMC not Stock parts';
        }
        field(99;"Accessory Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'P = Part, A = Accessories, S = Service tool';
        }
        field(100;"Product Code";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Product Code';
        }
        field(101;"Type Document";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(102;"No Ligne Cmd Achat";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(103;"Type Cmd Achat";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",SNS,SNC,SNE,SVS,SVC,SVE,CDS,CDC,CDE,CVS,CVC,CVE,CCS,EPC,SST,DEF,CPG,CVA;

            trigger OnValidate();
            begin
                CASE "Type Cmd Achat" OF
                  //1
                  //SNS
                  "Type Cmd Achat"::SNS : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::"9";
                    "Type FD"       :="Type FD"::"50";
                  END;
                  //12
                  //SNC
                  "Type Cmd Achat"::SNC : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::"9";
                    "Type FD"       :="Type FD"::"01 Glass";
                  END;
                  //13
                  //SNE
                  "Type Cmd Achat"::SNE : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::"9";
                    "Type FD"       :="Type FD"::"02 Eur1";
                  END;
                //SVS

                  "Type Cmd Achat"::SVS : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::V;
                    "Type FD"       :="Type FD"::"50";
                  END;
                  //15
                  //SVC
                  "Type Cmd Achat"::SVC : BEGIN
                     "Type Transport":="Type Transport"::SEA;
                     "Type Order"    :="Type Order"::V;
                     "Type FD"       :="Type FD"::"01 Glass";
                  END;
                  //2
                //CDC
                  "Type Cmd Achat"::CDC : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::"9";
                    "Type FD"       :="Type FD"::"01 Glass";
                  END;
                  //3
                //CDE
                  "Type Cmd Achat"::CDE : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::"9";
                    "Type FD"       :="Type FD"::"02 Eur1";
                  END;
                  //4
                //CDS
                  "Type Cmd Achat"::CDS : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::"9";
                    "Type FD"       :="Type FD"::"50";
                  END;
                  //5
                //CPG
                  "Type Cmd Achat"::CPG : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::C;
                    "Type FD"       :="Type FD"::"53";
                  END;
                  //6
                  //CVA
                  "Type Cmd Achat"::CVA : BEGIN
                    "Type Transport":="Type Transport"::VOR;
                    "Type Order"    :="Type Order"::V;
                    "Type FD"       :="Type FD"::"50";
                  END;
                  //7
                  //CVC
                  "Type Cmd Achat"::CVC : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::V;
                    "Type FD"       :="Type FD"::"01 Glass";
                  END;
                  //8
                  //CVE
                  "Type Cmd Achat"::CVE : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::V;
                    "Type FD"       :="Type FD"::"02 Eur1";
                  END;
                  //9
                //CVS
                  "Type Cmd Achat"::CVS : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::V;
                    "Type FD"       :="Type FD"::"50";
                  END;
                  //10
                  //DEF
                  "Type Cmd Achat"::DEF : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::C;
                    "Type FD"       :="Type FD"::"51";
                  END;
                  //11
                  //EPC
                  "Type Cmd Achat"::EPC : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::C;
                    "Type FD"       :="Type FD"::"50";
                  END;


                  //14
                  //SST
                  "Type Cmd Achat"::SST : BEGIN
                    "Type Transport":="Type Transport"::SEA;
                    "Type Order"    :="Type Order"::C;
                    "Type FD"       :="Type FD"::"50";
                  END;

                  //16
                  //SVE
                    "Type Cmd Achat"::SVE : BEGIN
                      "Type Transport":="Type Transport"::SEA;
                      "Type Order"    :="Type Order"::V;
                      "Type FD"       :="Type FD"::"02 Eur1";
                  END;
                  //17
                  //CCS
                    "Type Cmd Achat"::CCS : BEGIN
                      "Type Transport":="Type Transport"::SEA;
                      "Type Order"    :="Type Order"::C;
                      "Type FD"       :="Type FD"::"50";
                  END;
                  //0
                    "Type Cmd Achat"::" " : BEGIN
                      "Type Transport":="Type Transport"::" ";

                  END;


                  END;
            end;
        }
        field(104;"Type Transport";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU=' ,VOR,SEA',
                              FRA=' ,VOR,SEA';
            OptionMembers = " ",VOR,SEA;
        }
        field(105;"Type Order";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU='9,V,C,N,S,ACC,M,5,3,G,P,A',
                              FRA='9,V,C,N,S,ACC,M,5,3,G,P,A';
            OptionMembers = "9",V,C,N,S,ACC,M,"5","3",G,P,A;
        }
        field(106;"Type FD";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "50","01 Glass","02 Eur1","51 DMREHTT","53 GPGHTT";
        }
        field(107;"No Ligne Cmd Vente";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(108;"Centre de gestion Vente";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(109;"Nom Client";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(110;"No Arrivage";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(111;"No colis";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(112;"No Facture";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(113;"Date Facture";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(114;"Date de Reception Prevu";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(115;"No. Reception";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(116;"No. Reception Enreg.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(117;"No Commande Achat";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header".No.;
        }
        field(118;"Qty in package";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'The number of parts within one package. (Purchase Order Lot or Unit Pack Quantity)';
        }
        field(119;Eur1;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(120;"Controle technique";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(121;Stock;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(122;"Qté CMD en cours";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(123;"Sur Commande";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(124;"Prix Fob";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(125;"Type Avance";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(126;"Montant Avance";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(127;"Modele Vehicule";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(128;VIN;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(129;"Date Reception Arrivage";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(130;"Date Arrivage magasin";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(131;"No Reception Magasin Enrg";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(132;"Cmd Vente PR Livree non Fact";Boolean)
        {
            CalcFormula = Exist("Sales Line" WHERE (Document Type=FILTER(Order),
                                                    Document No.=FIELD(No. Document),
                                                    Quantity Shipped=FIELD(Qté)));
            FieldClass = FlowField;
        }
        field(133;"Cmd Vente PR Facturee";Boolean)
        {
            CalcFormula = Exist("Sales Line" WHERE (Document Type=FILTER(Order),
                                                    Document No.=FIELD(No. Document),
                                                    Quantity Invoiced=FILTER(<>0)));
            FieldClass = FlowField;
        }
        field(134;"Cmd Vente SAV Livree non Fact";Boolean)
        {
            CalcFormula = Exist("Service Line" WHERE (Document Type=FILTER(Order),
                                                      Document No.=FIELD(No. Document),
                                                      Quantity Shipped=FIELD(Qté)));
            FieldClass = FlowField;
        }
        field(135;"Cmd Vente SAV Facturee";Boolean)
        {
            CalcFormula = Exist("Service Line" WHERE (Document Type=FILTER(Order),
                                                      Document No.=FIELD(No. Document),
                                                      Quantity Invoiced=FILTER(<>0)));
            FieldClass = FlowField;
        }
        field(136;"Stock Actual";Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE (Item No.=FIELD(Article No.)));
            FieldClass = FlowField;
        }
        field(137;"Processed Item No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(138;"Date Demmande";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(139;"Status Ligne";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU=' ,Annuler par reppro,Annuler par magasinier',
                              FRA=' ,Annuler par reppro,Annuler par magasinier';
            OptionMembers = " ","Annuler par reppro","Annuler par magasinier";

            trigger OnValidate();
            begin
                TESTFIELD(Selectionner,FALSE);
            end;
        }
        field(140;Motif;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(141;Garantie;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(142;"Type de garantie";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'add Gmed : 25 03 2014';
            OptionCaptionML = ENU='Payant par Client,Garantie  Constructeur,Garantie  Prolongé,Campagne,Garantie  Constructeur+Campagne, ',
                              FRA='Payant par Client,Garantie  Constructeur,Garantie  Prolongé,Campagne,Garantie  Constructeur+Campagne, ';
            OptionMembers = "Payant par Client","Garantie  Constructeur","Garantie  Prolongé",Compagne,"Garantie  Constructeur+Campagne"," ";

            trigger OnValidate();
            begin
                //SM MAZDA19
                //IF "Type de garantie" <>  "Type de garantie"::"Garantie  Constructeur" THEN
                //  "Sous Type de garantie" := "Sous Type de garantie"::" ";
                //EN SM
            end;
        }
        field(143;"Type avance OPT";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU=' ,Avance,Bon de Commande,Particulier',
                              FRA=' ,Avance,Bon de Commande,Particulier';
            OptionMembers = " ",Avance,"Bon de Commande",Particulier;
        }
        field(144;"Visa Directeur Technique";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Article No.","Entry no.")
        {
        }
        key(Key2;"Entry no.")
        {
        }
        key(Key3;"No. Document","Société",Client,"Article No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        ItemMaster : Record "70007";
        Customer : Record "18";
        CodeNGP : Record "70048";
        LrecCountryRegion : Record "9";
        Item : Record "27";
        ServiceHeader : Record "5900";
        ServiceItemLine : Record "5901";
        SalesHeader : Record "36";

    procedure FctCheckItemCreatedInPU(PItemNo : Code[20];PTypeDoc : Option PR,VN,Service;PNoDocSource : Code[20];TypeDocument : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order") : Boolean;
    var
        LRecListArticleCmdUrg : Record "60094";
        LrecInventorySetup : Record "313";
    begin
        LrecInventorySetup.GET;
        LRecListArticleCmdUrg.CHANGECOMPANY(LrecInventorySetup."Socité stock consolidé" );
        LRecListArticleCmdUrg.RESET;
        LRecListArticleCmdUrg.SETRANGE("Article No.",PItemNo);
        LRecListArticleCmdUrg.SETRANGE("Type Commande",PTypeDoc);
        LRecListArticleCmdUrg.SETRANGE("No. Document",PNoDocSource);
        LRecListArticleCmdUrg.SETRANGE("Status Ligne",LRecListArticleCmdUrg."Status Ligne"::" ");
        LRecListArticleCmdUrg.SETFILTER("No Commande Achat",'%1','');
        IF LRecListArticleCmdUrg.FINDFIRST THEN
          EXIT(TRUE)
         ELSE
          EXIT(FALSE);
    end;

    procedure FctCheckItemCreatedInCmdAchat(PItemNo : Code[20];PTypeDoc : Text;PNoDocSource : Code[20]) : Boolean;
    var
        LRecPurchaseLine : Record "39";
        LrecInventorySetup : Record "313";
    begin
        LrecInventorySetup.GET;
        LRecPurchaseLine.CHANGECOMPANY(LrecInventorySetup."Socité stock consolidé" );
        LRecPurchaseLine.SETRANGE("Document Type",LRecPurchaseLine."Document Type"::Order);
        LRecPurchaseLine.SETRANGE("No.",PItemNo);
        LRecPurchaseLine.SETFILTER("Outstanding Qty. (Base)",'<>%1',0);
        IF LRecPurchaseLine.FINDFIRST THEN
          EXIT(TRUE)
         ELSE
          EXIT(FALSE);
    end;

    local procedure FctGetLastEntry() : Integer;
    var
        LRecListArticleCmdUrg : Record "60094";
        LrecInventorySetup : Record "313";
    begin
        LrecInventorySetup.GET;
        //LRecListArticleCmdUrg.RESET;
        LRecListArticleCmdUrg.CHANGECOMPANY(LrecInventorySetup."Socité stock consolidé" );
        LRecListArticleCmdUrg.SETCURRENTKEY("Entry no.");
        IF LRecListArticleCmdUrg.FINDLAST THEN
           EXIT(LRecListArticleCmdUrg."Entry no.")
         ELSE
           EXIT(0);
    end;

    procedure FctInsertPieceUrgente(PCdeDocumentNo : Code[20];PTxtDocType : Option PR,VN,Service;PCompanyName : Text;PCdeClient : Code[20];PItemNo : Code[20];PDecQty : Decimal;PDatDateCompta : Date;PtypeDocument : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";PIntLigneno : Integer;PCentreGestion : Code[10]);
    var
        LrecInventorySetup : Record "313";
        LRecListArticleCmdUrg : Record "60094";
    begin
        //LrecInventorySetup.GET;
        //IF LrecInventorySetup."Socité stock consolidé" <> PCompanyName THEN
        //LRecListArticleCmdUrg.RESET;
        //LRecListArticleCmdUrg.CHANGECOMPANY(LrecInventorySetup."Socité stock consolidé" );
        LRecListArticleCmdUrg.INIT;
        LRecListArticleCmdUrg."Entry no."             :=   FctGetLastEntry +1;
        LRecListArticleCmdUrg."No. Document"          :=   PCdeDocumentNo;
        LRecListArticleCmdUrg."Type Commande"         :=   PTxtDocType;
        LRecListArticleCmdUrg.Société                 :=   PCompanyName;
        LRecListArticleCmdUrg.Client                  :=   PCdeClient;

        Customer.GET(PCdeClient);
        LRecListArticleCmdUrg."Nom Client" := Customer.Name;

        LRecListArticleCmdUrg.VALIDATE("Article No.",PItemNo);
        LRecListArticleCmdUrg.Qté                     :=   PDecQty;

        LRecListArticleCmdUrg."Type Document" := PtypeDocument;
        LRecListArticleCmdUrg."No Ligne Cmd Vente" := PIntLigneno;
        LRecListArticleCmdUrg."Centre de gestion Vente":=PCentreGestion;
        IF PTxtDocType = PTxtDocType::Service THEN BEGIN
           ServiceHeader.GET(ServiceHeader."Document Type"::Order ,PCdeDocumentNo);
           LRecListArticleCmdUrg."Type Avance" := FORMAT(ServiceHeader."Type avance");
           IF ServiceHeader."Type avance" = ServiceHeader."Type avance"::Particulier THEN
            LRecListArticleCmdUrg."Type avance OPT" := LRecListArticleCmdUrg."Type avance OPT"::Particulier ;
           LRecListArticleCmdUrg."Montant Avance" := ServiceHeader."Avance sur commande";
           LRecListArticleCmdUrg."Type de garantie" := ServiceHeader."Type de garantie";
           ServiceItemLine.SETRANGE("Document Type",ServiceItemLine."Document Type"::Order);
           ServiceItemLine.SETRANGE("Document No." ,PCdeDocumentNo);
           IF ServiceItemLine.FINDFIRST THEN BEGIN
             LRecListArticleCmdUrg."Modele Vehicule" := ServiceItemLine."Item No.";
             LRecListArticleCmdUrg. VIN := ServiceItemLine."Serial No.";
             LRecListArticleCmdUrg."Date Comptabilisation" :=   ServiceHeader."Posting Date";
            END;
        END;

        IF PTxtDocType = PTxtDocType::PR THEN BEGIN
           SalesHeader.GET(ServiceHeader."Document Type"::Order ,PCdeDocumentNo);
           LRecListArticleCmdUrg."Type Avance" := FORMAT(SalesHeader."Type avance");
           LRecListArticleCmdUrg."Montant Avance" := SalesHeader."Avance sur commande";
           LRecListArticleCmdUrg."Date Comptabilisation" :=   SalesHeader."Posting Date";
        END;
        LRecListArticleCmdUrg.INSERT(TRUE);
    end;

    procedure FctDeleteItemCreatedInPU(PItemNo : Code[20];PTypeDoc : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";PNoDocSource : Code[20]) : Boolean;
    var
        LRecListArticleCmdUrg : Record "60094";
        LrecInventorySetup : Record "313";
    begin
        LrecInventorySetup.GET;
        LRecListArticleCmdUrg.CHANGECOMPANY(LrecInventorySetup."Socité stock consolidé" );
        LRecListArticleCmdUrg.RESET;
        LRecListArticleCmdUrg.SETRANGE("Article No.",PItemNo);
        LRecListArticleCmdUrg.SETRANGE("Type Commande",PTypeDoc);
        LRecListArticleCmdUrg.SETRANGE("No. Document",PNoDocSource);
        LRecListArticleCmdUrg.SETFILTER("No. Cmd Achat",'%1','');
        IF LRecListArticleCmdUrg.FINDFIRST THEN
          BEGIN
            LRecListArticleCmdUrg.DELETE;
            EXIT(TRUE);
          END
           ELSE
            EXIT(FALSE);
    end;

    procedure FctItemCreated(PItemNo : Code[20];PTypeDoc : Option PR,VN,Service;PNoDocSource : Code[20]) : Boolean;
    var
        LRecListArticleCmdUrg : Record "60094";
    begin
        LRecListArticleCmdUrg.RESET;
        LRecListArticleCmdUrg.SETRANGE("Article No.",PItemNo);
        LRecListArticleCmdUrg.SETRANGE("Type Commande",PTypeDoc);
        LRecListArticleCmdUrg.SETRANGE("No. Document",PNoDocSource);
        IF LRecListArticleCmdUrg.FINDFIRST THEN
           EXIT(TRUE)
          ELSE
            EXIT(FALSE)
    end;

    procedure FctCheckItemDeletedbyMag(PItemNo : Code[20];PTypeDoc : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";PNoDocSource : Code[20]) : Boolean;
    var
        LRecListArticleCmdUrg : Record "60094";
    begin
        LRecListArticleCmdUrg.RESET;
        LRecListArticleCmdUrg.SETRANGE("Article No.",PItemNo);
        LRecListArticleCmdUrg.SETRANGE("Type Commande",PTypeDoc);
        LRecListArticleCmdUrg.SETRANGE("No. Document",PNoDocSource);
        LRecListArticleCmdUrg.SETRANGE("Status Ligne",LRecListArticleCmdUrg."Status Ligne"::"Annuler par magasinier");
        IF LRecListArticleCmdUrg.FINDFIRST THEN
           EXIT(TRUE)
          ELSE
            EXIT(FALSE)
    end;

    procedure FctCheckItemDeletedbyReappro(PItemNo : Code[20];PTypeDoc : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";PNoDocSource : Code[20]) : Boolean;
    var
        LRecListArticleCmdUrg : Record "60094";
    begin
        LRecListArticleCmdUrg.RESET;
        LRecListArticleCmdUrg.SETRANGE("Article No.",PItemNo);
        LRecListArticleCmdUrg.SETRANGE("Type Commande",PTypeDoc);
        LRecListArticleCmdUrg.SETRANGE("No. Document",PNoDocSource);
        LRecListArticleCmdUrg.SETRANGE("Status Ligne",LRecListArticleCmdUrg."Status Ligne"::"Annuler par reppro");
        IF LRecListArticleCmdUrg.FINDFIRST THEN
           EXIT(TRUE)
          ELSE
            EXIT(FALSE)
    end;
}

