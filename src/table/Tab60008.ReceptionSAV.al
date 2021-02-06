table 60008 "Reception SAV"
{
    // version SAV Automobile,MAZDA06,MAZDA19,MAZDA672

    DrillDownPageID = 60015;
    LookupPageID = 60015;

    fields
    {
        field(1;"Reception No";Code[20])
        {
            CaptionML = ENU='Receive No.',
                        FRA='Reception N°';
        }
        field(2;"Vehicle No.";Code[20])
        {
            CaptionML = ENU='Vehicle No.',
                        FRA='Modèle véhicule';

            trigger OnValidate();
            var
                LRecFicheTechniqueArticle : Record "50032";
            begin
                //SM 230419
                //OLD
                //OLD IF RecGItem.GET("Vehicle No.") THEN
                //OLD   BEGIN
                //OLD     //"Model Code" := RecGItem."Model Code" ;
                //OLD      IF LRecFicheTechniqueArticle.GET(RecGItem."No.") THEN
                //OLD           "Model Code" := LRecFicheTechniqueArticle."Model Code" ;
                //OLD   END;
                //OLD
                IF STRLEN("Vehicle No.") > 2 THEN
                  "Model Code" := COPYSTR("Vehicle No.",1,STRLEN("Vehicle No.")-2)
                ELSE
                  "Model Code" := '';
                //END SM
            end;
        }
        field(3;VIN;Code[20])
        {
            CaptionML = ENU='VIN',
                        FRA='Num Chassis';

            trigger OnValidate();
            var
                LRecReceptionSAV : Record "60008";
            begin
                
                //TMP IF STRLEN(VIN) <> 17 THEN
                 //TMP ERROR('La longeur du numéro de chassis doit être égale à 17 caractères');
                
                CLEAR( RecItemService );
                //<< TRIUM RAd 19/08/2014 - Mise à jour code pour la réparation interne
                IF "Service Type" <> "Service Type"::"Internal Repair" THEN
                  BEGIN
                //>> END Trium RAD addin
                    RecItemService.SETRANGE("Serial No.",VIN);
                    IF RecItemService.FINDFIRST THEN
                      BEGIN
                        //SM 290419
                        RecItemService.TESTFIELD("Item No.");
                        //END SM
                
                        VALIDATE("Service Item No.",RecItemService."No.");
                        "Service Item Description" := RecItemService.Description;
                        VALIDATE("Vehicle No." ,RecItemService."Item No.");
                        "Variant Code" := RecItemService."Variant Code" ;
                        Matricule := RecItemService.Matricule;
                        "Installation Date" := RecItemService."Installation Date" ;
                        VALIDATE("Customer No.",RecItemService."Customer No.");
                //<<---NM100317--Date premiére circulation-----
                        "Date Mise en Circulation":= RecItemService."Date Mise en Circulation";
                //>>---NM100317--Date premiére circulation-----
                
                        //SM MAZDA19
                        "Sales Date" := RecItemService."Sales Date";
                        "Warranty Starting Date (Labor)"  := RecItemService."Warranty Starting Date (Labor)";
                        "Warranty Ending Date (Labor)"    := RecItemService."Warranty Ending Date (Labor)";
                        "Warranty Starting Date (Parts)"  := RecItemService."Warranty Starting Date (Parts)";
                        "Warranty Ending Date (Parts)"    := RecItemService."Warranty Ending Date (Parts)";
                        "Warranty % (Parts)"              := RecItemService."Warranty % (Parts)";
                        "Warranty % (Labor)"              := RecItemService."Warranty % (Labor)";
                
                        "Warranty End Date"               := RecItemService."Warranty Ending Date (Parts)";
                        //SM 170817
                
                        "Entretien 10 000" := RecItemService."Entretien 10 000";
                
                        "Entretien 20 000" := RecItemService."Entretien 20 000";
                        /*LRecReceptionSAV.RESET;
                        LRecReceptionSAV.SETRANGE(VIN,VIN);
                        LRecReceptionSAV.SETRANGE("Entretien 30 000",TRUE);
                        IF NOT LRecReceptionSAV.FINDFIRST THEN*/
                        "Entretien 30 000" := RecItemService."Entretien 30 000";
                        //END SM
                        //END SM
                      END
                        //SM 10/06/14 OLD ELSE MESSAGE(Text0002,VIN);
                        ELSE ERROR(Text0002,VIN);
                  END;

            end;
        }
        field(4;"Variant Code";Code[20])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code Variante';
        }
        field(5;Status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='statut';
            OptionCaption = 'OR Crée,Devis/diagnostique Crée,Réparé,Suspendu,Annulé';
            OptionMembers = "OR Crée","Devis/diagnostique Crée","Réparé",Suspendu,"Annulé";
        }
        field(6;Priority;Option)
        {
            CaptionML = ENU='Priority',
                        FRA='Priorité';
            OptionCaptionML = ENU='Normal,Medium,Hight',
                              FRA='Normale,Moyenne,Haute';
            OptionMembers = Normale,Moyenne,Haute;
        }
        field(7;"Service Item No.";Code[20])
        {
            CaptionML = ENU='Service Item No.',
                        FRA='Num article de service';
            TableRelation = "Service Item".No.;

            trigger OnValidate();
            var
                RecItemService : Record "5940";
            begin
                RecItemService.GET("Service Item No.");
                //<<----NM210120---------
                IF RecItemService.VS=TRUE THEN
                RecItemService.TESTFIELD("Approbation Création OR",TRUE);
                //>>end
                "Service Item Description":=RecItemService.Description;
                //ADD KK_280917
                RecItemService.CALCFIELDS(Kilométrage);
                Kilométrage := RecItemService.Kilométrage;
            end;
        }
        field(8;"Service Item Description";Text[100])
        {
            CaptionML = ENU='Service Item Description',
                        FRA='désignation article de service';
        }
        field(9;"Unit of measure code";Code[20])
        {
            CaptionML = ENU='Unit of measure code',
                        FRA='Code Unité';
        }
        field(10;"Location of service item";Code[20])
        {
            CaptionML = ENU='Location of service item',
                        FRA='Magasin artile de service';
        }
        field(11;"Warranty Starting Date (Labor)";Date)
        {
            CaptionML = ENU='Warranty Starting Date (Labor)',
                        FRA='Date Début garantie (M.O.)';
        }
        field(12;"Warranty Ending Date (Labor)";Date)
        {
            CaptionML = ENU='Warranty Ending Date (Labor)',
                        FRA='Date Fin garantie ( M.O.)';
        }
        field(13;"Warranty Starting Date (Parts)";Date)
        {
            CaptionML = ENU='Warranty Starting Date (Parts)',
                        FRA='Date début garantie (pièces)';
        }
        field(14;"Warranty Ending Date (Parts)";Date)
        {
            CaptionML = ENU='Warranty Ending Date (Parts)',
                        FRA='Date fin garantie (pièces)';
        }
        field(15;"Warranty % (Parts)";Decimal)
        {
            CaptionML = ENU='Warranty % (Parts)',
                        FRA='% garantie (pièces)';
        }
        field(16;"Warranty % (Labor)";Decimal)
        {
            CaptionML = ENU='Warranty % (Labor)',
                        FRA='% garantie (M.O.)';
        }
        field(17;"Response Time (Hours)";Decimal)
        {
            CaptionML = ENU='Response Time (Hours)',
                        FRA='Délai de réponse (heures)';
        }
        field(18;"Installation Date";Date)
        {
            CaptionML = ENU='Installation Date',
                        FRA='Date d''installation';
        }
        field(19;"Sales Date";Date)
        {
            CaptionML = ENU='Sales Date',
                        FRA='Date vente';
        }
        field(20;"Last Service Date";Date)
        {
            CaptionML = ENU='Last Service Date',
                        FRA='Date dernier service';
        }
        field(21;"No. Series";Code[20])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
        }
        field(22;"Vendor No.";Code[10])
        {
            CaptionML = ENU='Vendor No.',
                        FRA='N° fournisseur';
        }
        field(23;"Vendor Item No.";Code[10])
        {
            CaptionML = ENU='Vendor Item No.',
                        FRA='Référence fournisseur';
        }
        field(24;"Vendor Item Name";Text[50])
        {
            CaptionML = ENU='Vendor Item Name',
                        FRA='Nom fournisseur article';
        }
        field(25;"Vendor Name";Text[50])
        {
            CaptionML = ENU='Vendor Name',
                        FRA='Nom fournisseur';
        }
        field(26;"Vendor Warranty Date";Date)
        {
            CaptionML = ENU='Vendor Warranty Date',
                        FRA='Date Garantie Fournisseur';
        }
        field(27;"Purchase invoice No.";Code[20])
        {
            CaptionML = ENU='Purchase invoice No.',
                        FRA='N° Facture Fournisseur';
        }
        field(28;"Purchase invoice Date";Date)
        {
            CaptionML = ENU='Purchase invoice Date',
                        FRA='Date Facture Achat';
        }
        field(29;"Customer No.";Code[20])
        {
            CaptionML = ENU='Customer No.',
                        FRA='Client N°';
            TableRelation = Customer.No.;

            trigger OnValidate();
            var
                RecCustomer : Record "18";
            begin
                 RecCustomer.GET("Customer No.");
                 RecCustomer.TESTFIELD(Blocked,0);
                 Name:=RecCustomer.Name;
                 "Name 2":=RecCustomer."Name 2";
                 Address:=RecCustomer.Address;
                 "Address 2":=RecCustomer."Address 2";
                 "Post Code":=RecCustomer."Post Code";
                 City:=RecCustomer.City;
                 County:=RecCustomer.County;
                 "Country/Region Code":=RecCustomer."Country/Region Code";
                 Contact:=RecCustomer.Contact;
                  "Phone No.":=RecCustomer."Phone No.";
            end;
        }
        field(30;Name;Text[50])
        {
            CaptionML = ENU='Name',
                        FRA='Nom';
        }
        field(31;"Name 2";Text[50])
        {
            CaptionML = ENU='Name 2',
                        FRA='Nom 2';
        }
        field(32;Address;Text[50])
        {
            CaptionML = ENU='Address',
                        FRA='Addresse';
        }
        field(33;"Address 2";Text[50])
        {
            CaptionML = ENU='Address 2',
                        FRA='Addresse 2';
        }
        field(34;"Post Code";Code[20])
        {
            CaptionML = ENU='Post Code',
                        FRA='Code Postal';
        }
        field(35;City;Text[50])
        {
            CaptionML = ENU='City',
                        FRA='Vile';
        }
        field(36;County;Text[50])
        {
            CaptionML = ENU='County',
                        FRA='Gouvernorat';
        }
        field(37;"Country/Region Code";Code[10])
        {
            CaptionML = ENU='Country/Region Code',
                        FRA='Pays/code Région';
        }
        field(38;Contact;Text[50])
        {
            CaptionML = ENU='Contact',
                        FRA='Contact';
        }
        field(39;"Phone No.";Text[50])
        {
            CaptionML = ENU='Phone No.',
                        FRA='Telephone';
        }
        field(40;"Owner Code";Code[20])
        {
            CaptionML = ENU='Owner Code',
                        FRA='Code Propriétaire';
        }
        field(41;"Owner Name";Text[50])
        {
            CaptionML = ENU='Owner Name',
                        FRA='Nom Propriétaire';
        }
        field(42;"Owner Address";Text[50])
        {
            CaptionML = ENU='Owner Address',
                        FRA='Addresse Propriétaire';
        }
        field(43;"Owner Address 2";Text[50])
        {
            CaptionML = ENU='Owner Address 2',
                        FRA='Address 2 propriétaire';
        }
        field(44;"Owner Post Code";Code[20])
        {
            CaptionML = ENU='Owner Post Code',
                        FRA='Code Postale propriétaire';
        }
        field(45;"Owner City";Text[50])
        {
            CaptionML = ENU='Owner City',
                        FRA='Vile propriétaire';
        }
        field(46;"Owner County";Text[50])
        {
            CaptionML = ENU='Owner County',
                        FRA='Gouvernorat propriétaire';
        }
        field(47;"Owner Country/Region Code";Code[20])
        {
            CaptionML = ENU='Owner Country/Region Code',
                        FRA='Code Pays/ Region Propriétaire';
        }
        field(48;"Owner Contact";Code[20])
        {
            CaptionML = ENU='Owner Contact',
                        FRA='Contact du Propriétaire';
        }
        field(49;"Owner Phone No.";Text[30])
        {
            CaptionML = ENU='Owner Phone No.',
                        FRA='Téléphonne du propriétaire';
        }
        field(50;"Assigned to";Code[20])
        {
            CaptionML = ENU='Assigned to',
                        FRA='Affecté à';
        }
        field(51;Comment;Boolean)
        {
            CaptionML = ENU='Comment',
                        FRA='Commentaire';
        }
        field(52;"Service Item Components";Boolean)
        {
            CaptionML = ENU='Service Item Components',
                        FRA='Composant article de service';
        }
        field(53;"Preferred Resource";Code[20])
        {
            CaptionML = ENU='Preferred Resource',
                        FRA='ressource préféré';
        }
        field(54;"Service Price Group Code";Code[20])
        {
            CaptionML = ENU='Service Price Group Code',
                        FRA='Code Groupe Prix de Service';
        }
        field(55;"Service Contracts";Boolean)
        {
            CaptionML = ENU='Service Contracts',
                        FRA='Contrat de service';
        }
        field(56;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRA='Filtre Date';
            FieldClass = FlowFilter;
        }
        field(57;"Type Filter";Text[30])
        {
            CaptionML = ENU='Type Filter',
                        FRA='Filtre Type';
        }
        field(58;"Contact Filter";Code[20])
        {
            CaptionML = ENU='Contact Filter',
                        FRA='Filtre contact';
            FieldClass = FlowFilter;
        }
        field(59;"Service Order Filter";Code[20])
        {
            CaptionML = ENU='Service Order Filter',
                        FRA='Filtre Ordre de Service';
        }
        field(60;"Sales/Serv. Shpt. Document No.";Code[20])
        {
            CaptionML = ENU='Sales/Serv. Shpt. Document No.',
                        FRA='No Document Expédi. Vente/service';
        }
        field(61;"Sales/Serv. Shpt. Line No.";Integer)
        {
            CaptionML = ENU='Sales/Serv. Shpt. Line No.',
                        FRA='No Ligne Expédit. Vente/srvice';
        }
        field(62;"Shipment Type";Text[30])
        {
            CaptionML = ENU='Shipment Type',
                        FRA='type Expédition';
        }
        field(63;"Global Dimension 1 Code";Code[20])
        {
            CaptionML = ENU='Global Dimension 1 Code',
                        FRA='Global Dimension 1 Code';
        }
        field(64;"Global Dimension 2 Code";Code[20])
        {
            CaptionML = ENU='Global Dimension 2 Code',
                        FRA='Global Dimension 2 Code';
        }
        field(65;"Service Item Group Code";Code[20])
        {
            CaptionML = ENU='Service Item Group Code',
                        FRA='Code Groupe Article de service';
        }
        field(66;"Created By";Code[50])
        {
            CaptionML = ENU='Created By',
                        FRA='Crée par';
        }
        field(67;"Creation date";Date)
        {
            CaptionML = ENU='Creation date',
                        FRA='Date de Création';
        }
        field(68;"Original Invoice No";Code[20])
        {
            CaptionML = ENU='Original Invoice No',
                        FRA='No Facture d''origine';
        }
        field(69;"Invoice Date";Date)
        {
            CaptionML = ENU='Invoice Date',
                        FRA='Date Facture';
        }
        field(70;Warranty;Boolean)
        {
            CaptionML = ENU='Warranty',
                        FRA='Garantie';
            Editable = false;

            trigger OnValidate();
            begin
                IF NOT Warranty  THEN BEGIN
                  "Type de garantie":="Type de garantie"::"Payant par Client";
                  "Sous Type de garantie":="Sous Type de garantie"::" ";
                  MODIFY;
                END;
            end;
        }
        field(71;"Warranty End Date";Date)
        {
            CaptionML = ENU='Warranty End Date',
                        FRA='Date Fin de garantie';
        }
        field(72;"Reception Date";Date)
        {
            CaptionML = ENU='Receive Date',
                        FRA='Date Réception';
        }
        field(73;"Shipment date Request";Date)
        {
            CaptionML = ENU='Shipment date Request',
                        FRA='Date demande Livraison';
        }
        field(74;"Sell-to Contact No.";Code[20])
        {
            CaptionML = ENU='Sell-to Contact No.',
                        FRA='No Contact Client Facturé';
        }
        field(75;"Order No";Code[20])
        {
            CaptionML = ENU='Order N°',
                        FRA='Commande N°';
        }
        field(76;"Shipment No";Code[20])
        {
            CaptionML = ENU='Shipment N°',
                        FRA='Expédition N°';
        }
        field(77;"Salesperson No";Code[20])
        {
            CaptionML = ENU='Salesperson N°',
                        FRA='Code Vendeur';
        }
        field(78;"Salesperson Name";Text[100])
        {
            CaptionML = ENU='Salesperson Name',
                        FRA='Nom Vendeur';
        }
        field(79;"Livré au client";Boolean)
        {
            CaptionML = ENU='shipped to Customer',
                        FRA='Livré au client';
        }
        field(80;"Date Livraison";DateTime)
        {
            CaptionML = ENU='Shipping Date',
                        FRA='Date Livraison';
        }
        field(81;"Total Work Hour";Decimal)
        {
            CaptionML = ENU='Total Work Hour',
                        FRA='Nombre total Heure travaillé';
        }
        field(82;"Block/cancel reason";Text[100])
        {
            CaptionML = ENU='Block/cancel reason',
                        FRA='Motif Annulation';
        }
        field(83;"Block/cancel Date";DateTime)
        {
            CaptionML = ENU='Block/cancel Date',
                        FRA='Date Annulation';
        }
        field(84;"unblock/reactivate Date";DateTime)
        {
            CaptionML = ENU='unblock/reactivate Date',
                        FRA='Date de réactivation';
        }
        field(85;"Responsibility Center";Code[20])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de Gestion';
            TableRelation = "Responsibility Center".Code;
        }
        field(86;"Date Validation Devis";DateTime)
        {
            Caption = 'Date Validation Devis';
        }
        field(87;"Devis Validé";Boolean)
        {
            Caption = 'Devis Validé';
        }
        field(88;Invoiced;Boolean)
        {
            CaptionML = ENU='Invoiced',
                        FRA='Facturé';
        }
        field(89;"Motif Hors garantie";Text[20])
        {
            Caption = 'Motif Hors garantie';
        }
        field(90;"Type d'intervention";Code[5])
        {
            Caption = 'Type d''intervention';
        }
        field(91;"Nom Personne Livré";Text[5])
        {
            CaptionML = ENU='Name shipped Person',
                        FRA='Nom Personne Livré';
        }
        field(92;"CIN Personne Livré";Text[5])
        {
            CaptionML = ENU='CIN Person Shipped',
                        FRA='CIN Personne Livré';
        }
        field(93;"Date devis";DateTime)
        {
            CaptionML = ENU='Quote Date',
                        FRA='Date devis';
        }
        field(94;"Date Réparation";DateTime)
        {
            CaptionML = ENU='Repair Date',
                        FRA='Date Réparation';
        }
        field(95;"Service Type";Option)
        {
            CaptionML = ENU='Service Type',
                        FRA='Type de Service';
            OptionCaptionML = ENU='Rapid Service,Big Service,Internal Repair',
                              FRA='Service Rapide,Grand service,Reparation Interne';
            OptionMembers = "Rapid Service","Big Service","Internal Repair";
        }
        field(96;Matricule;Code[20])
        {
            Caption = 'Matricule';

            trigger OnValidate();
            begin
                  ///-> VALIDATE N° IMATRICULAtION
                //KT 210917
                IF Matricule<>'' THEN BEGIN
                //END KT
                 CLEAR( RecItemService );
                 RecItemService.SETRANGE(Matricule,Matricule);
                 IF RecItemService.FINDFIRST THEN
                 BEGIN
                   //SM 290419
                   RecItemService.TESTFIELD("Item No.");
                   //END SM
                   VALIDATE("Service Item No.",RecItemService."No.");
                    "Service Item Description" := RecItemService.Description;
                    "Vehicle No." := RecItemService."Item No." ;
                    VALIDATE(VIN,RecItemService."Serial No.") ;
                    "Variant Code" := RecItemService."Variant Code" ;
                    VALIDATE("Customer No.",RecItemService."Customer No.");
                 END
                 ELSE
                 BEGIN
                    MESSAGE(Text0001,Matricule);
                 END;
                END;
            end;
        }
        field(97;"Status SR";Option)
        {
            Caption = 'Status SR';
            Editable = true;
            OptionCaptionML = ENU='Fiche Créée,Lancé,Commande Créée,Pièces demandées,Facturé,Annulé,Livré,Suspendu',
                              FRA='Fiche Créée,Lancé,Commande Créée,Pièces demandées,Facturé,Annulé,Livré,Suspendu';
            OptionMembers = "Fiche Crée","Lancée","Commande Crée","Pièces demandé","Facturée","Annulé","Livré",Suspendu;

            trigger OnValidate();
            var
                LRecListVINCompagne : Record "50076";
                LRecListVINCompagne1 : Record "50076";
                LRecListedeVINenavarie : Record "50077";
                LRecListedeVINenavarie1 : Record "50077";
            begin
                //KT 090817
                IF "Status SR"="Status SR"::Facturée THEN BEGIN
                  LRecListVINCompagne.RESET;
                  LRecListVINCompagne.SETRANGE(VIN,VIN);
                  //LRecListVINCompagne.SETRANGE(Code,"N° campagne");
                  LRecListVINCompagne.SETRANGE("Reception No.","Reception No");
                  IF  LRecListVINCompagne.FINDSET THEN BEGIN
                    REPEAT
                      LRecListVINCompagne1.GET(LRecListVINCompagne.VIN,LRecListVINCompagne.Code);
                      LRecListVINCompagne1.Traiter:=TRUE;
                      LRecListVINCompagne1.MODIFY;
                    UNTIL LRecListVINCompagne.NEXT=0;
                  END;
                  //KT 160817
                IF "Assurances groupe" AND ("Type assurances groupe"="Type assurances groupe"::Avarie) THEN BEGIN
                  LRecListedeVINenavarie.RESET;
                  LRecListedeVINenavarie.SETRANGE("No.","N° constat avarie");
                  LRecListedeVINenavarie.SETRANGE(Traiter,FALSE);
                  IF LRecListedeVINenavarie.FINDFIRST THEN BEGIN
                    LRecListedeVINenavarie1.GET(LRecListedeVINenavarie."No.");
                    LRecListedeVINenavarie1.Traiter:=TRUE;
                    LRecListedeVINenavarie1.MODIFY;
                  END;
                END;
                //END KT
                //KT 230817
                IF Warranty THEN
                  VALIDATE("Warranty Status","Warranty Status"::Clôturée);
                //END 230817
                END;
                //END  KT
                IF "Status SR"="Status SR"::Annulé THEN
                  IF xRec."Status SR">1 THEN
                    ERROR('Annulation interdite, %1' ,xRec."Status SR");
            end;
        }
        field(98;"Operation Rejeter";Integer)
        {
            CalcFormula = Count("Ligne reception service Rapide" WHERE (Copied To Doc No.=FIELD(Service Item No.),
                                                                        Quantity=CONST(1),
                                                                        Type opération=FILTER(=rapid service)));
            FieldClass = FlowField;
        }
        field(99;Fax;Integer)
        {
        }
        field(100;"Heur creation";Time)
        {
            CaptionML = ENU='Creation Time',
                        FRA='Heure Création';
        }
        field(101;"Model Code";Text[50])
        {
            CaptionML = ENU='Model Code',
                        FRA='Code Modèle';
        }
        field(102;"Type de garantie";Option)
        {
            Caption = 'Type de garantie';
            Description = 'add Gmed : 25 03 2014';
            Editable = true;
            OptionCaptionML = ENU='<Payant par Client,Garantie  Constructeur,Garantie  Prolongé,Campagne,Garantie  Constructeur+Campagne, >',
                              FRA='Payant par Client,Garantie  Constructeur,Garantie  Prolongé,Campagne,Garantie  Constructeur+Campagne, ';
            OptionMembers = "Payant par Client","Garantie  Constructeur","Garantie  Prolongé",Compagne,"Garantie  Constructeur+Campagne"," ";

            trigger OnValidate();
            var
                RecLServiceHeader : Record "5900";
                RecLServiceLine : Record "5902";
            begin
                //KK_15102020
                IF "Type de garantie" IN ["Type de garantie"::"Garantie  Constructeur","Type de garantie"::"Garantie  Constructeur+Campagne",
                                          "Type de garantie"::"Garantie  Prolongé"] THEN
                    BEGIN
                      IF "Status SR" <> "Status SR"::"Fiche Crée" THEN
                        BEGIN
                          RecLServiceHeader.RESET;
                          RecLServiceHeader.SETRANGE(RecLServiceHeader."Document Type",RecLServiceHeader."Document Type"::Order);
                          RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Reception No");
                          IF RecLServiceHeader.FINDFIRST THEN
                            BEGIN
                              RecLServiceLine.RESET;
                              RecLServiceLine.SETRANGE("Document Type",RecLServiceHeader."Document Type");
                              RecLServiceLine.SETRANGE("Document No.",RecLServiceHeader."No.");
                              RecLServiceLine.SETRANGE(Type,RecLServiceLine.Type::Item);
                              IF RecLServiceLine.FINDSET THEN
                                REPEAT
                                  IF RecLServiceLine."Ordered Qty" <> 0 THEN
                                    ERROR(TXT50017);
                                UNTIL RecLServiceLine.NEXT=0;
                            END;
                        END;
                    END;
                //END.

                //SM MAZDA19
                //IF "Type de garantie" <>  "Type de garantie"::"Garantie  Constructeur" THEN
                //  "Sous Type de garantie" := "Sous Type de garantie"::" ";
                //EN SM
                IF Matricule <> '' THEN BEGIN
                IF "Type de garantie" = "Type de garantie"::Compagne THEN
                  BEGIN
                    RecItemService.SETRANGE(Matricule,Matricule);
                    IF RecItemService.FINDFIRST THEN BEGIN
                     RecItemService.CALCFIELDS(Compagne);
                     RecItemService.TESTFIELD(Compagne,TRUE);
                    END;

                  END;
                END
                ELSE BEGIN
                IF "Type de garantie" = "Type de garantie"::Compagne THEN
                  BEGIN
                    RecItemService.RESET;
                    RecItemService.SETRANGE("Serial No.",VIN);
                    IF RecItemService.FINDFIRST THEN BEGIN
                     RecItemService.CALCFIELDS(Compagne);
                     RecItemService.TESTFIELD(Compagne,TRUE);
                    END;
                  END;
                END;
                //KT 080817
                IF (("Type de garantie"<>"Type de garantie"::"Garantie  Constructeur") AND
                  ("Type de garantie"<>"Type de garantie"::"Garantie  Constructeur+Campagne") AND
                  ("Type de garantie"<>"Type de garantie"::"Garantie  Prolongé")) THEN BEGIN
                  IF Warranty THEN BEGIN
                    Warranty:=FALSE;
                    MODIFY;
                  END;
                END;
                //KT 101117
                IF "Type de garantie" <> "Type de garantie"::Compagne THEN
                  BEGIN
                    RecItemService.RESET;
                    ListVINCompagne.SETRANGE(VIN,VIN);
                    ListVINCompagne.SETRANGE("Reception No.","Reception No");
                    IF ListVINCompagne.FINDSET THEN BEGIN
                      ListVINCompagne.MODIFYALL("Reception No.",'');
                    END;
                  END;

                FctClientFacturé;
                //END KT
            end;
        }
        field(103;"Warranty Request By";Option)
        {
            Caption = 'Demandeur Garantie';
            Description = 'add Gmed : 25 03 2014';
            OptionCaptionML = ENU='Customer,Concessionnaire,Other',
                              FRA='Customer,Concessionnaire,Other';
            OptionMembers = Customer,US,Other;
        }
        field(104;"Etat de la réclamation";Option)
        {
            Description = 'add Gmed : 25 03 2014';
            Editable = false;
            OptionMembers = " ",Cloture,"Encours de validation Direction Technique","Encours de validation Assurance","Encours de validation MC";
        }
        field(105;"Approval Warranty Pick Request";Option)
        {
            Caption = 'Approbation Garantie Demande Pièce';
            Description = 'SM Ouvert, Encours, Approuver, Refuser';
            Editable = false;
            OptionMembers = Ouvert,Encours,Approuver,Refuser;

            trigger OnValidate();
            var
                RecLUserSetup : Record "91";
            begin
                //SM 22/08/2014
                IF ("Approval Warranty Pick Request" = "Approval Warranty Pick Request"::Encours)
                 AND (xRec."Approval Warranty Pick Request"<>"Approval Warranty Pick Request"::Ouvert) THEN BEGIN
                  ERROR(TXT50013);
                END;
                //END SM

                IF ("Approval Warranty Pick Request" = "Approval Warranty Pick Request"::Approuver)
                 OR ("Approval Warranty Pick Request"="Approval Warranty Pick Request"::Refuser) THEN BEGIN
                  //SM MAZDA19
                  RecLUserSetup.GET(USERID);
                  IF NOT RecLUserSetup."Approbation Garantie" THEN
                    ERROR(TXT50008);
                  //END SM

                  //SM 22/08/2014
                  TESTFIELD("Type de garantie");
                  IF "Type de garantie" = "Type de garantie"::"Garantie  Constructeur" THEN
                    TESTFIELD("Sous Type de garantie");
                  //END SM

                  "App. W. Pick Request User" := USERID;
                  "App. W. Pick Request Date" := CURRENTDATETIME;
                END;
            end;
        }
        field(106;"Approval Warranty Service Post";Option)
        {
            Caption = 'Approbation Garantie BL/Facturation';
            Description = 'SM Ouvert, Encours, Approuver, Refuser';
            Editable = false;
            OptionMembers = Ouvert,Encours,Approuver,Refuser;

            trigger OnValidate();
            var
                RecLUserSetup : Record "91";
                RecLServiceOrderHeader : Record "5900";
                RecLServiceItemLine : Record "5901";
                RecLServiceLine : Record "5902";
                ServiceMgtSetup : Record "5911";
            begin
                //SM 22/08/2014
                IF ("Approval Warranty Service Post" = "Approval Warranty Service Post"::Encours)
                 AND (xRec."Approval Warranty Service Post"<>"Approval Warranty Service Post"::Ouvert) THEN BEGIN
                  ERROR(TXT50013);
                END;
                //END SM

                //SM 031215
                IF "Sous Type de garantie" = "Sous Type de garantie"::Compagne THEN BEGIN
                  RecLServiceOrderHeader.RESET;
                   RecLServiceOrderHeader.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type"::Order);
                  RecLServiceOrderHeader.SETRANGE("Reception No","Reception No");
                  IF NOT RecLServiceOrderHeader.FINDFIRST THEN
                    ERROR(TXT50002);

                  RecLServiceItemLine.RESET;
                  RecLServiceItemLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceItemLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  IF NOT RecLServiceItemLine.FINDFIRST THEN
                    ERROR(TXT50004);

                  RecLServiceLine.RESET;
                  RecLServiceLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  //RecLServiceLine.SETRANGE(Warranty,TRUE);
                  IF NOT RecLServiceLine.FINDSET THEN
                    ERROR(TXT50005);

                  ServiceMgtSetup.GET;
                  RecLServiceOrderHeader.SetHideValidationDialog(TRUE);
                  RecLServiceOrderHeader.VALIDATE("Bill-to Customer No.",ServiceMgtSetup."Client Garantie Prolongé");
                  RecLServiceOrderHeader.MODIFY;

                  RecLServiceLine.FINDSET;
                  REPEAT
                    RecLServiceLine.SetHideReplacementDialog(TRUE);
                    RecLServiceLine.VALIDATE(Warranty,FALSE);
                    RecLServiceLine.VALIDATE("Warranty Disc. %",0);
                    RecLServiceLine.MODIFY;
                  UNTIL RecLServiceLine.NEXT = 0;

                  MESSAGE(TXT50015);
                END;
                //END SM 031215

                //SM MAZDA19

                TESTFIELD(Warranty,TRUE);

                RecLServiceOrderHeader.RESET;
                RecLServiceOrderHeader.SETRANGE("Reception No","Reception No");
                IF NOT RecLServiceOrderHeader.FINDFIRST THEN
                  ERROR(TXT50002);


                RecLServiceItemLine.RESET;
                RecLServiceItemLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                RecLServiceItemLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                IF NOT RecLServiceItemLine.FINDFIRST THEN
                  ERROR(TXT50004);


                RecLServiceLine.RESET;
                RecLServiceLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                RecLServiceLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                //SM 081215 RecLServiceLine.SETRANGE(Warranty,TRUE);
                IF NOT RecLServiceLine.FINDSET THEN
                  ERROR(TXT50005);




                IF ("Approval Warranty Service Post" = "Approval Warranty Service Post"::Approuver)
                 OR ("Approval Warranty Service Post"="Approval Warranty Service Post"::Refuser) THEN BEGIN
                  //SM 22/08/2014
                  RecLUserSetup.GET(USERID);
                  IF NOT RecLUserSetup."Approbation Garantie" THEN
                    ERROR(TXT50008);
                  //END SM
                  "App. W. Service Post User" := USERID;
                  "App. W. Service Post Date" := CURRENTDATETIME;
                END;

                //END SM
            end;
        }
        field(108;"Warranty Card Created By";Code[50])
        {
            Caption = 'Fiche de Garantie Créer Par';
            Description = 'SM';
        }
        field(109;"Warranty Card Modified By";Code[50])
        {
            Caption = 'Fiche de Garantie Modifier Par';
            Description = 'SM';
        }
        field(110;"Warranty Creation Date";DateTime)
        {
            Caption = 'Date Création Garantie';
            Description = 'SM';
        }
        field(111;"Warranty Modified Date";DateTime)
        {
            Caption = 'Date Modification Garantie';
            Description = 'SM';
        }
        field(112;"Sous Type de garantie";Option)
        {
            Caption = 'Sous Type de garantie';
            Description = 'SM';
            OptionCaption = '" ,Garantie PR et MO,Campagne,Garantie PR,Garantie MO,Garantie PR &MO&Campagne"';
            OptionMembers = " ","Garantie PR et MO",Compagne,"Garantie PR","Garantie MO","Garantie PR &MO&Campagne";

            trigger OnValidate();
            var
                RecLServiceOrderHeader : Record "5900";
                RecLServiceItemLine : Record "5901";
                RecLServiceLine : Record "5902";
                ServiceMgtSetup : Record "5911";
            begin
                IF Matricule <> '' THEN BEGIN
                IF "Sous Type de garantie" = "Sous Type de garantie"::Compagne THEN
                  BEGIN
                    RecItemService.SETRANGE(Matricule,Matricule);
                    IF RecItemService.FINDFIRST THEN BEGIN
                     RecItemService.CALCFIELDS(Compagne);
                     RecItemService.TESTFIELD(Compagne,TRUE);
                    END;
                  END;
                END
                ELSE BEGIN
                IF "Sous Type de garantie" = "Sous Type de garantie"::Compagne THEN
                  BEGIN
                    RecItemService.SETRANGE("Serial No.",VIN);
                    IF RecItemService.FINDFIRST THEN BEGIN
                     RecItemService.CALCFIELDS(Compagne);
                     RecItemService.TESTFIELD(Compagne,TRUE);
                    END;
                  END;
                END;
                //SM MAZDA19
                /*
                TESTFIELD("Type de garantie","Type de garantie"::"Garantie  Constructeur");
                //END SM
                
                //SM MAZDA101 22/07/2015
                //SM 031215
                //OLD IF (xRec."Sous Type de garantie" = "Sous Type de garantie"::"Garantie Prolongée") AND (Rec."Sous Type de garantie" <> "Sous Type de garantie"::"Garantie Prolongée") THEN
                //OLD   ERROR(TXT50014);
                
                IF "Sous Type de garantie" = "Sous Type de garantie"::Retour THEN BEGIN
                
                  RecLServiceOrderHeader.RESET;
                   RecLServiceOrderHeader.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type"::Order);
                  RecLServiceOrderHeader.SETRANGE("Reception No","Reception No");
                  IF NOT RecLServiceOrderHeader.FINDFIRST THEN
                    ERROR(TXT50002);
                
                  RecLServiceItemLine.RESET;
                  RecLServiceItemLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceItemLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  IF NOT RecLServiceItemLine.FINDFIRST THEN
                    ERROR(TXT50004);
                
                  RecLServiceLine.RESET;
                  RecLServiceLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  //RecLServiceLine.SETRANGE(Warranty,TRUE);
                  //OLD IF NOT RecLServiceLine.FINDSET THEN
                   //OLD ERROR(TXT50005);
                
                  ServiceMgtSetup.GET;
                  //SM ADD 211015
                  RecLServiceOrderHeader.SetHideValidationDialog(TRUE);
                  //END SM
                  RecLServiceOrderHeader.VALIDATE("Bill-to Customer No.",ServiceMgtSetup."Client Garantie Prolongé");
                  RecLServiceOrderHeader.MODIFY;
                
                  {SM 031215 OLD
                  RecLServiceLine.FINDSET;
                  REPEAT
                    RecLServiceLine.VALIDATE(Warranty,FALSE);
                    RecLServiceLine.VALIDATE("Warranty Disc. %",0);
                    RecLServiceLine.MODIFY;
                    //MESSAGE(RecLServiceLine.GETPOSITION);
                  UNTIL RecLServiceLine.NEXT = 0;
                  }
                
                END;
                //SM 031215
                IF (xRec."Sous Type de garantie" = xRec."Sous Type de garantie"::Retour) AND ("Sous Type de garantie" <> "Sous Type de garantie"::Retour)THEN BEGIN
                  RecLServiceOrderHeader.RESET;
                  RecLServiceOrderHeader.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type"::Order);
                  RecLServiceOrderHeader.SETRANGE("Reception No","Reception No");
                  IF NOT RecLServiceOrderHeader.FINDFIRST THEN
                    ERROR(TXT50002);
                
                  RecLServiceItemLine.RESET;
                  RecLServiceItemLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceItemLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  IF NOT RecLServiceItemLine.FINDFIRST THEN
                    ERROR(TXT50004);
                
                
                
                  ServiceMgtSetup.GET;
                  //SM ADD 211015
                  RecLServiceOrderHeader.SetHideValidationDialog(TRUE);
                  //END SM
                  RecLServiceOrderHeader.VALIDATE("Bill-to Customer No.",RecLServiceOrderHeader."Customer No.");
                  RecLServiceOrderHeader.MODIFY;
                  COMMIT;
                  RecLServiceLine.RESET;
                  RecLServiceLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  //RecLServiceLine.SETRANGE(Warranty,TRUE);
                  IF RecLServiceLine.FINDSET THEN BEGIN
                    REPEAT
                      RecLServiceLine.Warranty := TRUE;
                      RecLServiceLine.VALIDATE("Warranty Disc. %",100);
                      RecLServiceLine.MODIFY;
                      MESSAGE('G change %1 %2 %3 %4',RecLServiceLine.COUNT,RecLServiceLine."Unit Price",RecLServiceLine."Line Discount %",RecLServiceLine."Line Amount");
                    UNTIL RecLServiceLine.NEXT = 0;
                  END;
                  // RecLServiceLine.SETRANGE(Warranty,FALSE);
                
                END;
                //END SM 031215
                */
                //END SM

            end;
        }
        field(113;"App. W. Pick Request User";Code[50])
        {
            Caption = 'App. G. Demande Pièce Utilisateur';
            Description = 'SM';
        }
        field(114;"App. W. Service Post User";Code[50])
        {
            Caption = 'App. G. BL/Facturation Utilisateur';
            Description = 'SM';
        }
        field(116;"App. W. Pick Request Date";DateTime)
        {
            Caption = 'Date App. G. Demande Pièce';
            Description = 'SM';
        }
        field(117;"App. W. Service Post Date";DateTime)
        {
            Caption = 'Date App. G. BL/Facturation';
            Description = 'SM';
        }
        field(118;"Warranty Status";Option)
        {
            Caption = 'Statut Garantie';
            Description = 'SM';
            OptionMembers = " ","Fiche créée","Garantie approuvée","Bon pour facturation","Clôturée";
        }
        field(119;"Autoriser Travaux Sans Avance";Boolean)
        {
            Description = 'SM';
            Editable = false;

            trigger OnValidate();
            begin
                //SM MAZDA855
                "Autorisé SS Avance Par" := USERID;
                "Autorisé Le"            := CURRENTDATETIME;
                //END SM
            end;
        }
        field(120;"Autorisé SS Avance Par";Code[50])
        {
            Description = 'SM';
        }
        field(121;"Autorisé Le";DateTime)
        {
            Description = 'SM';
        }
        field(122;"Code Entretien";Code[30])
        {
            Description = 'SM MAZDA672';
            Editable = false;
            TableRelation = Item;
        }
        field(123;"Date Facturation";DateTime)
        {
            Description = 'KK';
        }
        field(50000;"Type Effet CLT";Option)
        {
            Description = 'NM181016';
            OptionCaption = 'EFFET CLIENT,LDT';
            OptionMembers = "EFFET CLIENT",LDT;
        }
        field(50001;ACCEPTE;Boolean)
        {
            Description = 'NM181016';
        }
        field(50002;"Nbre Heures Affecté";Decimal)
        {
            Description = 'SAV0045';
        }
        field(50003;"Clôturés";Boolean)
        {
            Description = 'SAV0045';
        }
        field(50004;"Chef d'équipe";Code[10])
        {
            Description = 'SAV0045';
            TableRelation = Resource;
        }
        field(50005;"No Réception Origine";Code[20])
        {
            Caption = '"No Réception Origine "';
            TableRelation = "Reception SAV"."Reception No" WHERE (Service Type=CONST(Big Service),
                                                                  VIN=FIELD(VIN),
                                                                  Status SR=CONST(Facturée));
            ValidateTableRelation = false;
        }
        field(50006;Retour;Boolean)
        {

            trigger OnValidate();
            begin
                IF NOT (Retour ) THEN
                  "No Réception Origine":='';
            end;
        }
        field(50007;"Approval Return Pick Request";Option)
        {
            Caption = 'Approbation retour';
            Description = 'SM Ouvert, Encours, Approuver, Refuser';
            Editable = false;
            OptionCaption = 'Ouvert,Encours,Approuvé,Refusé';
            OptionMembers = Ouvert,"En cours",Approuver,Refuser;

            trigger OnValidate();
            var
                RecLUserSetup : Record "91";
            begin
                //SM 22/08/2014
                IF ("Approval Warranty Pick Request" = "Approval Warranty Pick Request"::Encours)
                 AND (xRec."Approval Warranty Pick Request"<>"Approval Warranty Pick Request"::Ouvert) THEN BEGIN
                  ERROR(TXT50013);
                END;
                //END SM

                IF ("Approval Warranty Pick Request" = "Approval Warranty Pick Request"::Approuver)
                 OR ("Approval Warranty Pick Request"="Approval Warranty Pick Request"::Refuser) THEN BEGIN
                  //SM MAZDA19
                  RecLUserSetup.GET(USERID);
                  IF NOT RecLUserSetup."Approbation Garantie" THEN
                    ERROR(TXT50008);
                  //END SM

                  //SM 22/08/2014
                  TESTFIELD("Type de garantie");
                  IF "Type de garantie" = "Type de garantie"::"Garantie  Constructeur" THEN
                    TESTFIELD("Sous Type de garantie");
                  //END SM

                  "App. W. Pick Request User" := USERID;
                  "App. W. Pick Request Date" := CURRENTDATETIME;
                END;
            end;
        }
        field(50008;"Approval Return Service Post";Option)
        {
            Caption = 'Approbation Retour BL/Facturation';
            Description = 'SM Ouvert, Encours, Approuver, Refuser';
            Editable = false;
            OptionMembers = Ouvert,Encours,Approuver,Refuser;

            trigger OnValidate();
            var
                RecLUserSetup : Record "91";
                RecLServiceOrderHeader : Record "5900";
                RecLServiceItemLine : Record "5901";
                RecLServiceLine : Record "5902";
                ServiceMgtSetup : Record "5911";
            begin
                //SM 22/08/2014
                IF ("Approval Warranty Service Post" = "Approval Warranty Service Post"::Encours)
                 AND (xRec."Approval Warranty Service Post"<>"Approval Warranty Service Post"::Ouvert) THEN BEGIN
                  ERROR(TXT50013);
                END;
                //END SM

                //SM 031215
                IF "Sous Type de garantie" = "Sous Type de garantie"::Compagne THEN BEGIN
                  RecLServiceOrderHeader.RESET;
                   RecLServiceOrderHeader.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type"::Order);
                  RecLServiceOrderHeader.SETRANGE("Reception No","Reception No");
                  IF NOT RecLServiceOrderHeader.FINDFIRST THEN
                    ERROR(TXT50002);

                  RecLServiceItemLine.RESET;
                  RecLServiceItemLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceItemLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  IF NOT RecLServiceItemLine.FINDFIRST THEN
                    ERROR(TXT50004);

                  RecLServiceLine.RESET;
                  RecLServiceLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  //RecLServiceLine.SETRANGE(Warranty,TRUE);
                  IF NOT RecLServiceLine.FINDSET THEN
                    ERROR(TXT50005);

                  ServiceMgtSetup.GET;
                  RecLServiceOrderHeader.SetHideValidationDialog(TRUE);
                  RecLServiceOrderHeader.VALIDATE("Bill-to Customer No.",ServiceMgtSetup."Client Garantie Prolongé");
                  RecLServiceOrderHeader.MODIFY;

                  RecLServiceLine.FINDSET;
                  REPEAT
                    RecLServiceLine.SetHideReplacementDialog(TRUE);
                    RecLServiceLine.VALIDATE(Warranty,FALSE);
                    RecLServiceLine.VALIDATE("Warranty Disc. %",0);
                    RecLServiceLine.MODIFY;
                  UNTIL RecLServiceLine.NEXT = 0;

                  MESSAGE(TXT50015);
                END;
                //END SM 031215

                //SM MAZDA19

                TESTFIELD(Warranty,TRUE);

                RecLServiceOrderHeader.RESET;
                RecLServiceOrderHeader.SETRANGE("Reception No","Reception No");
                IF NOT RecLServiceOrderHeader.FINDFIRST THEN
                  ERROR(TXT50002);


                RecLServiceItemLine.RESET;
                RecLServiceItemLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                RecLServiceItemLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                IF NOT RecLServiceItemLine.FINDFIRST THEN
                  ERROR(TXT50004);


                RecLServiceLine.RESET;
                RecLServiceLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                RecLServiceLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                //SM 081215 RecLServiceLine.SETRANGE(Warranty,TRUE);
                IF NOT RecLServiceLine.FINDSET THEN
                  ERROR(TXT50005);




                IF ("Approval Warranty Service Post" = "Approval Warranty Service Post"::Approuver)
                 OR ("Approval Warranty Service Post"="Approval Warranty Service Post"::Refuser) THEN BEGIN
                  //SM 22/08/2014
                  RecLUserSetup.GET(USERID);
                  IF NOT RecLUserSetup."Approbation Garantie" THEN
                    ERROR(TXT50008);
                  //END SM
                  "App. W. Service Post User" := USERID;
                  "App. W. Service Post Date" := CURRENTDATETIME;
                END;

                //END SM
            end;
        }
        field(50009;"Payment Method Code";Option)
        {
            CaptionML = ENU='Payment Method Code',
                        FRA='Mode de règlement';
            Description = 'NM211116';
            OptionCaption = '" ,Espèce,Chéque,Traite,Bon de commande"';
            OptionMembers = " ","Espèce","Chéque",Traite,"Bon de commande";

            trigger OnValidate();
            var
                PaymentMethod : Record "289";
            begin
            end;
        }
        field(50010;RIB;Code[20])
        {
            Description = 'NM211116';

            trigger OnValidate();
            begin

                IF "Payment Method Code"="Payment Method Code"::Chéque THEN
                    IF STRLEN(RIB)<20 THEN
                      ERROR(TXT50016);
            end;
        }
        field(50011;"Nom CH";Text[50])
        {
            Description = 'NM211116';
        }
        field(50012;Intern;Boolean)
        {
            Caption = 'Interne';
            Description = 'SM SAVF001';
        }
        field(50013;"Approval Intern Pick Request";Option)
        {
            Caption = 'Approbation Interne Demande Pièce';
            Description = 'SM SAVF001';
            Editable = false;
            OptionMembers = Ouvert,Encours,Approuver,Refuser;

            trigger OnValidate();
            var
                RecLUserSetup : Record "91";
            begin
                //SM 22/08/2014
                IF ("Approval Warranty Pick Request" = "Approval Warranty Pick Request"::Encours)
                 AND (xRec."Approval Warranty Pick Request"<>"Approval Warranty Pick Request"::Ouvert) THEN BEGIN
                  ERROR(TXT50013);
                END;
                //END SM

                IF ("Approval Warranty Pick Request" = "Approval Warranty Pick Request"::Approuver)
                 OR ("Approval Warranty Pick Request"="Approval Warranty Pick Request"::Refuser) THEN BEGIN
                  //SM MAZDA19
                  RecLUserSetup.GET(USERID);
                  IF NOT RecLUserSetup."Approbation Garantie" THEN
                    ERROR(TXT50008);
                  //END SM

                  //SM 22/08/2014
                  TESTFIELD("Type de garantie");
                  IF "Type de garantie" = "Type de garantie"::"Garantie  Constructeur" THEN
                    TESTFIELD("Sous Type de garantie");
                  //END SM

                  "App. W. Pick Request User" := USERID;
                  "App. W. Pick Request Date" := CURRENTDATETIME;
                END;
            end;
        }
        field(50014;"Approval Intern Service Post";Option)
        {
            Caption = 'Approbation Interne BL/Facturation';
            Description = 'SM SAVF001';
            Editable = false;
            OptionMembers = Ouvert,Encours,Approuver,Refuser;

            trigger OnValidate();
            var
                RecLUserSetup : Record "91";
                RecLServiceOrderHeader : Record "5900";
                RecLServiceItemLine : Record "5901";
                RecLServiceLine : Record "5902";
                ServiceMgtSetup : Record "5911";
            begin
                //SM 22/08/2014
                IF ("Approval Warranty Service Post" = "Approval Warranty Service Post"::Encours)
                 AND (xRec."Approval Warranty Service Post"<>"Approval Warranty Service Post"::Ouvert) THEN BEGIN
                  ERROR(TXT50013);
                END;
                //END SM

                //SM 031215
                IF "Sous Type de garantie" = "Sous Type de garantie"::Compagne THEN BEGIN
                  RecLServiceOrderHeader.RESET;
                   RecLServiceOrderHeader.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type"::Order);
                  RecLServiceOrderHeader.SETRANGE("Reception No","Reception No");
                  IF NOT RecLServiceOrderHeader.FINDFIRST THEN
                    ERROR(TXT50002);

                  RecLServiceItemLine.RESET;
                  RecLServiceItemLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceItemLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  IF NOT RecLServiceItemLine.FINDFIRST THEN
                    ERROR(TXT50004);

                  RecLServiceLine.RESET;
                  RecLServiceLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  //RecLServiceLine.SETRANGE(Warranty,TRUE);
                  IF NOT RecLServiceLine.FINDSET THEN
                    ERROR(TXT50005);

                  ServiceMgtSetup.GET;
                  RecLServiceOrderHeader.SetHideValidationDialog(TRUE);
                  RecLServiceOrderHeader.VALIDATE("Bill-to Customer No.",ServiceMgtSetup."Client Garantie Prolongé");
                  RecLServiceOrderHeader.MODIFY;

                  RecLServiceLine.FINDSET;
                  REPEAT
                    RecLServiceLine.SetHideReplacementDialog(TRUE);
                    RecLServiceLine.VALIDATE(Warranty,FALSE);
                    RecLServiceLine.VALIDATE("Warranty Disc. %",0);
                    RecLServiceLine.MODIFY;
                  UNTIL RecLServiceLine.NEXT = 0;

                  MESSAGE(TXT50015);
                END;
                //END SM 031215

                //SM MAZDA19

                TESTFIELD(Warranty,TRUE);

                RecLServiceOrderHeader.RESET;
                RecLServiceOrderHeader.SETRANGE("Reception No","Reception No");
                IF NOT RecLServiceOrderHeader.FINDFIRST THEN
                  ERROR(TXT50002);


                RecLServiceItemLine.RESET;
                RecLServiceItemLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                RecLServiceItemLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                IF NOT RecLServiceItemLine.FINDFIRST THEN
                  ERROR(TXT50004);


                RecLServiceLine.RESET;
                RecLServiceLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                RecLServiceLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                //SM 081215 RecLServiceLine.SETRANGE(Warranty,TRUE);
                IF NOT RecLServiceLine.FINDSET THEN
                  ERROR(TXT50005);

                IF ("Approval Warranty Service Post" = "Approval Warranty Service Post"::Approuver)
                 OR ("Approval Warranty Service Post"="Approval Warranty Service Post"::Refuser) THEN BEGIN
                  //SM 22/08/2014
                  RecLUserSetup.GET(USERID);
                  IF NOT RecLUserSetup."Approbation Garantie" THEN
                    ERROR(TXT50008);
                  //END SM
                  "App. W. Service Post User" := USERID;
                  "App. W. Service Post Date" := CURRENTDATETIME;
                END;

                //END SM
            end;
        }
        field(50015;"Intern Type";Option)
        {
            CaptionML = ENU='Intern type',
                        FRA='Type Interne';
            Description = 'SM SAVF001';
            OptionMembers = " ","Voiture de Service Auto","Interne Commercial","Interne  Atelier","Soutien commercial DG","Soutien atelier DG","Cadeau Fidélité";

            trigger OnValidate();
            var
                LRecServiceMgtSetup : Record "5911";
            begin
                /*IF "Intern Type"="Intern Type"::"Voiture de Service Auto" THEN BEGIN
                  LRecServiceMgtSetup.GET;
                  TESTFIELD("Customer No.",LRecServiceMgtSetup."Client facturé VS Auto")
                END;*/

            end;
        }
        field(50016;"Last Modification Date";Date)
        {
            CaptionML = ENU='Last Modification Date',
                        FRA='Date Dernière Modification';
            Description = 'KT';
            Editable = false;
        }
        field(50017;"Modified By";Code[50])
        {
            CaptionML = ENU='Modified By',
                        FRA='Modifié Par';
            Description = 'KT';
            Editable = false;
        }
        field(50018;"Last Modification Time";Time)
        {
            CaptionML = ENU='Last Modification Time',
                        FRA='Heure Modification';
            Description = 'KT';
            Editable = false;
        }
        field(50019;"Nbre Impressions";Integer)
        {
        }
        field(50020;"Printed By";Code[50])
        {
        }
        field(50021;"Printing Date";Date)
        {
        }
        field(50022;"Date Mise en Circulation";Date)
        {
            Description = 'NM130317';
        }
        field(50023;"Code Type Garantie";Code[20])
        {
            Description = 'KT15032017';
            TableRelation = "Type Garantie";

            trigger OnValidate();
            begin
                TypeGarantie.RESET;
                IF TypeGarantie.GET("Code Type Garantie" ) THEN
                  "Désignation Type Garantie":=TypeGarantie.Description;
            end;
        }
        field(50024;"Désignation Type Garantie";Text[30])
        {
            Description = 'KT15032017';
        }
        field(50025;"RC Garage";Boolean)
        {
            Description = 'NM230317';

            trigger OnValidate();
            begin
                IF NOT "RC Garage" THEN
                  VALIDATE("No Réception Origine RC",'');
            end;
        }
        field(50026;"Kilométrage";Integer)
        {
            CalcFormula = Lookup(Controle.Kilometrage WHERE (Id=FIELD(Reception No)));
            Description = 'KT 24032017';
            FieldClass = FlowField;

            trigger OnValidate();
            var
                LRecServiceItem : Record "5940";
                LRecReceptionSAV : Record "60008";
            begin
                /*IF Kilométrage<100000 THEN BEGIN
                  CALCFIELDS(VIN);
                  LRecServiceItem.RESET;
                  LRecServiceItem.SETRANGE("Serial No.",VIN);
                  LRecServiceItem.FINDFIRST;
                  IF CALCDATE('3A',LRecServiceItem."Date Mise en Circulation")>=TODAY THEN BEGIN
                    "Type de garantie":="Type de garantie"::"Garantie  Constructeur";
                  END ELSE IF CALCDATE('2A',LRecServiceItem."Date Mise en Circulation")>=TODAY THEN
                    "Type de garantie":="Type de garantie"::"Garantie  Prolongé"
                  ELSE "Type de garantie":="Type de garantie"::"Payant par Client";
                END;
                */

            end;
        }
        field(50027;"Workshop chief comment";Text[200])
        {
            CaptionML = ENU='Workshop chief comment',
                        FRA='Commentaire du chef d''atelier';
            Description = 'KT 19042017 Retour';
        }
        field(50028;"Team chief comment";Text[200])
        {
            CaptionML = ENU='Team chief comment',
                        FRA='Commentaire du chef d''équipe';
            Description = 'KT 19042017 Retour';
        }
        field(50029;"Workshop chief approval";Boolean)
        {
            CaptionML = ENU='Workshop chief approval',
                        FRA='Approbation chef atelier';
            Description = 'KT 19042017 Retour';
        }
        field(50030;"Team chief approval";Boolean)
        {
            CaptionML = ENU='Team chief approval',
                        FRA='Approbation chef d''équipe ';
            Description = 'KT 19042017 Retour';
        }
        field(50031;"Service manager approval";Boolean)
        {
            CaptionML = ENU='Service manager approval',
                        FRA='Approbation Directeur Technique/Site';
            Description = 'KT 19042017 Retour';
        }
        field(50032;"Assurances conventionnées";Boolean)
        {
            Description = 'NM270417';

            trigger OnValidate();
            begin
                IF NOT "Assurances conventionnées" THEN
                  VALIDATE("Code assureur conventionné",'');
            end;
        }
        field(50033;"Code assureur conventionné";Code[20])
        {
            Description = 'KT 28042017';
            TableRelation = "Insurance firm";

            trigger OnValidate();
            begin
                IF Insurancefirm.GET("Code assureur conventionné") THEN
                "Nom assureur conventionné":=Insurancefirm.Description
                ELSE "Nom assureur conventionné":='';
            end;
        }
        field(50034;"Nom assureur conventionné";Text[50])
        {
            Description = 'KT 28042017';
        }
        field(50035;"Commentaire SAV";Text[250])
        {
            Description = 'KT 18052017';
        }
        field(50036;"Last repair No.";Code[20])
        {
            CaptionML = ENU='Last repair No.',
                        FRA='N° dernière intervention';
            Description = 'KT 19052017';
            Editable = false;
            FieldClass = Normal;
            TableRelation = "Reception SAV";
        }
        field(50037;"No Réception Origine RC";Code[20])
        {
            Caption = '"No Réception Origine "';
            Description = 'KT 24052017';
            TableRelation = "Reception SAV"."Reception No" WHERE (VIN=FIELD(VIN));

            trigger OnValidate();
            begin
                //SM030817
                IF "No Réception Origine RC" = Rec."Reception No" THEN
                    ERROR('Vous devez choisir un autre OR différent de OR encours');
            end;
        }
        field(50038;"Assurances groupe";Boolean)
        {
            Caption = 'Assurance';
            Description = 'KT 140617';

            trigger OnValidate();
            begin
                IF NOT "Assurances groupe" THEN BEGIN
                  VALIDATE("Type assurances groupe",0);
                  "No Réception Origine RC":='';
                  END;
            end;
        }
        field(50039;"Type assurances groupe";Option)
        {
            Caption = 'Type assurance';
            Description = 'KT 140617';
            OptionMembers = " ",Avarie,"RC Garage","Sinistre RC Transport","Assurances carrosserie VS Auto","Assurances carrosserie VS Gros";

            trigger OnValidate();
            begin
                /*//TMP KAIS IMPORT OR IF "Type assurances groupe"="Type assurances groupe"::Avarie THEN BEGIN
                  TESTFIELD("N° constat avarie");
                 IF NOT FctGetInfoServiceITem THEN
                   ERROR('Le véhicule %1 doit être constaté avarie',VIN);
                END;
                */

            end;
        }
        field(50040;"N° OR Archive";Code[20])
        {

            trigger OnValidate();
            var
                LReceptionSAV : Record "60008";
            begin
                //SM 070717
                LReceptionSAV.RESET;
                LReceptionSAV.SETRANGE("N° OR Archive","N° OR Archive");
                LReceptionSAV.SETFILTER("Reception No",'<>%1',"Reception No");
                IF LReceptionSAV.FINDSET THEN
                  ERROR('Existe déjà')
                //END SM
            end;
        }
        field(50041;Personnel;Boolean)
        {
            Caption = 'Personnel';
        }
        field(50042;"Num BC";Code[30])
        {
            Description = 'NM 040817';
        }
        field(50043;"Renoncer campagne";Boolean)
        {
        }
        field(50044;"N° acceptation constructeur";Code[30])
        {
        }
        field(50045;"Date acceptation";Date)
        {

            trigger OnLookup();
            var
                LRecListVINCompagne : Record "50076";
            begin
            end;
        }
        field(50046;"N° campagne";Code[20])
        {
            CaptionML = ENU='N° campagne',
                        FRA='N° campagne';
            Description = 'KT 090817';
            TableRelation = "List VIN Compagne".Code WHERE (Traiter=CONST(No),
                                                            VIN=FIELD(VIN),
                                                            En cours de traitement=CONST(No));

            trigger OnValidate();
            var
                LRecListVINCompagne : Record "50076";
            begin
            end;
        }
        field(70120;"Entretien 10 000";Boolean)
        {
            Description = 'SM AURES170817';
        }
        field(70121;"Entretien 20 000";Boolean)
        {
            Description = 'SM AURES170817';
        }
        field(70122;"Entretien 30 000";Boolean)
        {
            Description = 'SM AURES170817';
        }
        field(70123;"OR Entretien 10 000";Code[20])
        {
            CalcFormula = Lookup("Reception SAV"."Reception No" WHERE (VIN=FIELD(VIN),
                                                                       Code Entretien=CONST(E10000),
                                                                       Entretien 10 000=CONST(Yes)));
            Description = 'SM AURES170817';
            FieldClass = FlowField;
        }
        field(70124;"OR Entretien 20 000";Code[20])
        {
            CalcFormula = Lookup("Reception SAV"."Reception No" WHERE (VIN=FIELD(VIN),
                                                                       Code Entretien=CONST(E20000),
                                                                       Entretien 20 000=CONST(Yes)));
            Description = 'SM AURES170817';
            FieldClass = FlowField;
        }
        field(70125;"OR Entretien 30 000";Code[20])
        {
            CalcFormula = Lookup("Reception SAV"."Reception No" WHERE (VIN=FIELD(VIN),
                                                                       Code Entretien=CONST(E30000),
                                                                       Entretien 30 000=CONST(Yes)));
            Description = 'SM AURES170817';
            FieldClass = FlowField;
        }
        field(70126;"App. Insuranc  Service Post";Option)
        {
            Caption = 'Approbation Assurance BL/Facturation';
            Description = 'SM Ouvert, Encours, Approuver, Refuser';
            Editable = false;
            OptionMembers = Ouvert,Encours,Approuver,Refuser;

            trigger OnValidate();
            var
                RecLUserSetup : Record "91";
                RecLServiceOrderHeader : Record "5900";
                RecLServiceItemLine : Record "5901";
                RecLServiceLine : Record "5902";
                ServiceMgtSetup : Record "5911";
            begin
                //SM 22/08/2014
                IF ("Approval Warranty Service Post" = "Approval Warranty Service Post"::Encours)
                 AND (xRec."Approval Warranty Service Post"<>"Approval Warranty Service Post"::Ouvert) THEN BEGIN
                  ERROR(TXT50013);
                END;
                //END SM

                //SM 031215
                IF "Sous Type de garantie" = "Sous Type de garantie"::Compagne THEN BEGIN
                  RecLServiceOrderHeader.RESET;
                   RecLServiceOrderHeader.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type"::Order);
                  RecLServiceOrderHeader.SETRANGE("Reception No","Reception No");
                  IF NOT RecLServiceOrderHeader.FINDFIRST THEN
                    ERROR(TXT50002);

                  RecLServiceItemLine.RESET;
                  RecLServiceItemLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceItemLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  IF NOT RecLServiceItemLine.FINDFIRST THEN
                    ERROR(TXT50004);

                  RecLServiceLine.RESET;
                  RecLServiceLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                  RecLServiceLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                  //RecLServiceLine.SETRANGE(Warranty,TRUE);
                  IF NOT RecLServiceLine.FINDSET THEN
                    ERROR(TXT50005);

                  ServiceMgtSetup.GET;
                  RecLServiceOrderHeader.SetHideValidationDialog(TRUE);
                  RecLServiceOrderHeader.VALIDATE("Bill-to Customer No.",ServiceMgtSetup."Client Garantie Prolongé");
                  RecLServiceOrderHeader.MODIFY;

                  RecLServiceLine.FINDSET;
                  REPEAT
                    RecLServiceLine.SetHideReplacementDialog(TRUE);
                    RecLServiceLine.VALIDATE(Warranty,FALSE);
                    RecLServiceLine.VALIDATE("Warranty Disc. %",0);
                    RecLServiceLine.MODIFY;
                  UNTIL RecLServiceLine.NEXT = 0;

                  MESSAGE(TXT50015);
                END;
                //END SM 031215

                //SM MAZDA19

                TESTFIELD(Warranty,TRUE);

                RecLServiceOrderHeader.RESET;
                RecLServiceOrderHeader.SETRANGE("Reception No","Reception No");
                IF NOT RecLServiceOrderHeader.FINDFIRST THEN
                  ERROR(TXT50002);


                RecLServiceItemLine.RESET;
                RecLServiceItemLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                RecLServiceItemLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                IF NOT RecLServiceItemLine.FINDFIRST THEN
                  ERROR(TXT50004);


                RecLServiceLine.RESET;
                RecLServiceLine.SETRANGE("Document Type",RecLServiceOrderHeader."Document Type");
                RecLServiceLine.SETRANGE("Document No.",RecLServiceOrderHeader."No.");
                //SM 081215 RecLServiceLine.SETRANGE(Warranty,TRUE);
                IF NOT RecLServiceLine.FINDSET THEN
                  ERROR(TXT50005);




                IF ("Approval Warranty Service Post" = "Approval Warranty Service Post"::Approuver)
                 OR ("Approval Warranty Service Post"="Approval Warranty Service Post"::Refuser) THEN BEGIN
                  //SM 22/08/2014
                  RecLUserSetup.GET(USERID);
                  IF NOT RecLUserSetup."Approbation Garantie" THEN
                    ERROR(TXT50008);
                  //END SM
                  "App. W. Service Post User" := USERID;
                  "App. W. Service Post Date" := CURRENTDATETIME;
                END;

                //END SM
            end;
        }
        field(70127;"N° constat avarie";Code[20])
        {
            CaptionML = ENU='N° constat avarie',
                        FRA='N° constat avarie';
            TableRelation = "Liste de VIN en avarie".No. WHERE (VIN=FIELD(VIN));
        }
        field(70128;"Demande Garantie";Boolean)
        {
            Description = 'RA';

            trigger OnValidate();
            begin
                IF NOT "Demande Garantie" THEN
                  VALIDATE("Type de garantie","Type de garantie"::"Payant par Client");
            end;
        }
        field(70129;"Demande approbation garantie";Boolean)
        {
            Description = 'KT 070917';
        }
        field(70130;"Facture vente source";Code[20])
        {
            Description = 'KT 230617 source garantie pièces';

            trigger OnLookup();
            var
                LRecSalesInvoiceHeader : Record "112";
                LPagePostedSalesInvoices : Page "143";
            begin
                LRecSalesInvoiceHeader.RESET;
                LRecSalesInvoiceHeader.SETRANGE("Order Type",LRecSalesInvoiceHeader."Order Type"::PR);
                IF LRecSalesInvoiceHeader.FINDFIRST THEN BEGIN
                  LPagePostedSalesInvoices.LOOKUPMODE(TRUE);
                  LPagePostedSalesInvoices.SETRECORD(LRecSalesInvoiceHeader);
                  LPagePostedSalesInvoices.SETTABLEVIEW(LRecSalesInvoiceHeader);
                  IF LPagePostedSalesInvoices.RUNMODAL = ACTION::LookupOK THEN BEGIN
                    LPagePostedSalesInvoices.GETRECORD(LRecSalesInvoiceHeader);
                    "Facture vente source":=LRecSalesInvoiceHeader."No.";
                    "Name 2":=LRecSalesInvoiceHeader."Sell-to Customer Name";
                  END;
                END;
            end;
        }
        field(70131;"Type avarie";Option)
        {
            Description = 'KT 231017';
            OptionMembers = " ","Assurance Port","Assurance Parc",Transporteur;
        }
        field(70132;"Clinet facturé transport avari";Code[20])
        {
        }
        field(70133;"Date Facture OR";Date)
        {
            CalcFormula = Lookup("Service Invoice Header"."Posting Date" WHERE (Reception No=FIELD(Reception No)));
            Description = 'SM 21117';
            FieldClass = FlowField;
        }
        field(70134;"Garantie prolongée exception";Boolean)
        {
            Description = 'KT 130418';
        }
        field(70135;"Lieu de Livraison";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'RDV';
            OptionMembers = ,Atelier,"Déplacement";
        }
        field(70136;"nombre heure";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'RDV';
        }
        field(70137;"No. RDV";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'RDV';
        }
        field(70152;"Code Titre Client";Code[20])
        {
            CalcFormula = Lookup(Customer."Code Titre" WHERE (No.=FIELD(Customer No.)));
            Description = 'SM 280419';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70153;"Avance sur commande";Decimal)
        {
            CalcFormula = Lookup("Service Header"."Avance sur commande" WHERE (Reception No=FIELD(Reception No),
                                                                               Document Type=CONST(Order)));
            Caption = 'Avance sur commande';
            Description = 'SM MAZDA856';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70154;"Type avance";Option)
        {
            CalcFormula = Lookup("Service Header"."Type avance" WHERE (Reception No=FIELD(Reception No),
                                                                       Document Type=CONST(Order)));
            FieldClass = FlowField;
            OptionCaptionML = ENU=' ,Avance,Bon de Commande,Particulier',
                              FRA=' ,Avance,Bon de Commande,Particulier';
            OptionMembers = " ",Avance,"Bon de Commande",Particulier;
        }
        field(70155;"Report blocage (jours)";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'KT020620';

            trigger OnValidate();
            begin
                UserSetup.GET(USERID);
                IF NOT UserSetup."Reporter blocage OR" THEN
                  ERROR('Vous n''avez pas le droit de reporter le blocage');
            end;
        }
        field(70156;"TWC Number";Text[15])
        {
            DataClassification = ToBeClassified;
            Description = 'NM091220';

            trigger OnValidate();
            begin
                //<<---NM091220---
                UserSetup.GET(USERID);
                IF NOT UserSetup.Acces_garantie THEN
                  ERROR('Opération interdite pour l''utilisateur %1',USERID);
                //>>END
            end;
        }
        field(70157;"TWC Labor Hours";Text[15])
        {
            DataClassification = ToBeClassified;
            Description = 'NM091220';

            trigger OnValidate();
            begin
                //<<---NM091220---
                UserSetup.GET(USERID);
                IF NOT UserSetup.Acces_garantie THEN
                  ERROR('Opération interdite pour l''utilisateur %1',USERID);
                //>>END
            end;
        }
        field(70158;"TWC parts Amount";Text[15])
        {
            DataClassification = ToBeClassified;
            Description = 'NM091220';

            trigger OnValidate();
            begin
                //<<---NM091220---
                UserSetup.GET(USERID);
                IF NOT UserSetup.Acces_garantie THEN
                  ERROR('Opération interdite pour l''utilisateur %1',USERID);
                //>>END
            end;
        }
        field(70159;"TWC Situation";Text[15])
        {
            DataClassification = ToBeClassified;
            Description = 'NM091220';

            trigger OnValidate();
            begin
                //<<---NM091220---
                UserSetup.GET(USERID);
                IF NOT UserSetup.Acces_garantie THEN
                  ERROR('Opération interdite pour l''utilisateur %1',USERID);
                //>>END
            end;
        }
    }

    keys
    {
        key(Key1;"Reception No")
        {
        }
        key(Key2;VIN)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        RecLigneRapide : Record "60010";
        RecLigneGrandR : Record "60012";
    begin

        CLEAR(UserSetup);
        UserSetup.GET(USERID);
        UserSetup.TESTFIELD("Supprimer Or en cours");
        //SM 03/12/14
        TESTFIELD("Status SR","Status SR"::"Fiche Crée");
        //END SM

        //<< si type document est Service Rapide alors n'autoriser la suppression que si le statut est crée sinon afficher message d'erreure
        IF "Service Type"="Service Type"::"Rapid Service" THEN
            BEGIN
            IF "Status SR" = "Status SR"::"Fiche Crée" THEN
            BEGIN
                // Rapid service = supprimer les lignes correspondante s'il existent
                RecLigneRapide.SETRANGE("Reception No.","Reception No");
                IF RecLigneRapide.FINDFIRST THEN
                REPEAT
                    RecLigneRapide.DELETE;
                UNTIL RecLigneRapide.NEXT = 0;
            END
            ELSE ERROR('Vous n''êtes pas autorisée à supprimer la Fiche de réception N° %1 car le status de la fiche est déja %2 !',"Reception No","Status SR");
        END
        //<< si type document est Service grande réparation alors n'autoriser la suppression que si le statut est crée sinon afficher message d'erreure
        ELSE
        BEGIN
            RecLigneGrandR.SETRANGE(RecLigneGrandR."Reception No","Reception No");
            IF RecLigneGrandR.FINDFIRST THEN
            REPEAT
            // grande réparation = supprimer ligne symptomes
              RecLigneGrandR.DELETE;
            UNTIL RecLigneGrandR.NEXT = 0;
        END;
    end;

    trigger OnInsert();
    var
        NoSeriesMgt : Codeunit "396";
        ServiceSetup : Record "5911";
    begin
        CLEAR(ServiceSetup);
        ServiceSetup.GET;
        IF "Reception No" = '' THEN BEGIN
          NoSeriesMgt.InitSeries(ServiceSetup."No Reception",xRec."No. Series","Creation date","Reception No","No. Series");
        END;
        "Created By"  := USERID ;
        IF "Creation date"=0D THEN
        "Creation date" := TODAY ;
        "Heur creation" := TIME;
        "Reception Date":=WORKDATE;

        IF UserMgt.GetServiceFilter <> '' THEN BEGIN

            "Responsibility Center" := UserMgt.GetServiceFilter;
        END;
    end;

    trigger OnModify();
    begin
         //KT  07/02/17
        "Last Modification Date":=WORKDATE;
        "Modified By"           :=USERID;
        "Last Modification Time":=TIME;
        //END KT
    end;

    trigger OnRename();
    begin
        //SM MAZDA06
        // tmp ERROR(Text003,TABLECAPTION);
        //END SM
    end;

    var
        RecItemService : Record "5940";
        Text0001 : Label 'Véhicule avec Immatricule N° %1 n''existe pas,\Essayer de rechercher par N° Chassis.';
        Text0002 : Label 'Véhicule avec Chassi N° %1 n''existe pas.';
        UserMgt : Codeunit "5700";
        RecGItem : Record "27";
        Text003 : TextConst ENU='You cannot rename a %1.',FRA='Vous ne pouvez pas renommer l''enregistrement %1.';
        TXT50000 : TextConst ENU='You cannot rename a %1.',FRA='Fiche de garantie Déjà crée.';
        TXT50001 : TextConst ENU='You cannot rename a %1.',FRA='If faut créer la fiche garantie avant la cération de la commande Service. Merci de refaire le dossier de réception.';
        TXT50002 : TextConst ENU='You cannot rename a %1.',FRA='Vous n''avez pas besoin d''approbation, il n''existe pas de commande Service pour cette réception.';
        TXT50003 : TextConst ENU='You cannot rename a %1.',FRA='Déjà Approuvé.';
        TXT50004 : TextConst ENU='You cannot rename a %1.',FRA='Vous n''avez pas besoin d''approbation, il n''existe pas de ligne article de service pour la  commande Service liée à la réception.';
        TXT50005 : TextConst ENU='You cannot rename a %1.',FRA='Vous n''avez pas besoin Refuser l''approbation, il y''a des lignes facturées avec remise garantie.';
        TXT50006 : TextConst ENU='You cannot rename a %1.',FRA='Déjà Refusé.';
        TXT50007 : TextConst ENU='You cannot rename a %1.',FRA='Il n''y a rien à approuver.';
        TXT50008 : TextConst ENU='You cannot rename a %1.',FRA='Vous n''avez pas l''autorisation approbation Garantie.';
        TXT50009 : TextConst ENU='You cannot rename a %1.',FRA='KM doit être remplit dans le contrôle visuel.';
        TXT50010 : TextConst ENU='You cannot rename a %1.',FRA='Sous Type Garantie doit être remplit.';
        TXT50011 : TextConst ENU='You cannot rename a %1.',FRA='Kilométrage ne doit pas dépasser 100 000 KM pour le type de garantie "Prolongé".';
        TXT50012 : Label 'Date Garantie à expirer.';
        RecGservicemgtsetup : Record "5911";
        TXT50013 : Label 'Demande approbation déjà faite!';
        TXT50014 : Label 'Vous ne pouvez pas changer la garantie Prolongé';
        TXT50015 : Label 'Le client facturé ainsi que les lignes services sont modifiées pour satisfaire le sous type garantie prolongée';
        RecPaymentMethod : Record "289";
        TXT50016 : Label 'Votre RIB doit avoir 20 caractères!!';
        TypeGarantie : Record "60071";
        Insurancefirm : Record "60072";
        ListVINCompagne : Record "50076";
        UserSetup : Record "91";
        TXT50017 : Label 'Vous ne pouvez pas changer type OR car les pièces sont déjà demandés !';

    procedure CreateCustomer();
    var
        RecCustomer : Record "18";
    begin
        //--> à ajouter test sur Customer No exist or not
          // Rec.TESTFIELD("Customer No.");
           TESTFIELD(Name);
           TESTFIELD(Address);
           TESTFIELD("Post Code");
           TESTFIELD(City);
           TESTFIELD(County);
          //TMP KAIS IMPORT OR TESTFIELD("Phone No.");
           RecCustomer.INSERT(TRUE);
           RecCustomer.Name:=Name;
           RecCustomer."Name 2":="Name 2";
           RecCustomer.Address:=Address;
           RecCustomer."Address 2":="Address 2";
           RecCustomer."Post Code":="Post Code";
           RecCustomer.City:=City;
           RecCustomer.County:=County;
           RecCustomer."Country/Region Code":="Country/Region Code";
           RecCustomer.Contact:=Contact;
           RecCustomer."Phone No.":="Phone No.";
           RecCustomer.MODIFY;
           PAGE.RUN(PAGE::"Customer Card",RecCustomer);
    end;

    procedure CreateServiceItem();
    var
        RecServiceItem : Record "5940";
    begin

        // Test des champs obligatoires
           RecGservicemgtsetup.GET;
           RecServiceItem.SETCURRENTKEY("Item No.","Serial No.");
           RecServiceItem.SETRANGE(RecServiceItem."Serial No.",VIN);
           //RecServiceItem.SETfilter(RecServiceItem."Customer No.",'<>%1',RecGservicemgtsetup."Insurance default Account");
           IF RecServiceItem.FINDFIRST THEN
            ERROR('Le Numéro de chassis %1 existe\client %2',VIN,RecServiceItem."Customer No.") ;

           IF STRLEN(VIN) <> 17 THEN
            ERROR('La longeur du numérode chassis doit être égale à 17 caractères');


           Rec.TESTFIELD("Customer No.");
           RecServiceItem.INSERT(TRUE);
           RecServiceItem."Customer No.":="Customer No.";
           RecServiceItem."Item No.":="Vehicle No.";
           RecServiceItem.Matricule:=Matricule;
           //RecServiceItem."Item Description":=
           //RecServiceItem.Description:=

           RecServiceItem."Serial No." := VIN ;
           RecServiceItem.MODIFY;
           "Service Item No." := RecServiceItem."No." ;
           PAGE.RUN(PAGE::"Service Item Card",RecServiceItem);
    end;

    procedure CreateWarrantyCard();
    var
        RecServiceOrderHeader : Record "5900";
        RecServiceItemLine : Record "5901";
        RecControl : Record "60009";
        DatFinGarantieProlonge : Date;
        DatDebutGarantieProlonge : Date;
    begin
        //SM MAZDA19
        IF Warranty THEN
          ERROR(TXT50000);
        
        IF NOT RecControl.GET("Reception No") THEN
         ERROR(TXT50009);
        
        IF RecControl.Kilometrage = 0 THEN
          ERROR(TXT50009);
        
        TESTFIELD("Type de garantie");
        
        IF "Type de garantie" =  "Type de garantie"::"Garantie  Constructeur" THEN BEGIN
          //IF ("Warranty End Date" < TODAY) AND ("N° acceptation constructeur"='') THEN
            //ERROR(TXT50012);
          //IF ("Warranty End Date" <= TODAY) AND  (RecControl.Kilometrage > 100000)AND ("N° acceptation constructeur"='') THEN
            //ERROR(TXT50012);
        END;
          //<<-----NM100417-----Suite la demande de MR Responsable de Garantie--------
        IF "Type de garantie" =  "Type de garantie"::"Garantie  Prolongé" THEN BEGIN
          DatFinGarantieProlonge := CALCDATE('3A',"Date Mise en Circulation");
          IF (DatFinGarantieProlonge < TODAY) AND (NOT "Garantie prolongée exception") THEN
             ERROR(TXT50011);
          IF (DatFinGarantieProlonge < TODAY) AND (RecControl.Kilometrage>= 100000)AND (NOT "Garantie prolongée exception")THEN
            ERROR(TXT50011);
        END;
           //>>-----NM100417--------Suite la demande de MR Responsable de Garantie--------
        
        RecServiceOrderHeader.RESET;
        RecServiceOrderHeader.SETRANGE("Reception No","Reception No");
        //IF RecServiceOrderHeader.FINDFIRST THEN BEGIN
        
          Warranty := TRUE;
          "Warranty Status":="Warranty Status"::"Fiche créée";
          "Warranty Card Created By"  := USERID ;
          "Warranty Creation Date"    := CURRENTDATETIME;
         // "Warranty Status" := 0;
          MODIFY;
          COMMIT;
          PAGE.RUNMODAL(PAGE::"Warranty Card",Rec);
        //END;
        /* ELSE BEGIN
          ERROR(TXT50001)
        END;*/
        
        
        //END SM

    end;

    procedure Navigate();
    var
        LPageNavigate : Page "344";
    begin
        //LPageNavigate.SetDoc(,"Reception No");
        //LPageNavigate.RUN;
    end;

    local procedure FctGetInfoServiceITem() : Boolean;
    var
        LRecCarteGriseLigne : Record "60016";
        LREcServiceItem : Record "5940";
        LRecWarehouseEntry : Record "7312";
        LRecBinContent : Record "7302";
        LRecBin : Record "7354";
        LRecListedeVINenavarie : Record "50077";
    begin
        /*TMP KT 160817 Avarie Demande AMLREcServiceItem.RESET;
        LREcServiceItem.SETRANGE("Serial No.",VIN);
        LREcServiceItem.FINDFIRST;
        LRecWarehouseEntry.RESET;
        LRecWarehouseEntry.SETRANGE("Serial No.",VIN);
        IF LRecWarehouseEntry.FINDLAST THEN BEGIN
          LRecBin.GET(LRecWarehouseEntry."Bin Code");
        IF LRecBin."Not available"=FALSE THEN
          EXIT(FALSE);
        END ELSE EXIT(FALSE);*/
        //KT 160817
        LRecListedeVINenavarie.RESET;
        LRecListedeVINenavarie.SETRANGE(VIN,VIN);
        LRecListedeVINenavarie.SETRANGE("Reception No.",'');
        LRecListedeVINenavarie.SETRANGE(Traiter,FALSE);
        IF LRecListedeVINenavarie.FINDFIRST THEN BEGIN
          LRecListedeVINenavarie.CALCFIELDS("En cours de traitement");
          IF NOT LRecListedeVINenavarie."En cours de traitement" THEN
          EXIT(TRUE)
          ELSE EXIT(FALSE);
          END ELSE
          EXIT(FALSE);
        //END KT

    end;

    local procedure "FctClientFacturé"();
    var
        LRecServiceHeader : Record "5900";
        LRecServiceMgtSetup : Record "5911";
        LRecServiceHeader1 : Record "5900";
    begin
        //KT 080817 Changer client facturé si type changé
        IF "Service Type"="Service Type"::"Big Service" THEN
        IF "Status SR"="Status SR"::"Commande Crée" THEN BEGIN
          LRecServiceMgtSetup.GET;
          LRecServiceHeader.RESET;
          LRecServiceHeader.SETRANGE("Document Type",LRecServiceHeader."Document Type"::Order);
          LRecServiceHeader.SETRANGE("Reception No","Reception No");
          LRecServiceHeader.FINDFIRST;
          LRecServiceHeader1.GET(LRecServiceHeader."Document Type",LRecServiceHeader."No.");
          LRecServiceHeader1.SetHideValidationDialog(TRUE);
          CASE "Type de garantie" OF
            "Type de garantie"::Compagne: BEGIN
              LRecServiceHeader1.VALIDATE("Bill-to Customer No.",LRecServiceMgtSetup."Client Facturé Ass. Const.");
              LRecServiceHeader1.MODIFY;
            END;
            "Type de garantie"::"Garantie  Constructeur": BEGIN
              LRecServiceHeader1.VALIDATE("Bill-to Customer No.",LRecServiceMgtSetup."Client Facturé Ass. Const.");
              LRecServiceHeader1.MODIFY;
            END;
            "Type de garantie"::"Garantie  Prolongé":BEGIN
              LRecServiceHeader1.VALIDATE("Bill-to Customer No.",LRecServiceMgtSetup."Client Garantie Prolongé");
              LRecServiceHeader1.MODIFY;
            END;
            "Type de garantie"::"Payant par Client": BEGIN
              LRecServiceHeader1.VALIDATE("Bill-to Customer No.",LRecServiceHeader."Customer No.");
              LRecServiceHeader1.MODIFY;
            END;
          END;
        END;
        //END KT
    end;
}

